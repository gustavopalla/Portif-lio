<template>
  <section id="education" class="education">
    <div class="container">
      <h2 class="section-title">Formação</h2>
      <div class="education-grid">
        <div v-for="edu in education" :key="edu.title" class="education-card glass-card">
          <div class="edu-icon">
            <GraduationCap size="32" />
          </div>
          <div class="edu-info">
            <h3 class="edu-title">{{ edu.title }}</h3>
            <p class="institution">{{ edu.institution }}</p>
            <span class="period">{{ edu.period }}</span>
            <div class="status-badge">{{ edu.status }}</div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { GraduationCap } from 'lucide-vue-next';
import { onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

const education = [
  {
    title: 'Sistemas de Informação',
    institution: 'UNIP',
    period: '2024 — 2028',
    status: 'Cursando'
  }
];

onMounted(() => {
  gsap.from(".education-card", {
    scrollTrigger: {
      trigger: ".education",
      start: "top 85%",
    },
    y: 30,
    opacity: 0,
    duration: 0.8,
    ease: "power2.out"
  });
});
</script>

<style scoped>
.education {
  padding: 100px 0;
}

.section-title {
  font-size: 2.5rem;
  margin-bottom: 60px;
}

.education-grid {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.education-card {
  display: flex;
  gap: 32px;
  padding: 40px;
  align-items: flex-start;
}

.edu-icon {
  padding: 16px;
  background: rgba(59, 130, 246, 0.1);
  border-radius: 16px;
  color: var(--primary-accent);
}

.edu-title {
  font-size: 1.5rem;
  margin-bottom: 4px;
}

.institution {
  color: var(--text-secondary);
  font-size: 1.1rem;
  margin-bottom: 4px;
}

.period {
  font-size: 0.9rem;
  color: var(--text-secondary);
  opacity: 0.5;
  display: block;
  margin-bottom: 16px;
}

.status-badge {
  display: inline-block;
  padding: 6px 16px;
  background: rgba(59, 130, 246, 0.15);
  color: var(--primary-accent);
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
}

@media (max-width: 768px) {
  .education-card {
    flex-direction: column;
    gap: 20px;
    padding: 24px;
  }
}
</style>
