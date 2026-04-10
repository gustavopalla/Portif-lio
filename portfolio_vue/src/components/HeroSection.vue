<template>
  <section id="home" class="hero">
    <div class="container hero-content">
      <div class="hero-text" ref="heroText">
        <h2 class="greeting">Olá,</h2>
        <h1 class="name title-gradient">Gustavo Palla,</h1>
        <h2 class="role">Estudante e <span class="accent">Futuro Dev</span></h2>
        
        <p class="description">
          Transformando ideias em experiências digitais excepcionais. 
          Especializado em criar aplicações mobile modernas e sistemas escaláveis.
        </p>

        <div class="actions">
          <a href="mailto:impalla404@gmail.com" class="btn primary">CONTATO</a>
          <a href="/curriculo.pdf" target="_blank" class="btn secondary">CURRÍCULO</a>
        </div>

        <div class="social-links">
          <a href="https://linkedin.com/in/gustavopalla" target="_blank" class="social-icon">
            <Linkedin size="24" />
          </a>
          <a href="https://github.com/gustavopalla" target="_blank" class="social-icon">
            <Github size="24" />
          </a>
        </div>
      </div>

      <div class="hero-code" ref="codeBlock">
        <div class="code-window glass-card">
          <div class="window-header">
            <div class="dots">
              <span class="dot red"></span>
              <span class="dot yellow"></span>
              <span class="dot green"></span>
            </div>
            <span class="filename">developer.js</span>
          </div>
          <div class="code-content">
            <div class="line-numbers">
              <span v-for="i in 14" :key="i">{{ i }}</span>
            </div>
            <pre><code ref="typingCode"></code></pre>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { Linkedin, Github } from 'lucide-vue-next';
import { gsap } from 'gsap';
import { TextPlugin } from 'gsap/TextPlugin';

gsap.registerPlugin(TextPlugin);

const heroText = ref(null);
const codeBlock = ref(null);
const typingCode = ref(null);

const codeString = `class Role {
  constructor() {
    this.nome = "Gustavo Palla";
    this.cargo = "Consultor de Implantação JR e Futuro Dev";
    this.skills = [
      "Flutter", "Dart", 
      "Supabase", "REST APIs",
      "Git", "NodeJS", "Typescript"
    ];
  }

  build() {
    return "Apps incríveis";
  }
}`;

onMounted(() => {
  // Hero Text Animation
  gsap.from(heroText.value.children, {
    y: 30,
    opacity: 0,
    duration: 0.8,
    stagger: 0.1,
    ease: "power3.out"
  });

  // Code Block Animation
  gsap.from(codeBlock.value, {
    x: 50,
    opacity: 0,
    duration: 1,
    delay: 0.5,
    ease: "power3.out"
  });

  // Typing Animation
  gsap.to(typingCode.value, {
    duration: 3,
    text: codeString,
    delay: 1.5,
    ease: "none"
  });
});
</script>

<style scoped>
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  padding-top: 80px;
  position: relative;
  overflow: hidden;
}

.hero-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: center;
}

.greeting {
  font-size: 1.5rem;
  color: var(--text-secondary);
  margin-bottom: 8px;
}

.name {
  font-size: 4rem;
  line-height: 1.1;
  margin-bottom: 12px;
}

.role {
  font-size: 2rem;
  font-weight: 500;
  margin-bottom: 32px;
}

.role .accent {
  color: var(--primary-accent);
  text-shadow: 0 0 20px var(--accent-glow);
}

.description {
  font-size: 1.1rem;
  color: var(--text-secondary);
  max-width: 500px;
  margin-bottom: 40px;
}

.actions {
  display: flex;
  gap: 20px;
  margin-bottom: 40px;
}

.btn {
  padding: 14px 32px;
  border-radius: 30px;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.3s ease;
}

.btn.primary {
  background: var(--primary-accent);
  color: white;
  box-shadow: 0 4px 15px rgba(124, 58, 237, 0.3);
}

.btn.primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(124, 58, 237, 0.5);
}

.btn.secondary {
  border: 1px solid var(--border-color);
  color: var(--text-primary);
  background: rgba(255, 255, 255, 0.03);
}

.btn.secondary:hover {
  background: rgba(255, 255, 255, 0.08);
  border-color: var(--text-secondary);
}

.social-links {
  display: flex;
  gap: 24px;
}

.social-icon {
  color: var(--text-secondary);
  transition: all 0.3s ease;
}

.social-icon:hover {
  color: var(--primary-accent);
  transform: translateY(-3px);
  filter: drop-shadow(0 0 8px var(--primary-accent));
}

/* Code Window */
.code-window {
  width: 100%;
  max-width: 550px;
  aspect-ratio: 4/3;
  display: flex;
  flex-direction: column;
}

.window-header {
  height: 40px;
  background: rgba(255, 255, 255, 0.03);
  display: flex;
  align-items: center;
  padding: 0 16px;
  border-bottom: 1px solid var(--border-color);
}

.dots {
  display: flex;
  gap: 8px;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}

.red { background: #ff5f56; }
.yellow { background: #ffbd2e; }
.green { background: #27c93f; }

.filename {
  margin-left: 20px;
  font-family: 'Fira Code', monospace;
  font-size: 0.8rem;
  color: var(--text-secondary);
}

.code-content {
  flex: 1;
  padding: 24px;
  display: flex;
  font-family: 'Fira Code', monospace;
  font-size: 0.9rem;
  overflow: hidden;
}

.line-numbers {
  display: flex;
  flex-direction: column;
  padding-right: 20px;
  border-right: 1px solid var(--border-color);
  color: rgba(148, 163, 184, 0.3);
  text-align: right;
  user-select: none;
}

pre {
  margin-left: 20px;
  color: var(--text-primary);
}

code {
  color: var(--secondary-accent);
  white-space: pre-wrap;
}

@media (max-width: 992px) {
  .hero-content {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 40px;
  }

  .hero-text {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .description {
    margin: 0 auto 40px;
  }

  .hero-code {
    display: flex;
    justify-content: center;
  }
  
  .name {
    font-size: 3rem;
  }
}
</style>
