<template>
  <section id="projects" class="projects">
    <div class="container">
      <span class="eyebrow">Trabalhos selecionados</span>
      <h2 class="section-title">Projetos</h2>
      
      <div class="projects-list">
        <div 
          v-for="(project, index) in projects" 
          :key="project.title" 
          class="project-card glass-card"
          :ref="el => projectRefs[index] = el"
        >
          <div class="project-visual">
            <img :src="project.image" :alt="project.title" class="main-img" />
            <div class="floating-tags">
              <span v-for="tag in project.tags" :key="tag" class="tag">{{ tag }}</span>
            </div>
          </div>
          
          <div class="project-details">
            <h3 class="project-title">{{ project.title }}</h3>
            <p class="project-description">{{ project.description }}</p>
            
            <div class="project-footer">
              <a :href="project.url" target="_blank" class="cta-link">
                <span>Ver projeto</span>
                <ExternalLink size="20" />
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { ExternalLink } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

const projectRefs = ref([]);

const projects = [
  {
    title: 'Forge',
    description: 'Um SaaS para personal trainers montarem e organizarem planilhas de treino para seus alunos. Cada aluno pode ter múltiplos planejamentos, com treinos divididos por dia, exercícios com séries, repetições e descanso configuráveis, edição inline e exportação da planilha em PDF pronta para enviar ao aluno.',
    tags: ['React', 'TypeScript', 'Supabase'],
    url: 'https://gym-forge-app-six.vercel.app',
    image: '/forge.png'
  },
  {
    title: 'BookFinder',
    description: 'Um buscador livros desenvolvido para facilitar a localização de arquivos PDF na internet. A ideia desse projeto veio de uma necessidade real. Minha namorada precisava facilitar a busca dela por PDFs para colocar subir no kindle que ela tem. Como ela tem Iphone, então não queria pagar uma taxa para a apple para subir minha aplicação para IOS. Então subi o projeto na vercel para que ela pudesse utilizar via web e o projeto ficou responsivo para computador e para mobile.',
    tags: ['Flutter Web/Android', 'NodeJS', 'TypeScript', 'Render', 'API Serper.dev'],
    url: 'https://book-finder-lilac-six.vercel.app/',
    image: 'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=800&auto=format&fit=crop'
  },
  {
    title: 'AirMouse',
    description: 'Este projeto transforma um smartphone em um mouse sem fio utilizando o giroscópio do dispositivo e comunicação via WebSockets. Utiliza os sensores de giroscópio (Pitch, Roll e Yaw) para traduzir inclinações do celular em deslocamento do cursor no PC.',
    tags: ['Flutter', 'NodeJS', 'TypeScript', 'WebSockets'],
    url: 'https://github.com/gustavopalla/AirMouse---App',
    image: '/airmouse.jpeg'
  },
  {
    title: 'Dimarte Autosom',
    description: 'Este projeto é uma landing page para uma loja de som automotivo. A landing page permite que os clientes agendem serviços para seus veículos, melhora a visibilidade da loja no Google (SEO), aumenta a credibilidade da loja, filtra por clientes que querem apenas orçamento ou agendamento.',
    tags: ['VueJS', 'Vite', 'Desenvolvimento Web'],
    url: 'https://dimarteautosom.vercel.app/',
    image: '/dimarte.png'
  }
];

onMounted(() => {
  projectRefs.value.forEach((el, i) => {
    gsap.fromTo(el, 
      { 
        opacity: 0, 
        y: 40,
        scale: 0.95
      },
      {
        opacity: 1,
        y: 0,
        scale: 1,
        duration: 1,
        ease: "power3.out",
        scrollTrigger: {
          trigger: el,
          start: "top 90%",
          toggleActions: "play none none none"
        }
      }
    );
  });
});
</script>

<style scoped>
.projects {
  padding: 120px 0;
  position: relative;
}

.eyebrow {
  display: flex;
  margin-bottom: 16px;
}

.section-title {
  font-size: 3rem;
  margin-bottom: 60px;
  text-align: left;
}

.projects-list {
  display: flex;
  flex-direction: column;
  gap: 60px;
}

.project-card {
  display: grid;
  grid-template-columns: 1fr 1.2fr;
  min-height: 450px;
  border-radius: var(--radius-xl);
  overflow: hidden;
  background: var(--surface);
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  transition: transform 0.4s ease, border-color 0.4s ease, box-shadow 0.4s ease;
}

.project-card:hover {
  border-color: var(--border-strong);
  box-shadow: var(--shadow-lg);
  transform: translateY(-5px);
}

.project-visual {
  position: relative;
  overflow: hidden;
  background: var(--bg-alt);
}

.main-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
}

.project-card:hover .main-img {
  transform: scale(1.05);
}

.floating-tags {
  position: absolute;
  bottom: 24px;
  left: 24px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  z-index: 10;
}

.tag {
  background: rgba(250, 248, 243, 0.9);
  backdrop-filter: blur(8px);
  color: var(--ink);
  padding: 6px 14px;
  border-radius: var(--radius-sm);
  font-size: 0.75rem;
  font-weight: 600;
  border: 1px solid var(--border);
}

.project-details {
  padding: 60px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.project-title {
  font-size: 2.5rem;
  color: var(--ink);
  margin-bottom: 24px;
}

.project-description {
  font-size: 1.05rem;
  line-height: 1.8;
  color: var(--ink-soft);
  margin-bottom: 40px;
}

.project-footer {
  margin-top: auto;
}

.cta-link {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  color: var(--on-dark);
  text-decoration: none;
  font-weight: 600;
  padding: 12px 28px;
  background: var(--ink);
  border-radius: var(--radius-md);
  transition: all 0.3s ease;
}

.cta-link:hover {
  transform: translateX(4px);
  background: var(--accent);
}

@media (max-width: 1024px) {
  .section-title {
    font-size: 2.2rem;
    margin-bottom: 40px;
    text-align: center;
  }
  
  .project-card {
    grid-template-columns: 1fr;
    min-height: auto;
  }
  
  .project-visual {
    height: 250px;
  }
  
  .project-details {
    padding: 30px 24px;
  }
  
  .project-title {
    font-size: 1.8rem;
    margin-bottom: 16px;
  }

  .project-description {
    font-size: 1rem;
    text-align: left;
    margin-bottom: 30px;
  }
}
</style>
