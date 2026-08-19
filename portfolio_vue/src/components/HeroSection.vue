<template>
  <section id="home" class="hero">
    <canvas ref="grainCanvas" class="grain-canvas"></canvas>

    <div class="container hero-content">
      <div class="hero-text" ref="heroText">
        <span class="eyebrow">Gustavo Palla · Dev Web · Campinas</span>

        <h1 class="headline">
          Sites que <em>vendem</em><br />
          enquanto você dorme.
        </h1>

        <p class="description">
          Construo landing pages de alta conversão e automações inteligentes
          para negócios que querem transformar visitantes em clientes reais.
        </p>

        <div class="actions">
          <button @click="openModal" class="btn primary">Iniciar um projeto</button>
          <a href="/curriculo.pdf" target="_blank" class="btn secondary">Currículo</a>
        </div>

        <div class="social-links">
          <a href="https://www.linkedin.com/in/gustavopalla/" target="_blank" class="social-icon" aria-label="LinkedIn">
            <Linkedin size="20" />
          </a>
          <a href="https://github.com/gustavopalla" target="_blank" class="social-icon" aria-label="GitHub">
            <Github size="20" />
          </a>
        </div>
      </div>

      <div class="hero-code" ref="codeBlock">
        <div class="code-window">
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

    <div class="scroll-hint">
      <span>Role para ver mais</span>
      <div class="scroll-line"></div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted, inject } from 'vue';
import { Linkedin, Github } from 'lucide-vue-next';
import { gsap } from 'gsap';
import { TextPlugin } from 'gsap/TextPlugin';

gsap.registerPlugin(TextPlugin);

const heroText = ref(null);
const codeBlock = ref(null);
const typingCode = ref(null);
const grainCanvas = ref(null);

const codeString = `const developer = {
  name: 'Gustavo Palla',
  focus: 'conversion & automation',
  stack: [
    'Vue.js', 'Vite',
    'n8n', 'Supabase',
    'Meta Cloud API'
  ],
  status: true // available
};`;

const openModal = inject('openContactModal');

// ---------------------------------------------------------------
// Film-grain background: idle noise that quietly breathes, and
// gets sharper/denser near the cursor for a subtle interactive feel.
// ---------------------------------------------------------------
let ctx;
let width = 0;
let height = 0;
let rafId = null;
let sectionEl = null;
let pointer = { x: -9999, y: -9999, active: 0 };

const GRAIN_SCALE = 3; // render at 1/3 resolution, upscaled by CSS pixel rendering

function resizeCanvas() {
  if (!grainCanvas.value || !sectionEl) return;
  const rect = sectionEl.getBoundingClientRect();
  width = Math.max(1, Math.floor(rect.width / GRAIN_SCALE));
  height = Math.max(1, Math.floor(rect.height / GRAIN_SCALE));
  grainCanvas.value.width = width;
  grainCanvas.value.height = height;
}

function handlePointerMove(e) {
  const rect = sectionEl.getBoundingClientRect();
  pointer.x = ((e.clientX - rect.left) / rect.width) * width;
  pointer.y = ((e.clientY - rect.top) / rect.height) * height;
}

function handlePointerEnter() {
  gsap.to(pointer, { active: 1, duration: 0.6, ease: 'power2.out' });
}

function handlePointerLeave() {
  gsap.to(pointer, { active: 0, duration: 0.8, ease: 'power2.out' });
  pointer.x = -9999;
  pointer.y = -9999;
}

function drawGrain() {
  if (ctx && width && height) {
    const imageData = ctx.createImageData(width, height);
    const buffer = imageData.data;
    const radius = width * 0.35;

    for (let i = 0; i < buffer.length; i += 4) {
      const px = (i / 4) % width;
      const py = Math.floor(i / 4 / width);
      let boost = 0;
      if (pointer.active > 0.01) {
        const dx = px - pointer.x;
        const dy = py - pointer.y;
        const dist = Math.sqrt(dx * dx + dy * dy);
        boost = Math.max(0, 1 - dist / radius) * pointer.active;
      }

      const base = 8 + boost * 30; // grain intensity
      const value = Math.random() * base;
      const alpha = (10 + boost * 26) * (Math.random() * 0.6 + 0.7);

      buffer[i] = 21;
      buffer[i + 1] = 19;
      buffer[i + 2] = 15;
      buffer[i + 3] = value + alpha;
    }

    ctx.putImageData(imageData, 0, 0);
  }
  rafId = requestAnimationFrame(drawGrain);
}

onMounted(() => {
  sectionEl = grainCanvas.value.closest('.hero');
  ctx = grainCanvas.value.getContext('2d', { willReadFrequently: true });
  resizeCanvas();
  drawGrain();

  window.addEventListener('resize', resizeCanvas);
  sectionEl.addEventListener('pointermove', handlePointerMove);
  sectionEl.addEventListener('pointerenter', handlePointerEnter);
  sectionEl.addEventListener('pointerleave', handlePointerLeave);

  // Hero Text Animation
  gsap.from(heroText.value.children, {
    y: 30,
    opacity: 0,
    duration: 0.8,
    stagger: 0.1,
    ease: 'power3.out'
  });

  // Code Block Animation
  gsap.from(codeBlock.value, {
    x: 50,
    opacity: 0,
    duration: 1,
    delay: 0.5,
    ease: 'power3.out'
  });

  // Typing Animation with preserved whitespace
  gsap.to(typingCode.value, {
    duration: 3,
    text: {
      value: codeString,
      preserveSpaces: true,
      rtl: false
    },
    delay: 1.5,
    ease: 'none'
  });
});

onUnmounted(() => {
  if (rafId) cancelAnimationFrame(rafId);
  window.removeEventListener('resize', resizeCanvas);
  if (sectionEl) {
    sectionEl.removeEventListener('pointermove', handlePointerMove);
    sectionEl.removeEventListener('pointerenter', handlePointerEnter);
    sectionEl.removeEventListener('pointerleave', handlePointerLeave);
  }
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
  background: var(--bg);
}

.grain-canvas {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  pointer-events: none;
  mix-blend-mode: multiply;
  opacity: 0.9;
}

.hero-content {
  display: grid;
  grid-template-columns: 1.1fr 0.9fr;
  gap: 60px;
  align-items: center;
  position: relative;
  z-index: 1;
}

.eyebrow {
  margin-bottom: 20px;
}

.headline {
  font-size: clamp(2.4rem, 5vw, 4rem);
  line-height: 1.05;
  margin-bottom: 24px;
}

.description {
  font-size: 1.1rem;
  color: var(--ink-soft);
  max-width: 480px;
  margin-bottom: 36px;
}

.actions {
  display: flex;
  gap: 16px;
  margin-bottom: 40px;
}

.social-links {
  display: flex;
  gap: 20px;
}

.social-icon {
  color: var(--muted);
  transition: color 0.25s ease, transform 0.25s ease;
  display: inline-flex;
}

.social-icon:hover {
  color: var(--accent);
  transform: translateY(-2px);
}

/* Code Window — intentional dark panel, contrasts the paper background */
.code-window {
  width: 100%;
  max-width: 550px;
  aspect-ratio: 4/3;
  display: flex;
  flex-direction: column;
  background: var(--dark-panel);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-lg);
  overflow: hidden;
}

.window-header {
  height: 44px;
  background: var(--dark-panel-alt);
  display: flex;
  align-items: center;
  padding: 0 16px;
  flex-shrink: 0;
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
  font-family: var(--font-mono);
  font-size: 0.8rem;
  color: var(--on-dark-soft);
}

.code-content {
  flex: 1;
  padding: 24px;
  display: flex;
  font-family: var(--font-mono);
  font-size: 0.9rem;
  overflow: hidden;
}

.line-numbers {
  display: flex;
  flex-direction: column;
  padding-right: 20px;
  border-right: 1px solid rgba(255, 255, 255, 0.08);
  color: rgba(243, 241, 234, 0.25);
  text-align: right;
  user-select: none;
}

pre {
  margin-left: 20px;
  color: var(--on-dark);
}

code {
  color: #7fd8c9;
  white-space: pre;
  display: block;
}

.scroll-hint {
  position: absolute;
  bottom: 32px;
  right: 40px;
  display: flex;
  align-items: center;
  gap: 12px;
  z-index: 1;
  color: var(--muted);
  font-family: var(--font-mono);
  font-size: 0.7rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.scroll-line {
  width: 1px;
  height: 32px;
  background: linear-gradient(var(--muted), transparent);
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
    margin: 0 auto 36px;
  }

  .hero-code {
    display: flex;
    justify-content: center;
  }

  .actions {
    flex-direction: column;
    width: 100%;
    gap: 12px;
  }

  .btn {
    width: 100%;
    text-align: center;
  }

  .scroll-hint {
    display: none;
  }
}

@media (max-width: 480px) {
  .code-content {
    padding: 16px;
    font-size: 0.75rem;
    overflow-x: auto;
  }

  pre {
    margin-left: 10px;
  }

  .line-numbers {
    padding-right: 10px;
  }

  .code-window {
    aspect-ratio: auto;
    height: 300px;
  }
}
</style>
