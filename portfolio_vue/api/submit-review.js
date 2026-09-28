// Função serverless (Vercel) que recebe uma avaliação enviada por um
// cliente pela página /avaliar/ e grava no repositório via API do
// GitHub — não existe banco de dados, o "banco" é o próprio git.
//
// Variáveis de ambiente exigidas no projeto da Vercel:
//   GITHUB_TOKEN  — fine-grained PAT com permissão "Contents: Read and
//                   write" restrita ao repositório abaixo
//   GITHUB_OWNER  — dono do repositório (ex: gustavopalla)
//   GITHUB_REPO   — nome do repositório (ex: Portif-lio)
//   GITHUB_BRANCH — branch de deploy (ex: main)

import { randomUUID } from 'node:crypto'

const PENDING_PATH = 'portfolio_vue/reviews-data/pending-reviews.json'
const SUBMITTED_PATH = 'portfolio_vue/reviews-data/submitted-reviews.json'

function githubHeaders() {
  return {
    Authorization: `Bearer ${process.env.GITHUB_TOKEN}`,
    Accept: 'application/vnd.github+json',
    'Content-Type': 'application/json',
  }
}

function apiUrl(path) {
  const { GITHUB_OWNER, GITHUB_REPO } = process.env
  return `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/contents/${path}`
}

async function readJsonFile(path) {
  const branch = process.env.GITHUB_BRANCH || 'main'
  const res = await fetch(`${apiUrl(path)}?ref=${branch}`, {
    headers: githubHeaders(),
  })
  if (!res.ok) {
    throw new Error(`Falha ao ler ${path}: ${res.status}`)
  }
  const data = await res.json()
  const content = Buffer.from(data.content, 'base64').toString('utf-8')
  return { json: JSON.parse(content), sha: data.sha }
}

async function writeJsonFile(path, json, sha, message) {
  const branch = process.env.GITHUB_BRANCH || 'main'
  const res = await fetch(apiUrl(path), {
    method: 'PUT',
    headers: githubHeaders(),
    body: JSON.stringify({
      message,
      content: Buffer.from(JSON.stringify(json, null, 2) + '\n').toString(
        'base64'
      ),
      sha,
      branch,
    }),
  })
  if (!res.ok) {
    const detail = await res.text()
    throw new Error(`Falha ao gravar ${path}: ${res.status} ${detail}`)
  }
}

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método não permitido.' })
    return
  }

  try {
    const { token, name, role, rating, text, website } = req.body || {}

    // Honeypot: campo escondido no formulário que só um robô preencheria.
    // Responde como se tivesse dado certo, sem gravar nada, pra não
    // ensinar o robô a evitar o campo.
    if (website) {
      res.status(200).json({ ok: true })
      return
    }

    const ratingNum = Number(rating)
    const nameOk = typeof name === 'string' && name.trim().length > 0 && name.trim().length <= 100
    const textOk = typeof text === 'string' && text.trim().length > 0 && text.trim().length <= 1000
    const tokenOk = typeof token === 'string' && token.trim().length > 0
    const ratingOk = Number.isInteger(ratingNum) && ratingNum >= 1 && ratingNum <= 5

    if (!tokenOk || !nameOk || !textOk || !ratingOk) {
      res.status(400).json({ error: 'Preencha nome, nota (1 a 5) e comentário.' })
      return
    }

    const pending = await readJsonFile(PENDING_PATH)
    const entry = pending.json.find((p) => p.token === token)

    if (!entry) {
      res.status(400).json({ error: 'Link inválido.' })
      return
    }
    if (entry.usedAt) {
      res.status(400).json({ error: 'Este link já foi utilizado.' })
      return
    }

    const submitted = await readJsonFile(SUBMITTED_PATH)
    submitted.json.push({
      id: randomUUID(),
      token,
      name: name.trim(),
      role: typeof role === 'string' ? role.trim().slice(0, 100) : '',
      rating: ratingNum,
      text: text.trim(),
      submittedAt: new Date().toISOString(),
    })
    await writeJsonFile(
      SUBMITTED_PATH,
      submitted.json,
      submitted.sha,
      `chore: nova avaliação recebida de ${name.trim()}`
    )

    entry.usedAt = new Date().toISOString()
    await writeJsonFile(
      PENDING_PATH,
      pending.json,
      pending.sha,
      `chore: marca link de avaliação como usado (${name.trim()})`
    )

    res.status(200).json({ ok: true })
  } catch (err) {
    console.error(err)
    res.status(500).json({ error: 'Erro ao enviar avaliação. Tente novamente em instantes.' })
  }
}
