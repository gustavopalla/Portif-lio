<template>
  <div class="page">
    <header class="topbar">
      <div class="container topbar-inner">
        <a href="/" class="logo">
          <span class="logo-dot"></span>
          Gustavo Palla
        </a>
        <a href="/#projetos" class="back">
          <ArrowLeft :size="16" />
          Todos os projetos
        </a>
      </div>
    </header>

    <main v-if="project">
      <section class="hero container">
        <div class="hero-text">
          <p class="meta">
            <span class="status">Case</span>
            <span class="kind">{{ project.kind }}</span>
          </p>
          <h1 class="title">{{ project.title }}</h1>
          <p class="lead">{{ project.description }}</p>
          <a :href="project.url" target="_blank" rel="noopener" class="btn primary">
            Abrir a página no ar
            <ExternalLink :size="17" />
          </a>
        </div>
        <div class="hero-visual">
          <img :src="project.image" :alt="`Página do projeto ${project.title}`" />
        </div>
      </section>

      <section class="block container">
        <h2 class="block-title">O que a página entrega</h2>
        <ul class="delivers">
          <li v-for="item in project.delivers" :key="item">
            <Check :size="18" class="check" />
            <span>{{ item }}</span>
          </li>
        </ul>
      </section>

      <section v-if="project.video" class="block container media">
        <div class="media-text">
          <p class="eyebrow">Vídeo</p>
          <h2 class="block-title">{{ project.video.title }}</h2>
          <p class="media-desc">{{ project.video.text }}</p>
        </div>
        <video
          class="video"
          :src="project.video.src"
          :poster="project.video.poster"
          controls
          playsinline
          preload="none"
        ></video>
      </section>

      <section v-if="project.pdf" class="block container media reverse">
        <div class="media-text">
          <p class="eyebrow">Material entregue</p>
          <h2 class="block-title">{{ project.pdf.title }}</h2>
          <p class="media-desc">{{ project.pdf.text }}</p>
          <a :href="project.pdf.src" target="_blank" rel="noopener" class="btn primary">
            Abrir o PDF completo
            <Download :size="17" />
          </a>
        </div>
        <a :href="project.pdf.src" target="_blank" rel="noopener" class="pdf-cover">
          <img :src="project.pdf.cover" :alt="`Capa do ${project.pdf.title}`" loading="lazy" />
        </a>
      </section>

      <section class="cta container">
        <h2 class="cta-title">Quer uma página assim para o seu negócio?</h2>
        <p class="cta-text">
          Me conta o que você faz e eu respondo com uma ideia e um valor,
          sem compromisso.
        </p>
        <a :href="WA.contact" target="_blank" rel="noopener" class="btn primary">
          <MessageCircle :size="19" />
          Chamar no WhatsApp
        </a>
      </section>
    </main>

    <main v-else class="container missing">
      <h1 class="title">Projeto não encontrado</h1>
      <a href="/#projetos" class="btn primary">Ver todos os projetos</a>
    </main>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { ArrowLeft, Check, Download, ExternalLink, MessageCircle } from 'lucide-vue-next'
import { featured } from './data/projects.js'
import { WA } from './lib/contact.js'

const props = defineProps({ slug: { type: String, required: true } })
const project = computed(() => featured.find(p => p.slug === props.slug))
</script>

<style scoped>
.page {
  min-height: 100vh;
  background: var(--dark-panel);
  color: var(--on-dark-soft);
}

.topbar {
  border-bottom: 1px solid rgba(243, 241, 234, 0.12);
  padding: 22px 0;
}

.topbar-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.05rem;
  color: var(--on-dark);
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 10px;
}

.logo-dot {
  width: 8px;
  height: 8px;
  background: var(--accent);
  border-radius: 50%;
}

.back {
  display: inline-flex;
  align-items: center;
  gap: 7px;
  font-size: 0.88rem;
  font-weight: 500;
  color: var(--on-dark-soft);
  text-decoration: none;
  transition: color 0.25s ease;
}

.back:hover {
  color: var(--accent);
}

.btn.primary {
  background: var(--accent);
  color: #fff;
}

.btn.primary:hover {
  background: var(--on-dark);
  color: var(--ink);
}

.hero {
  display: grid;
  grid-template-columns: 1fr 1.3fr;
  gap: 64px;
  align-items: center;
  padding-top: 80px;
  padding-bottom: 56px;
}

.meta,
.eyebrow {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px 16px;
  margin-bottom: 20px;
  font-family: var(--font-mono);
  font-size: 0.72rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.eyebrow {
  color: var(--accent);
}

.status {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  color: var(--teal);
}

.status::before {
  content: '';
  width: 22px;
  height: 1px;
  background: currentColor;
}

.kind {
  color: var(--muted);
}

.title {
  font-size: clamp(2.4rem, 5vw, 3.8rem);
  line-height: 1.05;
  color: var(--on-dark);
  margin-bottom: 20px;
}

.lead {
  font-size: 1.08rem;
  margin-bottom: 32px;
}

.hero-visual {
  border-radius: var(--radius-lg);
  overflow: hidden;
  border: 1px solid rgba(243, 241, 234, 0.1);
  box-shadow: 0 40px 80px -30px rgba(0, 0, 0, 0.7);
  background: var(--dark-panel-alt);
}

.hero-visual img {
  display: block;
  width: 100%;
  height: auto;
}

.block {
  padding-top: 64px;
  padding-bottom: 16px;
}

.block-title {
  font-size: clamp(1.5rem, 3vw, 2rem);
  color: var(--on-dark);
  margin-bottom: 20px;
}

.delivers {
  list-style: none;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 14px;
}

.delivers li {
  display: flex;
  gap: 12px;
  align-items: flex-start;
  padding: 18px 20px;
  background: var(--dark-panel-alt);
  border: 1px solid rgba(243, 241, 234, 0.1);
  border-radius: var(--radius-md);
}

.check {
  color: var(--teal);
  flex-shrink: 0;
  margin-top: 3px;
}

.media {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 64px;
  align-items: center;
  padding-top: 96px;
}

.media.reverse .media-text {
  order: 2;
}

.media-desc {
  margin-bottom: 28px;
  max-width: 440px;
}

.video {
  width: 100%;
  max-width: 340px;
  aspect-ratio: 9 / 16;
  justify-self: center;
  border-radius: var(--radius-lg);
  background: #000;
  border: 1px solid rgba(243, 241, 234, 0.12);
  box-shadow: 0 40px 80px -30px rgba(0, 0, 0, 0.7);
}

.pdf-cover {
  justify-self: center;
  max-width: 380px;
  border-radius: var(--radius-md);
  overflow: hidden;
  border: 1px solid rgba(243, 241, 234, 0.12);
  box-shadow: 0 40px 80px -30px rgba(0, 0, 0, 0.7);
  transition: transform 0.3s ease;
}

.pdf-cover:hover {
  transform: translateY(-4px);
}

.pdf-cover img {
  display: block;
  width: 100%;
  height: auto;
}

.cta {
  text-align: center;
  padding-top: 120px;
  padding-bottom: 120px;
}

.cta-title {
  font-size: clamp(1.8rem, 3.6vw, 2.6rem);
  color: var(--on-dark);
  max-width: 640px;
  margin: 0 auto 16px;
}

.cta-text {
  max-width: 480px;
  margin: 0 auto 32px;
}

.missing {
  padding-top: 96px;
}

@media (max-width: 992px) {
  .hero,
  .media {
    grid-template-columns: 1fr;
    gap: 36px;
  }

  .hero {
    padding-top: 48px;
  }

  .media.reverse .media-text {
    order: 0;
  }

  .delivers {
    grid-template-columns: 1fr;
  }

  .media {
    padding-top: 64px;
  }
}
</style>
