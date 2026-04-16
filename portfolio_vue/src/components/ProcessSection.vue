<template>
  <section id="process" class="process">
    <div class="container">
      <h2 class="section-title">Como eu trabalho</h2>
      <p class="section-subtitle">Um processo transparente focado em transformar sua visão em realidade de alta conversão.</p>

      <div class="process-grid">
        <div 
          v-for="(step, index) in steps" 
          :key="step.title" 
          class="process-card glass-card"
          :ref="el => stepRefs[index] = el"
        >
          <div class="step-number">{{ index + 1 }}</div>
          <div class="step-icon">
            <component :is="step.icon" size="32" />
          </div>
          <h3 class="step-title">{{ step.title }}</h3>
          <p class="step-description">{{ step.description }}</p>
          
          <div v-if="index < steps.length - 1" class="step-connector"></div>
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
  ClipboardList, 
  Map, 
  Layers, 
  Code2, 
  CheckCircle2, 
  Server 
} from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

const stepRefs = ref([]);

const steps = [
  {
    title: 'Briefing',
    description: 'Entendimento profundo do seu negócio, objetivos e público-alvo para alinhar expectativas.',
    icon: ClipboardList
  },
  {
    title: 'Planejamento',
    description: 'Definição da arquitetura da informação, tecnologias e estratégia de conversão.',
    icon: Map
  },
  {
    title: 'Prototipação',
    description: 'Criação do design visual (UI) e experiência do usuário (UX) com foco na sua marca.',
    icon: Layers
  },
  {
    title: 'Desenvolvimento',
    description: 'Codificação limpa, rápida e otimizada (SEO) usando as melhores tecnologias do mercado.',
    icon: Code2
  },
  {
    title: 'Aprovação',
    description: 'Revisão conjunta, ajustes finos e validação total de cada funcionalidade do projeto.',
    icon: CheckCircle2
  },
  {
    title: 'Hospedagem',
    description: 'Publicação no ambiente de produção, configuração de domínio e monitoramento inicial.',
    icon: Server
  }
];

onMounted(() => {
  // Ensure layout is stable
  setTimeout(() => {
    ScrollTrigger.refresh();
    
    // Explicitly animate from to ensure visibility control
    gsap.fromTo(".process-card", 
      { 
        opacity: 0, 
        y: 40 
      },
      {
        scrollTrigger: {
          trigger: ".process-grid",
          start: "top 90%",
          toggleActions: "play none none none"
        },
        y: 0,
        opacity: 1,
        duration: 0.8,
        stagger: 0.15,
        ease: "power3.out"
      }
    );
  }, 500);
});
</script>

<style scoped>
.process {
  padding: 120px 0;
  position: relative;
}

.section-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 24px;
}

.section-subtitle {
  text-align: center;
  color: var(--text-secondary);
  font-size: 1.1rem;
  max-width: 600px;
  margin: 0 auto 80px;
  line-height: 1.6;
}

.process-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 40px;
  position: relative;
}

.process-card {
  padding: 50px 40px;
  text-align: center;
  position: relative;
  border-radius: 30px;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.step-number {
  position: absolute;
  top: 20px;
  right: 30px;
  font-size: 4rem;
  font-weight: 900;
  color: var(--primary-accent);
  opacity: 0.05;
  line-height: 1;
  pointer-events: none;
}

.step-icon {
  width: 70px;
  height: 70px;
  background: rgba(59, 130, 246, 0.1);
  border-radius: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--primary-accent);
  margin-bottom: 24px;
  transition: all 0.3s ease;
}

.process-card:hover .step-icon {
  transform: scale(1.1) rotate(5deg);
  background: rgba(59, 130, 246, 0.2);
  box-shadow: 0 0 20px rgba(59, 130, 246, 0.3);
}

.step-title {
  font-size: 1.5rem;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.step-description {
  color: var(--text-secondary);
  font-size: 1rem;
  line-height: 1.6;
}

/* Connectors shown on desktop */
@media (min-width: 1024px) {
  .process-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 768px) {
  .process-grid {
    grid-template-columns: 1fr;
    gap: 30px;
  }

  .section-title {
    font-size: 2rem;
    margin-bottom: 20px;
  }

  .section-subtitle {
    margin-bottom: 60px;
  }

  .process-card {
    padding: 30px 20px;
  }
  
  .step-number {
    font-size: 2.5rem;
  }
}
</style>
