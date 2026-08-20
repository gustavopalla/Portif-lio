<template>
  <section id="home" class="hero">
    <canvas ref="grainCanvas" class="grain-canvas" aria-hidden="true"></canvas>

    <div class="container hero-content">
      <div class="hero-text" ref="heroText">
        <span class="eyebrow">Criação de sites · Campinas e região</span>

        <h1 class="headline">
          Sites que <em>vendem</em><br />
          enquanto você dorme.
        </h1>

        <p class="description">
          Landing pages e sites de alta conversão para advogados, pequenos
          negócios e autônomos que querem ser encontrados e fechar mais
          clientes online.
        </p>

        <div class="actions">
          <a :href="WA.hero" target="_blank" rel="noopener" class="btn primary">
            Iniciar um projeto
          </a>
          <a href="#projetos" class="btn secondary">Ver exemplos</a>
        </div>

        <p class="hero-note">
          <span class="pulse" aria-hidden="true"></span>
          <strong>Orçamento sem compromisso</strong>, resposta no mesmo dia
        </p>
      </div>

      <div class="hero-visual" ref="heroVisual">
        <div class="browser">
          <div class="browser-bar">
            <span class="dot"></span><span class="dot"></span><span class="dot"></span>
            <span class="url">seunegocio.com.br</span>
          </div>
          <img
            src="/dimarte.png"
            alt="Exemplo de landing page desenvolvida por Gustavo Palla"
            class="browser-shot"
            width="1345"
            height="646"
            loading="eager"
          />
        </div>

        <div class="float-card whats">
          <MessageCircle :size="16" class="float-icon" />
          <div>
            <span class="float-label">Contato direto</span>
            <span class="float-value">Botão de WhatsApp</span>
          </div>
        </div>

        <div class="float-card speed">
          <Zap :size="16" class="float-icon" />
          <div>
            <span class="float-label">Carrega rápido</span>
            <span class="float-value">Feito para celular</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { MessageCircle, Zap } from 'lucide-vue-next'
import { WA } from '../lib/contact.js'
import { animateWhenReady } from '../lib/motion.js'

const heroText = ref(null)
const heroVisual = ref(null)
const grainCanvas = ref(null)

// ---------------------------------------------------------------
// Fundo com grão de filme: ruído sutil que fica mais denso perto do
// cursor. Todo o trabalho acontece em onMounted, então não roda na
// pré-renderização (o HTML gerado sai com o conteúdo real).
// ---------------------------------------------------------------
let ctx
let width = 0
let height = 0
let rafId = null
let sectionEl = null
const pointer = { x: -9999, y: -9999, active: 0 }

const GRAIN_SCALE = 3

function resizeCanvas() {
  if (!grainCanvas.value || !sectionEl) return
  const rect = sectionEl.getBoundingClientRect()
  width = Math.max(1, Math.floor(rect.width / GRAIN_SCALE))
  height = Math.max(1, Math.floor(rect.height / GRAIN_SCALE))
  grainCanvas.value.width = width
  grainCanvas.value.height = height
}

function handlePointerMove(e) {
  const rect = sectionEl.getBoundingClientRect()
  pointer.x = ((e.clientX - rect.left) / rect.width) * width
  pointer.y = ((e.clientY - rect.top) / rect.height) * height
}

function handlePointerEnter() {
  pointer.active = 1
}

function handlePointerLeave() {
  pointer.active = 0
  pointer.x = -9999
  pointer.y = -9999
}

function drawGrain() {
  if (ctx && width && height) {
    const imageData = ctx.createImageData(width, height)
    const buffer = imageData.data
    const radius = width * 0.35

    for (let i = 0; i < buffer.length; i += 4) {
      const px = (i / 4) % width
      const py = Math.floor(i / 4 / width)
      let boost = 0
      if (pointer.active > 0.01) {
        const dx = px - pointer.x
        const dy = py - pointer.y
        const dist = Math.sqrt(dx * dx + dy * dy)
        boost = Math.max(0, 1 - dist / radius) * pointer.active
      }

      const base = 8 + boost * 30
      const value = Math.random() * base
      const alpha = (10 + boost * 26) * (Math.random() * 0.6 + 0.7)

      buffer[i] = 21
      buffer[i + 1] = 19
      buffer[i + 2] = 15
      buffer[i + 3] = value + alpha
    }

    ctx.putImageData(imageData, 0, 0)
  }
  rafId = requestAnimationFrame(drawGrain)
}

onMounted(() => {
  sectionEl = grainCanvas.value.closest('.hero')
  ctx = grainCanvas.value.getContext('2d', { willReadFrequently: true })
  resizeCanvas()

  window.addEventListener('resize', resizeCanvas)
  sectionEl.addEventListener('pointermove', handlePointerMove)
  sectionEl.addEventListener('pointerenter', handlePointerEnter)
  sectionEl.addEventListener('pointerleave', handlePointerLeave)

  animateWhenReady(async () => {
    drawGrain()

    const { gsap } = await import('gsap')
    gsap.from(heroText.value.children, {
      y: 24,
      opacity: 0,
      duration: 0.7,
      stagger: 0.09,
      ease: 'power3.out',
    })
    gsap.from(heroVisual.value, {
      y: 30,
      opacity: 0,
      duration: 0.9,
      delay: 0.25,
      ease: 'power3.out',
    })
  })
})

onUnmounted(() => {
  if (rafId) cancelAnimationFrame(rafId)
  window.removeEventListener('resize', resizeCanvas)
  if (sectionEl) {
    sectionEl.removeEventListener('pointermove', handlePointerMove)
    sectionEl.removeEventListener('pointerenter', handlePointerEnter)
    sectionEl.removeEventListener('pointerleave', handlePointerLeave)
  }
})
</script>

<style scoped>
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  padding: 120px 0 80px;
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
  grid-template-columns: 1fr 1fr;
  gap: 64px;
  align-items: center;
  position: relative;
  z-index: 1;
}

.eyebrow {
  margin-bottom: 20px;
}

.headline {
  font-size: clamp(2.3rem, 4.6vw, 3.75rem);
  line-height: 1.05;
  margin-bottom: 24px;
}

.description {
  font-size: 1.08rem;
  color: var(--ink-soft);
  max-width: 480px;
  margin-bottom: 32px;
}

.actions {
  display: flex;
  gap: 14px;
  margin-bottom: 24px;
  flex-wrap: wrap;
}

.hero-note {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  font-size: 0.9rem;
  color: var(--ink-soft);
}

.hero-note strong {
  color: var(--ink);
}

.pulse {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--accent);
  box-shadow: 0 0 0 0 var(--accent-soft);
  animation: pulse 2.4s ease-out infinite;
  flex-shrink: 0;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(255, 90, 43, 0.5); }
  70% { box-shadow: 0 0 0 10px rgba(255, 90, 43, 0); }
  100% { box-shadow: 0 0 0 0 rgba(255, 90, 43, 0); }
}

/* --- Mockup de navegador: mostra resultado visual, não código --- */
.hero-visual {
  position: relative;
}

.browser {
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--surface);
  border: 1px solid var(--border);
  box-shadow: var(--shadow-lg);
}

.browser-bar {
  display: flex;
  align-items: center;
  gap: 7px;
  padding: 0 16px;
  height: 40px;
  background: var(--bg-alt);
  border-bottom: 1px solid var(--border);
}

.browser-bar .dot {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: var(--border-strong);
}

.url {
  margin-left: 14px;
  font-family: var(--font-mono);
  font-size: 0.72rem;
  color: var(--muted);
  background: var(--surface);
  border-radius: 100px;
  padding: 4px 14px;
  border: 1px solid var(--border);
}

.browser-shot {
  display: block;
  width: 100%;
  height: auto;
}

.float-card {
  position: absolute;
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 11px 15px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
}

.float-card div {
  display: flex;
  flex-direction: column;
  line-height: 1.3;
}

.float-icon {
  color: var(--accent);
  flex-shrink: 0;
}

.float-label {
  font-size: 0.66rem;
  text-transform: uppercase;
  letter-spacing: 0.09em;
  color: var(--muted);
}

.float-value {
  font-size: 0.83rem;
  font-weight: 600;
  color: var(--ink);
}

/* Ancorados sobre o conteúdo do mockup, nunca sobre a barra de
   endereço — cobrir a URL tira justamente a leitura de "site real". */
.whats {
  top: 24%;
  left: -34px;
}

.speed {
  bottom: -20px;
  right: -22px;
}

@media (max-width: 992px) {
  .hero {
    padding: 110px 0 64px;
    min-height: auto;
  }

  .hero-content {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 48px;
  }

  .hero-text {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .description {
    margin-left: auto;
    margin-right: auto;
  }

  .actions {
    justify-content: center;
    width: 100%;
  }

  .btn {
    flex: 1 1 200px;
  }

  /* Os cards flutuantes saem do fluxo em telas pequenas para não
     cobrir o mockup nem estourar a largura da página. */
  .float-card {
    display: none;
  }
}

@media (max-width: 480px) {
  .actions {
    flex-direction: column;
  }

  .btn {
    width: 100%;
  }
}
</style>
