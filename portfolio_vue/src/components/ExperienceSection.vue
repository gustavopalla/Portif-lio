<template>
  <section id="experience" class="experience">
    <div class="container">
      <h2 class="section-title">Experiências</h2>
      <div class="timeline">
        <div v-for="exp in experiences" :key="exp.company" class="experience-card glass-card">
          <div class="exp-header">
            <span class="period">{{ exp.period }}</span>
            <h3 class="role">{{ exp.role }}</h3>
            <h4 class="company">{{ exp.company }}</h4>
          </div>
          <p class="description">{{ exp.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

const experiences = [
  {
    period: '2026 — Presente',
    role: 'Consultor de Implantação Júnior',
    company: 'TAB - Think About Business',
    description: 'Atuação no suporte e implantação do sistema SE Suite, suporte técnico aos usuários.'
  }
];

onMounted(() => {
  gsap.from(".experience-card", {
    x: -30,
    opacity: 0,
    duration: 0.8,
    stagger: 0.2,
    ease: "power2.out"
  });
});
</script>

<style scoped>
.experience {
  padding: 100px 0;
}

.section-title {
  font-size: 2.5rem;
  margin-bottom: 60px;
}

.timeline {
  display: flex;
  flex-direction: column;
  gap: 32px;
}

.experience-card {
  padding: 40px;
  border-radius: 24px;
}

.exp-header {
  margin-bottom: 24px;
}

.period {
  font-size: 0.85rem;
  color: var(--text-secondary);
  opacity: 0.6;
  display: block;
  margin-bottom: 8px;
}

.role {
  font-size: 1.5rem;
  margin-bottom: 4px;
}

.company {
  color: var(--primary-accent);
  font-weight: 500;
  font-size: 1.1rem;
}

.description {
  color: var(--text-secondary);
  line-height: 1.8;
  max-width: 800px;
}
</style>
