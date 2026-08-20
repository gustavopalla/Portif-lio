<template>
  <div class="page">
    <header class="topbar">
      <div class="container topbar-inner">
        <a href="/" class="logo">
          <span class="logo-dot"></span>
          Gustavo Palla
        </a>
        <a href="/" class="back">
          <ArrowLeft :size="16" />
          Voltar para o site
        </a>
      </div>
    </header>

    <main class="container content">
      <span class="eyebrow">Perfil técnico</span>
      <h1 class="title">Sobre o desenvolvedor</h1>
      <p class="lead">
        Esta página é o meu perfil profissional detalhado — formação, trajetória
        e stack. Se você chegou aqui procurando contratar um site,
        <a href="/">a página principal</a> explica melhor como eu trabalho.
      </p>

      <section class="block">
        <h2 class="block-title">Stack e ferramentas</h2>
        <div class="stack-grid">
          <div v-for="group in stack" :key="group.title" class="stack-card">
            <h3 class="stack-title">{{ group.title }}</h3>
            <ul class="stack-list">
              <li v-for="item in group.items" :key="item">{{ item }}</li>
            </ul>
          </div>
        </div>
      </section>

      <section class="block">
        <h2 class="block-title">Experiência</h2>
        <div v-for="job in experience" :key="job.company" class="entry">
          <span class="entry-period">{{ job.period }}</span>
          <h3 class="entry-role">{{ job.role }}</h3>
          <p class="entry-company">{{ job.company }}</p>
          <p class="entry-description">{{ job.description }}</p>
        </div>
      </section>

      <section class="block">
        <h2 class="block-title">Formação</h2>
        <div v-for="course in education" :key="course.title" class="entry">
          <span class="entry-period">{{ course.period }}</span>
          <h3 class="entry-role">{{ course.title }}</h3>
          <p class="entry-company">{{ course.institution }}</p>
          <span class="status">{{ course.status }}</span>
        </div>
      </section>

      <section class="block cta-block">
        <h2 class="block-title">Contato</h2>
        <p class="cta-text">
          Aberto a conversas sobre projetos, freelas e oportunidades.
        </p>
        <div class="cta-links">
          <a :href="WA.contact" target="_blank" rel="noopener" class="btn primary">
            WhatsApp
          </a>
          <a :href="`mailto:${EMAIL}`" class="btn secondary">{{ EMAIL }}</a>
        </div>
      </section>
    </main>

    <footer class="footer">
      <div class="container">
        <p>© {{ new Date().getFullYear() }} Gustavo Palla</p>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ArrowLeft } from 'lucide-vue-next'
import { WA, EMAIL } from './lib/contact.js'

const stack = [
  {
    title: 'Front-end',
    items: ['Vue.js', 'React', 'Vite', 'JavaScript', 'TypeScript', 'HTML5 / CSS3'],
  },
  {
    title: 'Mobile',
    items: ['Flutter', 'Dart', 'Flutter Web'],
  },
  {
    title: 'Back-end e dados',
    items: ['Node.js', 'Supabase', 'PostgreSQL', 'APIs REST'],
  },
  {
    title: 'Infra e ferramentas',
    items: ['Git', 'Vercel', 'Meta Cloud API', 'Figma'],
  },
]

const experience = [
  {
    period: '2026 — Presente',
    role: 'Consultor de Implantação Júnior',
    company: 'TAB — Think About Business',
    description:
      'Suporte e implantação do sistema SE Suite, atendimento técnico a usuários e apoio na configuração de processos e relatórios.',
  },
]

const education = [
  {
    title: 'Sistemas de Informação',
    institution: 'UNIP',
    period: '2024 — 2028',
    status: 'Cursando',
  },
]
</script>

<style scoped>
.page {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--bg);
}

.topbar {
  border-bottom: 1px solid var(--border);
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
  color: var(--ink);
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
  color: var(--ink-soft);
  text-decoration: none;
  transition: color 0.25s ease;
}

.back:hover {
  color: var(--accent);
}

.content {
  flex: 1;
  padding: 72px 24px 96px;
  max-width: 820px;
}

.eyebrow {
  display: flex;
  margin-bottom: 16px;
}

.title {
  font-size: clamp(2rem, 4.5vw, 2.8rem);
  margin-bottom: 18px;
}

.lead {
  color: var(--ink-soft);
  margin-bottom: 64px;
  max-width: 620px;
}

.lead a {
  color: var(--accent);
  font-weight: 500;
}

.block {
  padding-top: 40px;
  margin-top: 40px;
  border-top: 1px solid var(--border);
}

.block-title {
  font-size: 1.3rem;
  margin-bottom: 26px;
}

.stack-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
}

.stack-card {
  padding: 22px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
}

.stack-title {
  font-size: 0.98rem;
  margin-bottom: 12px;
}

.stack-list {
  list-style: none;
  display: flex;
  flex-wrap: wrap;
  gap: 7px;
}

.stack-list li {
  font-size: 0.82rem;
  color: var(--ink-soft);
  background: var(--bg-alt);
  border: 1px solid var(--border);
  padding: 4px 11px;
  border-radius: 100px;
}

.entry {
  padding: 24px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  margin-bottom: 16px;
}

.entry-period {
  font-family: var(--font-mono);
  font-size: 0.75rem;
  color: var(--muted);
}

.entry-role {
  font-size: 1.1rem;
  margin: 8px 0 4px;
}

.entry-company {
  font-size: 0.93rem;
  color: var(--accent);
  font-weight: 500;
  margin-bottom: 12px;
}

.entry-description {
  font-size: 0.93rem;
  line-height: 1.65;
  color: var(--ink-soft);
}

.status {
  display: inline-block;
  font-size: 0.78rem;
  font-weight: 600;
  color: var(--teal);
  background: var(--teal-soft);
  padding: 5px 13px;
  border-radius: 100px;
}

.cta-text {
  color: var(--ink-soft);
  margin-bottom: 22px;
}

.cta-links {
  display: flex;
  gap: 14px;
  flex-wrap: wrap;
}

.footer {
  padding: 28px 0;
  border-top: 1px solid var(--border);
  font-size: 0.83rem;
  color: var(--muted);
  text-align: center;
}

@media (max-width: 560px) {
  .content {
    padding: 48px 20px 72px;
  }

  .cta-links .btn {
    width: 100%;
  }
}
</style>
