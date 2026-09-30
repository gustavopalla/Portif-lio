<template>
  <section id="projetos" class="projects">
    <div class="container">
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
          <a
            :href="isCase(project) ? `/projetos/${project.slug}/` : project.url"
            :target="isCase(project) ? undefined : '_blank'"
            :rel="isCase(project) ? undefined : 'noopener'"
            class="featured-visual"
            :aria-label="isCase(project)
              ? `Ver detalhes do projeto ${project.title}`
              : `Abrir a página ${project.title}`"
          >
            <img
              :src="project.image"
              :alt="`Página do projeto ${project.title}`"
              class="shot"
              loading="lazy"
            />
            <span class="visit-pill">
              {{ isCase(project) ? 'Ver detalhes' : 'Abrir no ar' }} <ArrowUpRight :size="16" />
            </span>
          </a>

          <div class="featured-details">
            <span class="number" aria-hidden="true">
              {{ String(index + 1).padStart(2, '0') }}
            </span>
            <p class="meta">
              <span class="status" :class="project.status">
                {{ isCase(project) ? 'Case' : 'Projeto de demonstração' }}
              </span>
              <span class="kind">{{ project.kind }}</span>
            </p>
            <h3 class="featured-title">{{ project.title }}</h3>
            <p class="featured-description">{{ project.description }}</p>

            <ul class="delivers">
              <li v-for="item in project.delivers" :key="item">
                <Check :size="15" class="check" />
                <span>{{ item }}</span>
              </li>
            </ul>

            <div class="featured-actions">
              <!-- Só o case tem página de detalhes; as demos vão direto ao site. -->
              <a
                v-if="isCase(project)"
                :href="`/projetos/${project.slug}/`"
                class="btn primary"
              >
                Saber mais sobre o projeto
                <ArrowRight :size="17" />
              </a>
              <a
                :href="project.url"
                target="_blank"
                rel="noopener"
                class="btn"
                :class="isCase(project) ? 'ghost' : 'primary'"
              >
                Abrir a página no ar
                <ExternalLink :size="16" />
              </a>
            </div>
          </div>
        </article>
      </div>

      <!-- Projetos técnicos: separados para não diluir o foco de venda -->
      <div class="technical">
        <div class="technical-head">
          <h3 class="technical-title">Outros projetos que desenvolvi</h3>
          <p class="technical-lead">
            Aplicativos e sistemas que construí para praticar e resolver
            problemas reais, se o seu projeto for além de um site, isso
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
import { Check, ExternalLink, ArrowUpRight, ArrowRight } from 'lucide-vue-next'
import { animateWhenReady } from '../lib/motion.js'
import { featured } from '../data/projects.js'

const featuredRefs = ref([])
const isCase = project => project.status === 'case'

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
/* Seção escura: quebra o ritmo claro do resto da página e dá peso
   aos projetos, que são a prova principal do que eu vendo. */
.projects {
  padding: calc(var(--space-section) + 16px) 0;
  background: var(--dark-panel);
  color: var(--on-dark-soft);
}

.section-title {
  color: var(--on-dark);
  font-size: clamp(2.3rem, 5.2vw, 3.6rem);
  margin-bottom: 20px;
}

.section-lead {
  color: var(--on-dark-soft);
  font-size: 1.1rem;
  max-width: 560px;
  margin-bottom: 88px;
}

/* --- Destaque --- */
.featured-list {
  display: flex;
  flex-direction: column;
  gap: 112px;
}

.featured-card {
  display: grid;
  grid-template-columns: 1.55fr 1fr;
  gap: 64px;
  align-items: center;
}

/* Layout alternado: a imagem troca de lado a cada projeto */
.featured-card:nth-child(even) {
  grid-template-columns: 1fr 1.55fr;
}

.featured-card:nth-child(even) .featured-visual {
  order: 2;
}

/* Proporção fixa + ancorada no topo: todas as capas ficam do mesmo
   tamanho, mesmo com screenshots de proporções diferentes. */
.featured-visual {
  position: relative;
  display: block;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: var(--radius-lg);
  border: 1px solid rgba(243, 241, 234, 0.1);
  background: var(--dark-panel-alt);
  box-shadow: 0 40px 80px -30px rgba(0, 0, 0, 0.7);
}

.shot {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top center;
  transition: transform 0.7s cubic-bezier(0.2, 0.7, 0.2, 1);
}

.featured-visual:hover .shot,
.featured-visual:focus-visible .shot {
  transform: scale(1.05);
}

.visit-pill {
  position: absolute;
  right: 18px;
  bottom: 18px;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 10px 16px;
  border-radius: 100px;
  background: var(--on-dark);
  color: var(--ink);
  font-size: 0.85rem;
  font-weight: 600;
  opacity: 0;
  transform: translateY(8px);
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.featured-visual:hover .visit-pill,
.featured-visual:focus-visible .visit-pill {
  opacity: 1;
  transform: translateY(0);
}

.number {
  display: block;
  font-family: var(--font-display);
  font-size: clamp(3.5rem, 7vw, 5.5rem);
  font-weight: 600;
  line-height: 1;
  letter-spacing: -0.04em;
  color: transparent;
  -webkit-text-stroke: 1px rgba(243, 241, 234, 0.28);
  margin-bottom: 20px;
}

.meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px 16px;
  margin-bottom: 18px;
  padding-top: 18px;
  border-top: 1px solid rgba(243, 241, 234, 0.14);
  font-family: var(--font-mono);
  font-size: 0.72rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.status {
  color: var(--on-dark-soft);
}

/* O case ganha só cor e um traço antes do texto, sem caixa. */
.status.case {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  color: var(--teal);
}

.status.case::before {
  content: '';
  width: 22px;
  height: 1px;
  background: currentColor;
}

.kind {
  color: var(--muted);
}

.featured-title {
  font-size: clamp(2rem, 3.6vw, 2.8rem);
  color: var(--on-dark);
  margin-bottom: 16px;
}

.featured-description {
  color: var(--on-dark-soft);
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
  color: var(--on-dark-soft);
}

.check {
  color: var(--teal);
  flex-shrink: 0;
  margin-top: 4px;
}

.featured-actions {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
}

.projects .btn.ghost {
  background: transparent;
  color: var(--on-dark);
  border-color: rgba(243, 241, 234, 0.25);
}

.projects .btn.ghost:hover {
  border-color: var(--on-dark);
  transform: translateY(-2px);
}

/* .btn.primary é escuro por padrão; aqui o fundo já é escuro. */
.projects .btn.primary {
  background: var(--accent);
  color: #fff;
}

.projects .btn.primary:hover {
  background: var(--on-dark);
  color: var(--ink);
}

/* --- Projetos técnicos --- */
.technical {
  margin-top: 88px;
  padding-top: 56px;
  border-top: 1px solid rgba(243, 241, 234, 0.14);
}

.technical-head {
  max-width: 620px;
  margin-bottom: 36px;
}

.technical-title {
  font-size: 1.4rem;
  color: var(--on-dark);
  margin-bottom: 10px;
}

.technical-lead {
  color: var(--on-dark-soft);
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
  background: var(--dark-panel-alt);
  border: 1px solid rgba(243, 241, 234, 0.1);
  border-radius: var(--radius-lg);
  overflow: hidden;
  text-decoration: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
}

.tech-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 24px 50px -24px rgba(0, 0, 0, 0.7);
  border-color: rgba(243, 241, 234, 0.25);
}

/* Altura fixa + object-fit contém o recorte da screenshot dentro do
   card, em vez de deixá-la transbordar sobre o texto. */
.tech-shot-wrap {
  height: 150px;
  overflow: hidden;
  background: var(--dark-panel);
  border-bottom: 1px solid rgba(243, 241, 234, 0.1);
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
  color: var(--on-dark-soft);
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
  color: var(--on-dark);
  margin-bottom: 8px;
}

.tech-description {
  font-size: 0.9rem;
  color: var(--on-dark-soft);
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
  color: var(--on-dark);
}

.tech-card:hover .tech-link {
  color: var(--accent);
}

@media (max-width: 992px) {
  .featured-list {
    gap: 80px;
  }

  .featured-card,
  .featured-card:nth-child(even) {
    grid-template-columns: 1fr;
    gap: 32px;
  }

  /* No celular a imagem sempre vem primeiro, sem alternar */
  .featured-card:nth-child(even) .featured-visual {
    order: 0;
  }

  .visit-pill {
    opacity: 1;
    transform: none;
  }

  .section-lead {
    margin-bottom: 56px;
  }

  .technical {
    margin-top: 64px;
  }
}

@media (max-width: 480px) {
  .projects {
    padding: var(--space-section-mobile) 0;
  }

  .featured-actions .btn {
    width: 100%;
  }
}
</style>
