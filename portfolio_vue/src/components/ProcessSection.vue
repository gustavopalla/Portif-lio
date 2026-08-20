<template>
  <section id="processo" class="process">
    <div class="container">
      <span class="eyebrow eyebrow-centered">Como funciona</span>
      <h2 class="section-title centered">
        Do primeiro "oi" até a página <em>no ar</em>.
      </h2>
      <p class="section-lead centered">
        Você não precisa entender nada de tecnologia. Eu cuido da parte técnica
        e te explico tudo em português claro.
      </p>

      <ol class="steps">
        <li
          v-for="(step, index) in steps"
          :key="step.title"
          class="step"
        >
          <span class="step-number">{{ String(index + 1).padStart(2, '0') }}</span>
          <div class="step-icon">
            <component :is="step.icon" :size="22" />
          </div>
          <h3 class="step-title">{{ step.title }}</h3>
          <p class="step-description">{{ step.description }}</p>
        </li>
      </ol>
    </div>
  </section>
</template>

<script setup>
import { onMounted } from 'vue'
import { MessageSquare, PenTool, RefreshCw, Rocket } from 'lucide-vue-next'
import { animateWhenReady } from '../lib/motion.js'

const steps = [
  {
    title: 'A gente conversa',
    description:
      'Uma conversa rápida no WhatsApp para eu entender o seu negócio, quem é o seu cliente e o que você quer que ele faça ao entrar na página.',
    icon: MessageSquare,
  },
  {
    title: 'Eu crio a página',
    description:
      'Escrevo os textos e monto o visual do zero, pensado para o seu tipo de cliente. Você não precisa mandar nada pronto além de fotos e informações do negócio.',
    icon: PenTool,
  },
  {
    title: 'Você revisa',
    description:
      'Te mostro a página funcionando e ajusto o que você quiser: cor, texto, ordem das coisas. Continuo ajustando até você aprovar.',
    icon: RefreshCw,
  },
  {
    title: 'Coloco no ar',
    description:
      'Publico a página, configuro o endereço e deixo o botão de WhatsApp funcionando. A partir daí é só divulgar e receber os contatos.',
    icon: Rocket,
  },
]

onMounted(() => animateWhenReady(async () => {
  const { gsap } = await import('gsap')
  const { ScrollTrigger } = await import('gsap/ScrollTrigger')
  gsap.registerPlugin(ScrollTrigger)

  gsap.fromTo(
    '.step',
    { opacity: 0, y: 30 },
    {
      opacity: 1,
      y: 0,
      duration: 0.7,
      stagger: 0.12,
      ease: 'power3.out',
      scrollTrigger: { trigger: '.steps', start: 'top 88%', once: true },
    }
  )
}))
</script>

<style scoped>
.process {
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
  max-width: 560px;
  margin: 0 auto 64px;
}

.steps {
  list-style: none;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
  counter-reset: step;
}

.step {
  position: relative;
  padding: 32px 26px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.step:hover {
  border-color: var(--border-strong);
  box-shadow: var(--shadow-md);
}

.step-number {
  position: absolute;
  top: 22px;
  right: 24px;
  font-family: var(--font-mono);
  font-size: 0.78rem;
  color: var(--muted);
}

.step-icon {
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

.step-title {
  font-size: 1.12rem;
  margin-bottom: 10px;
}

.step-description {
  font-size: 0.92rem;
  line-height: 1.65;
  color: var(--ink-soft);
}

@media (max-width: 992px) {
  .steps {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 560px) {
  .steps {
    grid-template-columns: 1fr;
  }
}
</style>
