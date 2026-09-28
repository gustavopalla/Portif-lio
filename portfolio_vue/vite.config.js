import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'node:path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  build: {
    rollupOptions: {
      // Páginas estáticas: a home (venda), o perfil técnico (fora do
      // fluxo comercial) e a página de avaliação (link privado por token).
      input: {
        main: resolve(__dirname, 'index.html'),
        devProfile: resolve(__dirname, 'sobre-o-dev/index.html'),
        avaliar: resolve(__dirname, 'avaliar/index.html'),
      },
    },
  },
})
