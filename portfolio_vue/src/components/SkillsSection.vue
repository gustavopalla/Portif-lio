<template>
  <section id="skills" class="skills">
    <div class="container">
      <h2 class="section-title">Habilidades</h2>
      <div class="skills-grid">
        <div v-for="skill in skills" :key="skill.name" class="skill-card glass-card">
          <component :is="skill.icon" class="skill-icon" :style="{ color: skill.color }" />
          <span class="skill-name">{{ skill.name }}</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { 
  Database, 
  Github, 
  Globe, 
  Layout, 
  Zap, 
  Code2 
} from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

const skillsGrid = ref(null);

const skills = [
  { name: 'Flutter', icon: Layout, color: '#02569B' },
  { name: 'SQL', icon: Database, color: '#94a3b8' },
  { name: 'Git/GitHub', icon: Github, color: '#ffffff' },
  { name: 'API REST', icon: Globe, color: '#f97316' },
  { name: 'NodeJS', icon: Code2, color: '#339933' },
  { name: 'TypeScript', icon: Zap, color: '#3178C6' },
  { name: 'Supabase', icon: Zap, color: '#3ECF8E' },
];

onMounted(() => {
  gsap.fromTo(".skill-card", 
    { 
      y: 30, 
      opacity: 0 
    },
    {
      y: 0,
      opacity: 1,
      duration: 0.6,
      stagger: 0.1,
      ease: "power2.out",
      scrollTrigger: {
        trigger: ".skills-grid",
        start: "top 90%",
        toggleActions: "play none none none"
      }
    }
  );
});
</script>

<style scoped>
.skills {
  padding: 100px 0;
}

.section-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 60px;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 24px;
}

.skill-card {
  padding: 40px 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 16px;
  text-align: center;
}

.skill-icon {
  width: 40px;
  height: 40px;
  transition: transform 0.3s ease;
}

.skill-card:hover .skill-icon {
  transform: scale(1.2) rotate(5deg);
}

.skill-name {
  font-weight: 500;
  color: var(--text-secondary);
}

.skill-card:hover .skill-name {
  color: var(--text-primary);
}
</style>
