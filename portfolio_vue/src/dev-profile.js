import { createApp, createSSRApp } from 'vue'
import './assets/main.css'
import DevProfile from './DevProfile.vue'

const container = document.querySelector('#app')

const app = container.hasChildNodes()
  ? createSSRApp(DevProfile)
  : createApp(DevProfile)
app.mount(container)
