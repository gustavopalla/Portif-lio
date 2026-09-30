// Entrada usada só no build de pré-renderização.
// Roda em Node, sem DOM — por isso nenhum componente pode tocar em
// window/document fora de onMounted (que nunca dispara no servidor).

import { createSSRApp } from 'vue'
import { renderToString } from 'vue/server-renderer'
import App from './App.vue'
import DevProfile from './DevProfile.vue'
import AvaliarForm from './AvaliarForm.vue'
import ProjectCase from './ProjectCase.vue'

const pages = {
  main: App,
  devProfile: DevProfile,
  avaliar: AvaliarForm,
  case: ProjectCase,
}

/**
 * @param {keyof typeof pages} page
 * @param {Record<string, unknown>} [props] props do componente (ex.: slug do projeto)
 * @returns {Promise<string>} HTML da aplicação, pronto para injetar no #app
 */
export async function render(page = 'main', props = {}) {
  const component = pages[page]
  if (!component) throw new Error(`Página desconhecida: ${page}`)
  return renderToString(createSSRApp(component, props))
}
