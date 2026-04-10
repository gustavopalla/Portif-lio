<template>
  <div class="app-wrapper">
    <!-- Interactive Background -->
    <vue-particles
      id="tsparticles"
      :options="particlesOptions"
    />

    <Navbar />
    
    <main>
      <HeroSection />
      <AboutMe />
      <EducationSection />
      <SkillsSection />
      <ExperienceSection />
      <ProjectsSection />
    </main>

    <Footer />
  </div>
</template>

<script setup>
import Navbar from './components/Navbar.vue';
import HeroSection from './components/HeroSection.vue';
import AboutMe from './components/AboutMe.vue';
import EducationSection from './components/EducationSection.vue';
import SkillsSection from './components/SkillsSection.vue';
import ExperienceSection from './components/ExperienceSection.vue';
import ProjectsSection from './components/ProjectsSection.vue';
import Footer from './components/Footer.vue';

const particlesOptions = {
  background: {
    color: {
      value: "transparent",
    },
  },
  fpsLimit: 120,
  interactivity: {
    events: {
      onClick: {
        enable: false,
      },
      onHover: {
        enable: true,
        mode: "grab",
      },
    },
    modes: {
      grab: {
        distance: 140,
        links: {
          opacity: 0.5,
        },
      },
    },
  },
  particles: {
    color: {
      value: "#7c3aed",
    },
    links: {
      color: "#7c3aed",
      distance: 150,
      enable: true,
      opacity: 0.2,
      width: 1,
    },
    move: {
      direction: "none",
      enable: true,
      outModes: {
        default: "bounce",
      },
      random: false,
      speed: 1,
      straight: false,
    },
    number: {
      density: {
        enable: true,
      },
      value: 80,
    },
    opacity: {
      value: 0.3,
    },
    shape: {
      type: "circle",
    },
    size: {
      value: { min: 1, max: 3 },
    },
  },
  detectRetina: true,
};
</script>

<style>
.app-wrapper {
  position: relative;
  min-height: 100vh;
}

#tsparticles {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}

main {
  position: relative;
  z-index: 1;
}

/* Base fade-in for sections */
section {
  opacity: 1; /* GSAP will handle animations */
}
</style>
