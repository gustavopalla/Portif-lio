import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'node:path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  build: {
    rollupOptions: {
      // Duas páginas estáticas: a home (venda) e o perfil técnico,
      // que fica fora do fluxo comercial.
      input: {
        main: resolve(__dirname, 'index.html'),
        devProfile: resolve(__dirname, 'sobre-o-dev/index.html'),
      },
    },
  },
})
