#!/usr/bin/env node
// Lista os depoimentos já publicados no site (src/data/testimonials.json).
// Uso: npm run depoimentos

import { readFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const TESTIMONIALS_FILE = resolve(root, 'src/data/testimonials.json')

execFileSync('git', ['pull'], { cwd: root, stdio: 'inherit' })

const testimonials = existsSync(TESTIMONIALS_FILE)
  ? JSON.parse(readFileSync(TESTIMONIALS_FILE, 'utf-8'))
  : []

if (testimonials.length === 0) {
  console.log('\nNenhum depoimento publicado ainda.\n')
  process.exit(0)
}

console.log(`\n${testimonials.length} depoimento(s) publicado(s):\n`)
for (const t of testimonials) {
  console.log('─'.repeat(50))
  console.log(`id:         ${t.id || '(sem id — depoimento antigo/manual)'}`)
  console.log(`nome:       ${t.name}${t.role ? ' (' + t.role + ')' : ''}`)
  console.log(`nota:       ${'★'.repeat(t.rating)}${'☆'.repeat(5 - t.rating)}`)
  console.log(`comentário: ${t.text}`)
}
console.log('─'.repeat(50))
console.log('\nPra excluir um: npm run excluir -- <id>\n')
