// Pré-renderização estática.
//
// Roda depois do build do cliente e do build SSR: renderiza cada página em
// HTML e injeta dentro da <div id="app"> do arquivo já gerado pelo Vite.
// Resultado: quem abre a página (ou o robô do Google, ou o preview do
// WhatsApp) recebe o conteúdo real no HTML, sem depender do JavaScript.

import { readFile, writeFile, rm } from 'node:fs/promises'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')

const PAGES = [
  { key: 'main', html: 'dist/index.html' },
  { key: 'devProfile', html: 'dist/sobre-o-dev/index.html' },
]

const { render } = await import(
  resolve(root, 'dist-ssr/entry-server.js')
)

for (const page of PAGES) {
  const file = resolve(root, page.html)
  const template = await readFile(file, 'utf-8')
  const appHtml = await render(page.key)

  if (!template.includes('<div id="app"></div>')) {
    throw new Error(
      `Não encontrei <div id="app"></div> em ${page.html} — o HTML mudou?`
    )
  }

  const output = template.replace(
    '<div id="app"></div>',
    `<div id="app">${appHtml}</div>`
  )

  await writeFile(file, output)
  console.log(
    `pré-renderizado ${page.html} (+${(appHtml.length / 1024).toFixed(1)} KB de HTML)`
  )
}

// O bundle SSR é só um artefato intermediário; não vai para produção.
await rm(resolve(root, 'dist-ssr'), { recursive: true, force: true })
