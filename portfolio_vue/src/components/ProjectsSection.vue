<template>
  <section id="projects" class="projects">
    <div class="container">
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
    image: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?q=80&w=800&auto=format&fit=crop'
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

.section-title {
  font-size: 3rem;
  margin-bottom: 80px;
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
  border-radius: 40px;
  overflow: hidden;
  background: rgba(10, 10, 25, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.05);
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
  transition: transform 0.4s ease, border-color 0.4s ease;
}

.project-card:hover {
  border-color: var(--primary-accent);
  transform: translateY(-5px);
}

.project-visual {
  position: relative;
  overflow: hidden;
  background: #000;
}

.main-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.8;
  transition: transform 0.6s ease;
}

.project-card:hover .main-img {
  transform: scale(1.05);
  opacity: 1;
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
  background: rgba(0, 0, 0, 0.6);
  backdrop-filter: blur(8px);
  color: var(--primary-accent);
  padding: 6px 14px;
  border-radius: 20px;
  font-size: 0.75rem;
  font-weight: 600;
  border: 1px solid rgba(124, 58, 237, 0.3);
}

.project-details {
  padding: 60px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  background: linear-gradient(135deg, rgba(10,10,25,0.8) 0%, rgba(15,15,35,0.9) 100%);
}

.project-title {
  font-size: 2.5rem;
  color: #fff;
  margin-bottom: 24px;
  font-weight: 800;
}

.project-description {
  font-size: 1.1rem;
  line-height: 1.8;
  color: var(--text-secondary);
  margin-bottom: 40px;
  text-align: justify;
}

.project-footer {
  margin-top: auto;
}

.cta-link {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  color: #fff;
  text-decoration: none;
  font-weight: 700;
  padding: 12px 28px;
  background: var(--primary-accent);
  border-radius: 30px;
  box-shadow: 0 10px 20px rgba(124, 58, 237, 0.3);
  transition: all 0.3s ease;
}

.cta-link:hover {
  transform: translateX(5px);
  background: #8b5cf6;
  box-shadow: 0 15px 30px rgba(124, 58, 237, 0.5);
}

@media (max-width: 1024px) {
  .project-card {
    grid-template-columns: 1fr;
    min-height: auto;
  }
  
  .project-visual {
    height: 300px;
  }
  
  .project-details {
    padding: 40px;
  }
  
  .project-title {
    font-size: 2rem;
  }
}
</style>
