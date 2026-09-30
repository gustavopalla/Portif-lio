import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'node:path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  build: {
    rollupOptions: {
      // Páginas estáticas: a home (venda), o perfil técnico (fora do
      // fluxo comercial), a página de avaliação (link privado por token) e
      // uma página de detalhes por case (cliente real).
      input: {
        main: resolve(__dirname, 'index.html'),
        devProfile: resolve(__dirname, 'sobre-o-dev/index.html'),
        avaliar: resolve(__dirname, 'avaliar/index.html'),
        'projeto-jonas-vitorino': resolve(__dirname, 'projetos/jonas-vitorino/index.html'),
      },
    },
  },
})
