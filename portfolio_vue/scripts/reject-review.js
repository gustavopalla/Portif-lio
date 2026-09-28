#!/usr/bin/env node
// Recusa (descarta) uma avaliação pendente, sem publicá-la no site.
// Uso: npm run recusar -- <id>

import { readFileSync, writeFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const SUBMITTED_FILE = resolve(root, 'reviews-data/submitted-reviews.json')

const id = process.argv[2]
if (!id) {
  console.error('Uso: npm run recusar -- <id>')
  console.error('(rode "npm run pendentes" para ver os ids disponíveis)')
  process.exit(1)
}

execFileSync('git', ['pull'], { cwd: root, stdio: 'inherit' })

const submitted = existsSync(SUBMITTED_FILE)
  ? JSON.parse(readFileSync(SUBMITTED_FILE, 'utf-8'))
  : []
const index = submitted.findIndex((r) => r.id === id)
if (index === -1) {
  console.error(
    `Nenhuma avaliação pendente com id "${id}". Rode "npm run pendentes" para ver a lista.`
  )
  process.exit(1)
}
const [review] = submitted.splice(index, 1)

writeFileSync(SUBMITTED_FILE, JSON.stringify(submitted, null, 2) + '\n')

execFileSync('git', ['add', SUBMITTED_FILE], { cwd: root })
execFileSync(
  'git',
  ['commit', '-m', `chore: recusa avaliação de ${review.name}`],
  { cwd: root, stdio: 'inherit' }
)
execFileSync('git', ['push'], { cwd: root, stdio: 'inherit' })

console.log('\nAvaliação recusada e removida da lista de pendentes.\n')
