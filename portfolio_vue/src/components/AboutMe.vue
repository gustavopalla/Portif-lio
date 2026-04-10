<template>
  <section id="about" class="about">
    <div class="container">
      <div class="about-card glass-card" ref="aboutCard">
        <div class="about-content">
          <div class="text-side">
            <h2 class="section-title">QUEM SOU EU?</h2>
            <div class="bio">
              <p>
                Consultor de Implantação JR e futuro Desenvolvedor. Atualmente cursando 
                <strong>Sistemas de Informação na UNIP</strong>, busco unir a tecnologia mobile 
                com experiências de usuário que realmente fazem a diferença.
              </p>
              <p>
                Minha paixão está em criar soluções fluidas, performáticas e visualmente 
                impactantes. Tenho foco em <strong>Flutter, Dart</strong> e agora expandindo 
                meus horizontes para o ecossistema <strong>Vue.js e Node.js</strong>.
              </p>
            </div>
          </div>
          
          <div class="visual-side">
            <div class="avatar-container">
              <div class="avatar-glow"></div>
              <div class="avatar">
                <span>GP</span>
              </div>
            </div>
            <div class="vertical-name">
              GUSTAVO PALLA
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

gsap.registerPlugin(ScrollTrigger);

const aboutCard = ref(null);

onMounted(() => {
  gsap.from(aboutCard.value, {
    scrollTrigger: {
      trigger: aboutCard.value,
      start: "top 80%",
    },
    y: 60,
    opacity: 0,
    duration: 1,
    ease: "power3.out"
  });
});
</script>

<style scoped>
.about {
  padding: 100px 0;
}

.about-card {
  padding: 80px;
  border-radius: 32px;
  overflow: hidden;
  position: relative;
}

.about-content {
  display: flex;
  align-items: center;
  gap: 80px;
  position: relative;
  z-index: 2;
}

.text-side {
  flex: 3;
}

.section-title {
  font-size: 2.5rem;
  margin-bottom: 32px;
  letter-spacing: -1px;
}

.bio p {
  font-size: 1.15rem;
  color: var(--text-secondary);
  margin-bottom: 24px;
  line-height: 1.8;
}

.bio strong {
  color: var(--text-primary);
  font-weight: 600;
}

.visual-side {
  flex: 1;
  display: flex;
  align-items: center;
  gap: 30px;
}

.avatar-container {
  position: relative;
  width: 150px;
  height: 150px;
}

.avatar {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background: var(--bg-color);
  border: 1px solid var(--primary-accent);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--primary-accent);
  position: relative;
  z-index: 2;
}

.avatar-glow {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 110%;
  height: 110%;
  background: var(--primary-accent);
  filter: blur(40px);
  opacity: 0.2;
}

.vertical-name {
  writing-mode: vertical-rl;
  text-orientation: mixed;
  font-size: 0.8rem;
  font-weight: 700;
  letter-spacing: 6px;
  color: var(--primary-accent);
  opacity: 0.6;
}

@media (max-width: 992px) {
  .about-card {
    padding: 40px;
  }
  
  .about-content {
    flex-direction: column;
    text-align: center;
    gap: 50px;
  }

  .visual-side {
    justify-content: center;
  }
}
</style>
