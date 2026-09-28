#!/usr/bin/env node
// Gera um link único de avaliação para um cliente específico.
// Uso: npm run gerar-link -- "Nome do Cliente"
//
// Roda só na sua máquina (nunca é exposto no site) — é assim que a
// geração de link fica restrita a quem tem este repositório clonado.

import { readFileSync, writeFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { randomUUID } from 'node:crypto'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const SITE_URL = 'https://gustavopalladev.com.br'
const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const PENDING_FILE = resolve(root, 'reviews-data/pending-reviews.json')

const clientName = process.argv.slice(2).join(' ').trim()
if (!clientName) {
  console.error('Uso: npm run gerar-link -- "Nome do Cliente"')
  process.exit(1)
}

execFileSync('git', ['pull'], { cwd: root, stdio: 'inherit' })

const pending = existsSync(PENDING_FILE)
  ? JSON.parse(readFileSync(PENDING_FILE, 'utf-8'))
  : []

const token = randomUUID()
pending.push({
  token,
  clientName,
  createdAt: new Date().toISOString(),
  usedAt: null,
})
writeFileSync(PENDING_FILE, JSON.stringify(pending, null, 2) + '\n')

execFileSync('git', ['add', PENDING_FILE], { cwd: root })
execFileSync(
  'git',
  ['commit', '-m', `chore: gera link de avaliação para ${clientName}`],
  { cwd: root, stdio: 'inherit' }
)
execFileSync('git', ['push'], { cwd: root, stdio: 'inherit' })

console.log('\nLink pronto — manda esse aqui pro cliente:\n')
console.log(`${SITE_URL}/avaliar/?token=${token}\n`)
