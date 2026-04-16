<template>
  <section id="about" class="about">
    <div class="container">
      <div class="about-grid">
        <!-- Text Side -->
        <div class="about-text" ref="aboutText">
          <h2 class="section-title">Código com propósito, resultado com clareza.</h2>
          <div class="bio">
            <p>
              Sou <strong>Gustavo Palla</strong>, desenvolvedor especializado em criar estruturas digitais de conversão. Trabalho na interseção entre design estratégico, engenharia de produto e automação — entregando sistemas que não apenas existem online, mas geram resultados reais.
            </p>
            <p>
              Cada projeto começa com uma pergunta: como transformamos presença digital em faturamento? A resposta está na combinação de sites de alta performance com automações inteligentes de atendimento.
            </p>
          </div>

          <div class="features-list">
            <div class="feature-card glass-card">
              <div class="feature-icon">
                <CheckCircle size="20" />
              </div>
              <div class="feature-info">
                <h4>Foco em conversão</h4>
                <p>Sites construídos para capturar leads e gerar vendas, não apenas para ter presença online.</p>
              </div>
            </div>

            <div class="feature-card glass-card">
              <div class="feature-icon">
                <TrendingUp size="20" />
              </div>
              <div class="feature-info">
                <h4>Automações reais</h4>
                <p>Integração direta com APIs e fluxos automatizados que eliminam gargalos de atendimento.</p>
              </div>
            </div>

            <div class="feature-card glass-card">
              <div class="feature-icon">
                <Sparkles size="20" />
              </div>
              <div class="feature-info">
                <h4>Entrega com resultado</h4>
                <p>Do briefing ao go-live com acompanhamento e métricas claras de performance.</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Visual Side -->
        <div class="about-visual" ref="aboutVisual">
          <div class="visual-wrapper">
            <div class="main-avatar">
              <div class="avatar-glow"></div>
              <div class="avatar-content">
                <span>GP</span>
              </div>
            </div>

            <!-- Floaters -->
            <div class="floater location glass-card">
              <MapPin size="14" class="floater-icon" />
              <div class="floater-info">
                <span class="label">Localização</span>
                <span class="value">Campinas</span>
              </div>
            </div>

            <div class="floater stack glass-card">
              <Wrench size="14" class="floater-icon" />
              <div class="floater-info">
                <span class="label">Stack principal</span>
                <span class="value">Vue.js • n8n • Supabase</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { CheckCircle, TrendingUp, Sparkles, MapPin, Wrench } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

const aboutText = ref(null);
const aboutVisual = ref(null);

onMounted(() => {
  gsap.from(aboutText.value.children, {
    scrollTrigger: {
      trigger: aboutText.value,
      start: "top 80%",
    },
    y: 30,
    opacity: 0,
    duration: 0.8,
    stagger: 0.1,
    ease: "power3.out"
  });

  gsap.from(aboutVisual.value, {
    scrollTrigger: {
      trigger: aboutVisual.value,
      start: "top 80%",
    },
    scale: 0.8,
    opacity: 0,
    duration: 1.2,
    ease: "elastic.out(1, 0.5)"
  });

  // Floating animation for avatar
  gsap.to(".main-avatar", {
    y: -15,
    duration: 3,
    repeat: -1,
    yoyo: true,
    ease: "sine.inOut"
  });
});
</script>

<style scoped>
.about {
  padding: 120px 0;
  overflow: hidden;
}

.about-grid {
  display: grid;
  grid-template-columns: 1.2fr 0.8fr;
  gap: 80px;
  align-items: center;
}

.section-title {
  font-size: 3rem;
  line-height: 1.1;
  margin-bottom: 24px;
  max-width: 500px;
}

.bio p {
  font-size: 1.15rem;
  color: var(--text-secondary);
  line-height: 1.7;
  margin-bottom: 24px;
}

.bio strong {
  color: var(--text-primary);
}

.features-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
  margin-top: 40px;
}

.feature-card {
  display: flex;
  gap: 20px;
  padding: 24px;
  border-radius: 20px;
}

.feature-icon {
  width: 48px;
  height: 48px;
  background: rgba(59, 130, 246, 0.1);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--primary-accent);
  flex-shrink: 0;
}

.feature-info h4 {
  font-size: 1.1rem;
  margin-bottom: 4px;
  color: var(--text-primary);
}

.feature-info p {
  font-size: 0.95rem;
  color: var(--text-secondary);
  line-height: 1.5;
}

/* Visual Side */
.about-visual {
  display: flex;
  justify-content: center;
}

.visual-wrapper {
  position: relative;
  width: 300px;
  height: 300px;
}

.main-avatar {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -90px;
  margin-left: -90px;
  width: 180px;
  height: 180px;
  z-index: 2;
}

.avatar-content {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background: var(--bg-color);
  border: 1px solid rgba(59, 130, 246, 0.3);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 3rem;
  font-weight: 800;
  color: var(--primary-accent);
  box-shadow: 0 0 40px rgba(59, 130, 246, 0.2);
}

.avatar-glow {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 130%;
  height: 130%;
  background: var(--primary-accent);
  filter: blur(50px);
  opacity: 0.15;
  border-radius: 50%;
}

.floater {
  position: absolute;
  padding: 12px 16px;
  border-radius: 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  z-index: 3;
}

.floater-icon {
  color: var(--primary-accent);
}

.floater-info {
  display: flex;
  flex-direction: column;
}

.floater .label {
  font-size: 0.7rem;
  text-transform: uppercase;
  color: var(--text-secondary);
  letter-spacing: 1px;
}

.floater .value {
  font-size: 0.9rem;
  font-weight: 600;
  color: var(--text-primary);
}

.location {
  top: 10%;
  left: -20%;
}

.stack {
  bottom: 10%;
  right: -20%;
}

@media (max-width: 992px) {
  .about {
    padding: 60px 0;
  }

  .about-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  
  .section-title {
    text-align: center;
    margin: 0 auto 24px;
    font-size: 2.2rem;
  }
  
  .bio {
    text-align: center;
  }
  
  .about-visual {
    order: -1;
    margin-bottom: 20px;
  }

  .visual-wrapper {
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 16px;
  }

  .main-avatar {
    position: relative;
    top: auto;
    left: auto;
    margin: 0 0 20px 0;
    width: 160px;
    height: 160px;
  }

  .floater {
    position: relative;
    top: auto !important;
    bottom: auto !important;
    left: auto !important;
    right: auto !important;
    width: 100%;
    max-width: 280px;
    justify-content: flex-start;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 1.8rem;
  }

  .main-avatar {
    width: 140px;
    height: 140px;
  }
}
</style>
