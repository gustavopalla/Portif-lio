import { createApp, createSSRApp } from 'vue'
import './assets/main.css'
import ProjectCase from './ProjectCase.vue'

const container = document.querySelector('#app')
// O slug vem do atributo data-slug do <html> de cada página de projeto.
const slug = document.documentElement.dataset.slug
const props = { slug }

const app = container.hasChildNodes()
  ? createSSRApp(ProjectCase, props)
  : createApp(ProjectCase, props)
app.mount(container)
