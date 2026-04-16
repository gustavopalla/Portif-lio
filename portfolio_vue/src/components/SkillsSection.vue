<template>
  <section id="skills" class="skills">
    <div class="container">
      <h2 class="section-title">Habilidades & Stack</h2>
      
      <div class="skills-grid">
        <div v-for="category in skillCategories" :key="category.title" class="skill-category-card glass-card">
          <div class="category-header">
            <span class="category-icon">{{ category.emoji }}</span>
            <h3 class="category-title">{{ category.title }}</h3>
          </div>
          <ul class="skill-list">
            <li v-for="skill in category.skills" :key="skill" class="skill-item">
              <Check class="check-icon" size="16" />
              <span>{{ skill }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { Check } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

const skillCategories = ref([
  {
    title: 'Frontend/Mobile',
    emoji: '🎨',
    skills: ['Flutter', 'Vue.js', 'React', 'Vite', 'HTML5', 'CSS3', 'JavaScript ES2024']
  },
  {
    title: 'Backend & DB',
    emoji: '⚙️',
    skills: ['Node.js', 'Supabase', 'PostgreSQL', 'REST APIs', 'Dart']
  },
  {
    title: 'Automações',
    emoji: '🤖',
    skills: ['n8n', 'Webhooks', 'Meta Cloud API', 'WhatsApp API']
  },
  {
    title: 'Ferramentas',
    emoji: '🔧',
    skills: ['Git', 'VS Code', 'Figma', 'Vercel']
  }
]);

onMounted(() => {
  // Wait for next tick to ensure DOM is ready
  setTimeout(() => {
    ScrollTrigger.refresh();
    
    gsap.from(".skill-category-card", {
      scrollTrigger: {
        trigger: ".skills-grid",
        start: "top 95%",
        toggleActions: "play none none none"
      },
      y: 40,
      opacity: 0,
      duration: 1,
      stagger: 0.1,
      ease: "power3.out",
      onComplete: () => {
        gsap.set(".skill-category-card", { opacity: 1, y: 0 });
      }
    });
  }, 200);
});
</script>

<style scoped>
.skills {
  padding: 120px 0;
  position: relative;
}

.section-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 50px;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 30px;
}

.skill-category-card {
  padding: 40px 32px;
  border-radius: 24px;
}

.category-header {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-bottom: 24px;
}

.category-icon {
  font-size: 2rem;
}

.category-title {
  font-size: 1.5rem;
  color: var(--text-primary);
  opacity: 0.9;
}

.skill-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.skill-item {
  display: flex;
  align-items: center;
  gap: 12px;
  color: var(--text-secondary);
  font-size: 1rem;
}

.check-icon {
  color: var(--primary-accent);
  opacity: 0.8;
}

.skill-category-card:hover {
  border-color: var(--primary-accent);
  box-shadow: 0 10px 30px rgba(59, 130, 246, 0.15);
}

@media (max-width: 768px) {
  .section-title {
    font-size: 1.8rem;
    margin-bottom: 30px;
  }

  .skills-grid {
    grid-template-columns: 1fr;
  }
}
</style>
