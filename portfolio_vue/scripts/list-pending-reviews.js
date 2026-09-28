#!/usr/bin/env node
// Lista avaliações enviadas por clientes que ainda não foram aprovadas.
// Uso: npm run pendentes

import { readFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const SUBMITTED_FILE = resolve(root, 'reviews-data/submitted-reviews.json')

execFileSync('git', ['pull'], { cwd: root, stdio: 'inherit' })

const submitted = existsSync(SUBMITTED_FILE)
  ? JSON.parse(readFileSync(SUBMITTED_FILE, 'utf-8'))
  : []

if (submitted.length === 0) {
  console.log('\nNenhuma avaliação pendente de aprovação.\n')
  process.exit(0)
}

console.log(`\n${submitted.length} avaliação(ões) pendente(s):\n`)
for (const r of submitted) {
  console.log('─'.repeat(50))
  console.log(`id:         ${r.id}`)
  console.log(`nome:       ${r.name}${r.role ? ' (' + r.role + ')' : ''}`)
  console.log(`nota:       ${'★'.repeat(r.rating)}${'☆'.repeat(5 - r.rating)}`)
  console.log(`comentário: ${r.text}`)
  console.log(`enviado em: ${r.submittedAt}`)
}
console.log('─'.repeat(50))
console.log('\nPra aprovar: npm run aprovar -- <id>')
console.log('Pra recusar: npm run recusar -- <id>\n')
