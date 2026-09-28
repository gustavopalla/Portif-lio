#!/usr/bin/env node
// Aprova uma avaliação pendente: move de reviews-data/submitted-reviews.json
// para src/data/testimonials.json, que é o arquivo que o site realmente
// exibe (GuaranteesSection.vue). Uso: npm run aprovar -- <id>

import { readFileSync, writeFileSync, existsSync } from 'node:fs'
import { execFileSync } from 'node:child_process'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const SUBMITTED_FILE = resolve(root, 'reviews-data/submitted-reviews.json')
const TESTIMONIALS_FILE = resolve(root, 'src/data/testimonials.json')

const id = process.argv[2]
if (!id) {
  console.error('Uso: npm run aprovar -- <id>')
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

const testimonials = existsSync(TESTIMONIALS_FILE)
  ? JSON.parse(readFileSync(TESTIMONIALS_FILE, 'utf-8'))
  : []
testimonials.push({
  name: review.name,
  role: review.role || 'Cliente',
  initial: review.name.trim().charAt(0).toUpperCase(),
  text: review.text,
  rating: review.rating,
})

writeFileSync(SUBMITTED_FILE, JSON.stringify(submitted, null, 2) + '\n')
writeFileSync(TESTIMONIALS_FILE, JSON.stringify(testimonials, null, 2) + '\n')

execFileSync('git', ['add', SUBMITTED_FILE, TESTIMONIALS_FILE], { cwd: root })
execFileSync(
  'git',
  ['commit', '-m', `feat: aprova avaliação de ${review.name}`],
  { cwd: root, stdio: 'inherit' }
)
execFileSync('git', ['push'], { cwd: root, stdio: 'inherit' })

console.log('\nAprovada! Vai aparecer no site após o próximo deploy (leva cerca de 1 minuto).\n')
