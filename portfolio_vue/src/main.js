import { createApp, createSSRApp } from 'vue'
import './assets/main.css'
import App from './App.vue'

const container = document.querySelector('#app')

// No build de produção o HTML já vem pré-renderizado, então hidratamos o
// que está na tela. Em desenvolvimento o container está vazio e uma
// montagem normal evita os avisos de mismatch de hidratação.
const app = container.hasChildNodes() ? createSSRApp(App) : createApp(App)
app.mount(container)
