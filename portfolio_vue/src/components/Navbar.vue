<template>
  <nav :class="{ 'scrolled': isScrolled }" class="navbar">
    <div class="container nav-content">
      <div class="logo">
        <span class="logo-dot"></span>
        GUSTAVO PALLA
      </div>
      
      <div class="nav-links" :class="{ 'mobile-active': isMobileMenuOpen }">
        <a href="#home" @click="closeMenu">Início</a>
        <a href="#about" @click="closeMenu">Sobre</a>
        <a href="#skills" @click="closeMenu">Skills</a>
        <a href="#experience" @click="closeMenu">Experiência</a>
        <a href="#projects" @click="closeMenu">Projetos</a>
        <a href="mailto:impalla404@gmail.com" class="cta-button">Contato</a>
      </div>

      <button class="mobile-toggle" @click="isMobileMenuOpen = !isMobileMenuOpen">
        <span :class="{ 'open': isMobileMenuOpen }"></span>
      </button>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const isScrolled = ref(false);
const isMobileMenuOpen = ref(false);

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50;
};

const closeMenu = () => {
  isMobileMenuOpen.value = false;
};

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll);
});
</script>

<style scoped>
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 80px;
  z-index: 1000;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  display: flex;
  align-items: center;
}

.navbar.scrolled {
  background: rgba(3, 0, 20, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  height: 70px;
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}

.logo {
  font-family: 'Outfit', sans-serif;
  font-weight: 700;
  font-size: 1.2rem;
  letter-spacing: 1px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.logo-dot {
  width: 8px;
  height: 8px;
  background: var(--primary-accent);
  border-radius: 50%;
  box-shadow: 0 0 10px var(--primary-accent);
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 32px;
}

.nav-links a {
  text-decoration: none;
  color: var(--text-secondary);
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.3s ease;
}

.nav-links a:hover {
  color: var(--text-primary);
}

.cta-button {
  background: var(--primary-accent);
  color: white !important;
  padding: 10px 24px;
  border-radius: 30px;
  box-shadow: 0 4px 15px rgba(124, 58, 237, 0.3);
  transition: all 0.3s ease !important;
}

.cta-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(124, 58, 237, 0.5);
}

.mobile-toggle {
  display: none;
  background: none;
  border: none;
  cursor: pointer;
  padding: 10px;
}

@media (max-width: 768px) {
  .mobile-toggle {
    display: block;
  }

  .nav-links {
    position: fixed;
    top: 0;
    right: -100%;
    width: 70%;
    height: 100vh;
    background: var(--bg-color);
    flex-direction: column;
    justify-content: center;
    transition: 0.4s;
    border-left: 1px solid var(--border-color);
  }

  .nav-links.mobile-active {
    right: 0;
  }
}
</style>
