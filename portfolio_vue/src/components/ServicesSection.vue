<template>
  <section id="servicos" class="services">
    <div class="container">
      <span class="eyebrow eyebrow-centered">O que eu faço</span>
      <h2 class="section-title centered">
        Escolha o tamanho do <em>seu projeto</em>.
      </h2>
      <p class="section-lead centered">
        Cada negócio precisa de uma coisa diferente. Veja o que está incluído
        em cada formato e me chame para conversar, o orçamento eu passo no
        privado, depois de entender o que você precisa.
      </p>

      <div class="plans">
        <article
          v-for="plan in plans"
          :key="plan.name"
          class="plan"
          :class="{ featured: plan.featured }"
        >
          <span v-if="plan.badge" class="badge">{{ plan.badge }}</span>

          <div class="plan-icon">
            <component :is="plan.icon" :size="20" />
          </div>

          <h3 class="plan-name">{{ plan.name }}</h3>
          <p class="plan-pitch">{{ plan.pitch }}</p>

          <div class="plan-for">
            <span class="for-label">Ideal para</span>
            <span class="for-value">{{ plan.audience }}</span>
          </div>

          <ul class="includes">
            <li v-for="item in plan.includes" :key="item">
              <Check :size="15" class="check" />
              <span>{{ item }}</span>
            </li>
          </ul>

          <a
            :href="plan.link"
            target="_blank"
            rel="noopener"
            class="btn plan-cta"
            :class="plan.featured ? 'primary' : 'secondary'"
          >
            {{ plan.cta }}
          </a>
        </article>
      </div>

      <p class="services-footnote">
        Não trabalho com tabela fixa: o valor depende do tamanho do projeto e
        do que você já tem pronto. Me chame no WhatsApp que eu te passo um
        orçamento fechado, sem compromisso e sem insistência depois.
        <span class="asterisk">
          * O endereço próprio tem uma taxa anual de registro cobrada pelo
          órgão responsável, paga por você direto a eles. A configuração é
          por minha conta.
        </span>
      </p>
    </div>
  </section>
</template>

<script setup>
import { Check, Rocket, Globe, LifeBuoy } from 'lucide-vue-next'
import { WA } from '../lib/contact.js'

const plans = [
  {
    name: 'Landing Page',
    pitch:
      'Uma página só, feita para uma coisa: transformar quem entra em contato no seu WhatsApp.',
    audience: 'Quem ainda não tem site e quer sair do zero rápido',
    badge: 'Mais procurado',
    featured: true,
    icon: Rocket,
    cta: 'Pedir orçamento',
    link: WA.pilot,
    includes: [
      'Página completa, do topo ao rodapé',
      'Funciona no celular e no computador',
      'Botão que abre direto no seu WhatsApp',
      'Textos escritos por mim, do zero',
      'Ajustes até você aprovar',
      'Publicação e endereço na internet incluídos',
    ],
  },
  {
    name: 'Site Completo',
    pitch:
      'Mais páginas, endereço próprio e estrutura pensada para você aparecer nas buscas do Google.',
    audience: 'Quem já tem clientes e quer ser levado a sério',
    featured: false,
    icon: Globe,
    cta: 'Pedir orçamento',
    link: WA.complete,
    includes: [
      'Tudo o que tem na Landing Page',
      'Endereço próprio (seunegocio.com.br)*',
      'Várias páginas e seções',
      'Preparado para aparecer nas buscas do Google',
      'Formulário de contato com aviso por e-mail',
      'Galeria de fotos ou catálogo de serviços',
    ],
  },
  {
    name: 'Acompanhamento',
    pitch:
      'Para quem não quer mexer no site sozinho depois que ele estiver no ar.',
    audience: 'Quem prefere delegar a manutenção',
    featured: false,
    icon: LifeBuoy,
    cta: 'Saber mais',
    link: WA.care,
    includes: [
      'Alterações de texto, foto e preço quando precisar',
      'Respostas automáticas no WhatsApp',
      'Acompanhamento de quantas pessoas visitam',
      'Suporte direto comigo',
      'Sem fidelidade, cancela quando quiser',
    ],
  },
]
</script>

<style scoped>
.services {
  padding: var(--space-section) 0;
}

.centered {
  text-align: center;
}

.section-title {
  margin-bottom: 16px;
}

.section-lead {
  color: var(--ink-soft);
  max-width: 580px;
  margin: 0 auto 60px;
}

.plans {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
  align-items: stretch;
}

.plan {
  position: relative;
  display: flex;
  flex-direction: column;
  padding: 34px 30px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
}

.plan.featured {
  background: var(--dark-panel);
  border-color: var(--dark-panel);
  box-shadow: var(--shadow-lg);
}

.badge {
  position: absolute;
  top: -11px;
  left: 30px;
  font-family: var(--font-mono);
  font-size: 0.66rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  background: var(--accent);
  color: #fff;
  padding: 5px 12px;
  border-radius: 100px;
}

.plan-icon {
  width: 46px;
  height: 46px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-md);
  background: var(--accent-soft);
  color: var(--accent);
  margin-bottom: 20px;
}

.featured .plan-icon {
  background: rgba(255, 90, 43, 0.16);
}

.plan-name {
  font-size: 1.3rem;
  margin-bottom: 10px;
}

.featured .plan-name {
  color: var(--on-dark);
}

.plan-pitch {
  font-size: 0.93rem;
  line-height: 1.6;
  color: var(--ink-soft);
  margin-bottom: 22px;
}

.featured .plan-pitch {
  color: var(--on-dark-soft);
}

.plan-for {
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding: 14px 16px;
  border-radius: var(--radius-md);
  background: var(--bg-alt);
  margin-bottom: 24px;
}

.featured .plan-for {
  background: rgba(255, 255, 255, 0.06);
}

.for-label {
  font-family: var(--font-mono);
  font-size: 0.64rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--muted);
}

.featured .for-label {
  color: var(--on-dark-soft);
}

.for-value {
  font-size: 0.88rem;
  font-weight: 600;
  color: var(--ink);
  line-height: 1.4;
}

.featured .for-value {
  color: var(--on-dark);
}

.includes {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-bottom: 30px;
  flex: 1;
}

.includes li {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  font-size: 0.91rem;
  line-height: 1.55;
  color: var(--ink-soft);
}

.featured .includes li {
  color: var(--on-dark-soft);
}

.check {
  color: var(--teal);
  flex-shrink: 0;
  margin-top: 3px;
}

.plan-cta {
  width: 100%;
  margin-top: auto;
}

/* No card escuro o botão primário precisa inverter para não sumir. */
.featured .plan-cta.primary {
  background: var(--accent);
  color: #fff;
}

.featured .plan-cta.primary:hover {
  background: #fff;
  color: var(--ink);
}

.services-footnote {
  margin: 36px auto 0;
  text-align: center;
  font-size: 0.9rem;
  color: var(--ink-soft);
  max-width: 600px;
}

.asterisk {
  display: block;
  margin-top: 12px;
  font-size: 0.81rem;
  color: var(--muted);
}

@media (max-width: 992px) {
  .plans {
    grid-template-columns: 1fr;
    max-width: 460px;
    margin: 0 auto;
  }
}
</style>
