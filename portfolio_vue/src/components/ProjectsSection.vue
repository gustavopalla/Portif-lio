<template>
  <section id="projetos" class="projects">
    <div class="container">
      <span class="eyebrow">Exemplos do meu trabalho</span>
      <h2 class="section-title">
        Páginas feitas para <em>trazer cliente</em>.
      </h2>
      <p class="section-lead">
        Cada página abaixo está no ar e você pode abrir e navegar agora mesmo,
        do jeito que o seu cliente veria.
      </p>

      <!-- Destaque: o tipo de página que eu vendo -->
      <div class="featured-list">
        <article
          v-for="(project, index) in featured"
          :key="project.title"
          class="featured-card"
          :ref="el => featuredRefs[index] = el"
        >
          <div class="featured-visual">
            <div class="browser">
              <div class="browser-bar">
                <span class="dot"></span><span class="dot"></span><span class="dot"></span>
              </div>
              <img
                :src="project.image"
                :alt="`Página do projeto ${project.title}`"
                class="shot"
                loading="lazy"
              />
            </div>
          </div>

          <div class="featured-details">
            <span class="kind">{{ project.kind }}</span>
            <h3 class="featured-title">{{ project.title }}</h3>
            <p class="featured-description">{{ project.description }}</p>

            <ul class="delivers">
              <li v-for="item in project.delivers" :key="item">
                <Check :size="15" class="check" />
                <span>{{ item }}</span>
              </li>
            </ul>

            <a
              :href="project.url"
              target="_blank"
              rel="noopener"
              class="btn primary featured-cta"
            >
              Abrir a página no ar
              <ExternalLink :size="17" />
            </a>
          </div>
        </article>
      </div>

      <!-- Projetos técnicos: separados para não diluir o foco de venda -->
      <div class="technical">
        <div class="technical-head">
          <h3 class="technical-title">Outros projetos que desenvolvi</h3>
          <p class="technical-lead">
            Aplicativos e sistemas que construí para praticar e resolver
            problemas reais — se o seu projeto for além de um site, isso
            também está no meu alcance.
          </p>
        </div>

        <div class="technical-grid">
          <a
            v-for="project in technical"
            :key="project.title"
            :href="project.url"
            target="_blank"
            rel="noopener"
            class="tech-card"
          >
            <div class="tech-shot-wrap">
              <img
                v-if="project.image"
                :src="project.image"
                :alt="`Interface do projeto ${project.title}`"
                class="tech-shot"
                loading="lazy"
              />
              <!-- Sem screenshot ainda: painel com a inicial, para o card
                   não ficar com imagem quebrada nem com buraco no layout. -->
              <div v-else class="tech-fallback" aria-hidden="true">
                {{ project.title.charAt(0) }}
              </div>
            </div>
            <div class="tech-body">
              <h4 class="tech-title">{{ project.title }}</h4>
              <p class="tech-description">{{ project.description }}</p>
              <span class="tech-link">
                Ver projeto <ArrowUpRight :size="15" />
              </span>
            </div>
          </a>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { Check, ExternalLink, ArrowUpRight } from 'lucide-vue-next'
import { animateWhenReady } from '../lib/motion.js'

const featuredRefs = ref([])

// Página do tipo que eu vendo — é ela que carrega a prova social.
const featured = [
  {
    title: 'Dimarte Autosom',
    kind: 'Landing page · Comércio local',
    description:
      'Página para uma loja de som automotivo, criada para transformar quem chega pelo Google ou pelo Instagram em um orçamento no WhatsApp — sem o cliente precisar ligar ou ir até a loja.',
    delivers: [
      'Pedido de orçamento direto no WhatsApp',
      'Separa quem quer orçamento de quem quer agendar',
      'Preparada para aparecer nas buscas do Google',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://dimarteautosom.vercel.app/',
    image: '/dimarte.png',
  },
  {
    title: 'Di Vitto Pizzaria',
    kind: 'Landing page · Restaurante local',
    description:
      'Página para uma pizzaria de forno a lenha em São Paulo, feita para converter quem chega pelo Instagram ou pelo Google direto em um pedido — sem obrigar o cliente a escolher entre WhatsApp e iFood.',
    delivers: [
      'Botões diretos para pedido no WhatsApp e no iFood',
      'Cardápio e localização sempre visíveis',
      'Fotos e vídeo do forno a lenha em destaque',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://divittopizzaria.vercel.app/',
    image: '/divitto.jpg',
  },
]

// Projetos técnicos — ficam fora do fluxo principal de venda.
const technical = [
  {
    title: 'Forge',
    description:
      'Sistema web para personal trainers montarem as planilhas de treino dos alunos e exportarem tudo em PDF.',
    url: 'https://gym-forge-app-six.vercel.app',
    image: '/forge.png',
  },
  {
    title: 'BookFinder',
    description:
      'Buscador que facilita encontrar livros em PDF na internet, feito para funcionar tanto no computador quanto no celular.',
    url: 'https://book-finder-lilac-six.vercel.app/',
    // Sem screenshot salva ainda — o card usa o painel de fallback.
    image: null,
  },
  {
    title: 'AirMouse',
    description:
      'Aplicativo que transforma o celular em um mouse sem fio, usando os sensores de movimento do aparelho.',
    url: 'https://github.com/gustavopalla/AirMouse---App',
    image: '/airmouse.jpeg',
  },
]

onMounted(() => animateWhenReady(async () => {
  const { gsap } = await import('gsap')
  const { ScrollTrigger } = await import('gsap/ScrollTrigger')
  gsap.registerPlugin(ScrollTrigger)

  featuredRefs.value.forEach(el => {
    if (!el) return
    gsap.fromTo(
      el,
      { opacity: 0, y: 36 },
      {
        opacity: 1,
        y: 0,
        duration: 0.9,
        ease: 'power3.out',
        scrollTrigger: { trigger: el, start: 'top 88%', once: true },
      }
    )
  })

  gsap.fromTo(
    '.tech-card',
    { opacity: 0, y: 26 },
    {
      opacity: 1,
      y: 0,
      duration: 0.7,
      stagger: 0.1,
      ease: 'power3.out',
      scrollTrigger: { trigger: '.technical-grid', start: 'top 90%', once: true },
    }
  )
}))
</script>

<style scoped>
.projects {
  padding: var(--space-section) 0;
  background: var(--bg-alt);
}

.eyebrow {
  display: flex;
  margin-bottom: 16px;
}

.section-title {
  margin-bottom: 16px;
}

.section-lead {
  color: var(--ink-soft);
  max-width: 560px;
  margin-bottom: 56px;
}

/* --- Destaque --- */
.featured-list {
  display: flex;
  flex-direction: column;
  gap: 40px;
}

.featured-card {
  display: grid;
  grid-template-columns: 1.15fr 1fr;
  gap: 48px;
  align-items: center;
  padding: 40px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-sm);
}

.browser {
  border-radius: var(--radius-md);
  overflow: hidden;
  border: 1px solid var(--border);
  background: var(--bg-alt);
  box-shadow: var(--shadow-md);
}

.browser-bar {
  display: flex;
  align-items: center;
  gap: 6px;
  height: 32px;
  padding: 0 13px;
  background: var(--bg-alt);
  border-bottom: 1px solid var(--border);
}

.browser-bar .dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--border-strong);
}

/* A imagem mantém a proporção real e ancora no topo: evita o corte
   estranho que acontecia quando a screenshot larga era esticada
   para preencher uma coluna estreita. */
.shot {
  display: block;
  width: 100%;
  height: auto;
}

.kind {
  display: inline-block;
  font-family: var(--font-mono);
  font-size: 0.7rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--accent);
  background: var(--accent-soft);
  padding: 5px 12px;
  border-radius: 100px;
  margin-bottom: 16px;
}

.featured-title {
  font-size: clamp(1.7rem, 3vw, 2.2rem);
  margin-bottom: 14px;
}

.featured-description {
  color: var(--ink-soft);
  margin-bottom: 24px;
}

.delivers {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-bottom: 32px;
}

.delivers li {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  font-size: 0.95rem;
  color: var(--ink-soft);
}

.check {
  color: var(--teal);
  flex-shrink: 0;
  margin-top: 4px;
}

.featured-cta {
  align-self: flex-start;
}

/* --- Projetos técnicos --- */
.technical {
  margin-top: 88px;
  padding-top: 56px;
  border-top: 1px solid var(--border-strong);
}

.technical-head {
  max-width: 620px;
  margin-bottom: 36px;
}

.technical-title {
  font-size: 1.4rem;
  margin-bottom: 10px;
}

.technical-lead {
  color: var(--ink-soft);
  font-size: 0.98rem;
}

.technical-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 24px;
}

.tech-card {
  display: flex;
  flex-direction: column;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  overflow: hidden;
  text-decoration: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
}

.tech-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-md);
  border-color: var(--border-strong);
}

/* Altura fixa + object-fit contém o recorte da screenshot dentro do
   card, em vez de deixá-la transbordar sobre o texto. */
.tech-shot-wrap {
  height: 150px;
  overflow: hidden;
  background: var(--bg-alt);
  border-bottom: 1px solid var(--border);
}

.tech-shot {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top center;
  transition: transform 0.5s ease;
}

.tech-card:hover .tech-shot {
  transform: scale(1.04);
}

.tech-fallback {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--dark-panel);
  color: var(--on-dark);
  font-family: var(--font-display);
  font-size: 2.6rem;
  font-weight: 600;
}

.tech-body {
  padding: 22px;
  display: flex;
  flex-direction: column;
  flex: 1;
}

.tech-title {
  font-size: 1.12rem;
  margin-bottom: 8px;
}

.tech-description {
  font-size: 0.9rem;
  color: var(--ink-soft);
  line-height: 1.6;
  margin-bottom: 18px;
  flex: 1;
}

.tech-link {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--ink);
}

.tech-card:hover .tech-link {
  color: var(--accent);
}

@media (max-width: 992px) {
  .featured-card {
    grid-template-columns: 1fr;
    gap: 32px;
    padding: 24px;
  }

  .technical {
    margin-top: 64px;
  }
}

@media (max-width: 480px) {
  .featured-card {
    padding: 18px;
  }

  .featured-cta {
    width: 100%;
  }
}
</style>
