import { createApp, createSSRApp } from 'vue'
import './assets/main.css'
import AvaliarForm from './AvaliarForm.vue'

const container = document.querySelector('#app')

const app = container.hasChildNodes()
  ? createSSRApp(AvaliarForm)
  : createApp(AvaliarForm)
app.mount(container)
