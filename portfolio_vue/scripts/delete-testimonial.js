#!/usr/bin/env node
// Remove um depoimento já publicado no site.
// Uso: npm run excluir -- <id>
// (rode "npm run depoimentos" para ver os ids disponíveis)

import { readFileSync, writeFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const TESTIMONIALS_FILE = resolve(root, 'src/data/testimonials.json')

const id = process.argv[2]
if (!id) {
  console.error('Uso: npm run excluir -- <id>')
  console.error('(rode "npm run depoimentos" para ver os ids disponíveis)')
  process.exit(1)
}

execFileSync('git', ['pull'], { cwd: root, stdio: 'inherit' })

const testimonials = existsSync(TESTIMONIALS_FILE)
  ? JSON.parse(readFileSync(TESTIMONIALS_FILE, 'utf-8'))
  : []
const index = testimonials.findIndex((t) => t.id === id)
if (index === -1) {
  console.error(
    `Nenhum depoimento publicado com id "${id}". Rode "npm run depoimentos" para ver a lista.`
  )
  process.exit(1)
}
const [removed] = testimonials.splice(index, 1)

writeFileSync(TESTIMONIALS_FILE, JSON.stringify(testimonials, null, 2) + '\n')

execFileSync('git', ['add', TESTIMONIALS_FILE], { cwd: root })
execFileSync(
  'git',
  ['commit', '-m', `chore: remove depoimento de ${removed.name}`],
  { cwd: root, stdio: 'inherit' }
)
execFileSync('git', ['push'], { cwd: root, stdio: 'inherit' })

console.log('\nRemovido! Sai do site após o próximo deploy (leva cerca de 1 minuto).\n')
