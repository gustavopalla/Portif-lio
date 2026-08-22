<template>
  <section id="sobre" class="about">
    <div class="container about-grid">
      <div class="about-text">
        <h2 class="section-title">
          Você fala <em>direto comigo</em>.<br />
          Do orçamento ao site no ar.
        </h2>

        <p class="bio">
          Sou o Gustavo, desenvolvedor em Campinas. Não sou agência: quem
          atende, escreve, desenha e programa a sua página sou eu. Isso quer
          dizer que você não vai ficar esperando resposta de um atendente,
          nem explicando a mesma coisa três vezes para pessoas diferentes.
        </p>
        <p class="bio">
          Estou construindo meu portfólio de landing pages agora, e isso tem
          um efeito prático para você: cada projeto que entra recebe atenção
          total, porque o resultado dele também é o meu cartão de visitas.
          Você leva uma página bem feita, eu levo um bom trabalho para mostrar.
        </p>

        <div class="pillars">
          <div v-for="pillar in pillars" :key="pillar.title" class="pillar">
            <div class="pillar-icon">
              <component :is="pillar.icon" :size="18" />
            </div>
            <div>
              <h3 class="pillar-title">{{ pillar.title }}</h3>
              <p class="pillar-text">{{ pillar.text }}</p>
            </div>
          </div>
        </div>
      </div>

      <aside class="about-card">
        <img src="/gustavo.jpg" alt="Gustavo Palla" class="avatar" width="76" height="76" />
        <p class="card-name">Gustavo Palla</p>
        <p class="card-role">Desenvolvedor web · Campinas, SP</p>

        <ul class="card-facts">
          <li v-for="fact in facts" :key="fact">
            <Check :size="15" class="card-check" />
            <span>{{ fact }}</span>
          </li>
        </ul>

        <a :href="WA.contact" target="_blank" rel="noopener" class="btn primary card-cta">
          Falar comigo no WhatsApp
        </a>
      </aside>
    </div>
  </section>
</template>

<script setup>
import { Check, Zap, ShieldCheck, Smartphone } from 'lucide-vue-next'
import { WA } from '../lib/contact.js'

// Benefícios de negócio, não características técnicas.
const pillars = [
  {
    title: 'Feita para o celular',
    text: 'A maioria dos seus clientes vai abrir a página pelo celular. É lá que ela precisa funcionar bem, e é assim que eu construo.',
    icon: Smartphone,
  },
  {
    title: 'Rápida de abrir',
    text: 'Página lenta perde cliente antes de carregar. As minhas são feitas com tecnologia moderna, leves e rápidas até em internet ruim.',
    icon: Zap,
  },
  {
    title: 'O site é seu',
    text: 'Sem mensalidade obrigatória para manter no ar e sem ficar preso a mim. O endereço e o conteúdo ficam no seu nome.',
    icon: ShieldCheck,
  },
]

const facts = [
  'Atendimento direto, sem intermediário',
  'Página no ar em até 7 dias',
  'Ajustes até você aprovar',
  'Atendo Campinas e todo o Brasil',
]
</script>

<style scoped>
.about {
  padding: var(--space-section) 0;
  background: var(--bg-alt);
}

.about-grid {
  display: grid;
  grid-template-columns: 1.35fr 1fr;
  gap: 64px;
  align-items: start;
}

.section-title {
  margin-bottom: 24px;
}

.bio {
  color: var(--ink-soft);
  margin-bottom: 18px;
  max-width: 560px;
}

.pillars {
  display: flex;
  flex-direction: column;
  gap: 20px;
  margin-top: 40px;
}

.pillar {
  display: flex;
  gap: 16px;
}

.pillar-icon {
  width: 40px;
  height: 40px;
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-md);
  background: var(--surface);
  border: 1px solid var(--border);
  color: var(--accent);
}

.pillar-title {
  font-size: 1rem;
  margin-bottom: 4px;
}

.pillar-text {
  font-size: 0.92rem;
  line-height: 1.6;
  color: var(--ink-soft);
}

/* --- Cartão lateral --- */
.about-card {
  position: sticky;
  top: 100px;
  padding: 32px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  text-align: center;
}

.avatar {
  display: block;
  width: 76px;
  height: 76px;
  margin: 0 auto 18px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid var(--border);
}

.card-name {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.14rem;
  color: var(--ink);
}

.card-role {
  font-size: 0.87rem;
  color: var(--muted);
  margin-bottom: 26px;
}

.card-facts {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 12px;
  text-align: left;
  margin-bottom: 28px;
}

.card-facts li {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  font-size: 0.91rem;
  color: var(--ink-soft);
}

.card-check {
  color: var(--teal);
  flex-shrink: 0;
  margin-top: 3px;
}

.card-cta {
  width: 100%;
}

@media (max-width: 992px) {
  .about-grid {
    grid-template-columns: 1fr;
    gap: 44px;
  }

  .about-card {
    position: static;
  }
}
</style>
