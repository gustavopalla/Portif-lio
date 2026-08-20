<template>
  <nav :class="{ scrolled: isScrolled }" class="navbar">
    <div class="container nav-content">
      <a href="#home" class="logo" @click="closeMenu">
        <span class="logo-dot"></span>
        Gustavo Palla
      </a>

      <div class="nav-links" :class="{ 'mobile-active': isMobileMenuOpen }">
        <a href="#projetos" @click="closeMenu">Exemplos</a>
        <a href="#processo" @click="closeMenu">Como funciona</a>
        <a href="#servicos" @click="closeMenu">Serviços</a>
        <a href="#duvidas" @click="closeMenu">Dúvidas</a>
        <a
          :href="WA.navbar"
          target="_blank"
          rel="noopener"
          class="cta-button"
          @click="closeMenu"
        >
          Fazer orçamento
        </a>
      </div>

      <button
        class="mobile-toggle"
        :class="{ open: isMobileMenuOpen }"
        :aria-expanded="isMobileMenuOpen"
        aria-label="Abrir menu"
        @click="isMobileMenuOpen = !isMobileMenuOpen"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { WA } from '../lib/contact.js'

const isScrolled = ref(false)
const isMobileMenuOpen = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const closeMenu = () => {
  isMobileMenuOpen.value = false
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll, { passive: true })
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
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
  background: transparent;
}

.navbar.scrolled {
  background: rgba(250, 248, 243, 0.86);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
  height: 70px;
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}

.logo {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.1rem;
  letter-spacing: -0.01em;
  color: var(--ink);
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 10px;
}

.logo-dot {
  width: 8px;
  height: 8px;
  background: var(--accent);
  border-radius: 50%;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 30px;
}

.nav-links a {
  text-decoration: none;
  color: var(--ink-soft);
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.3s ease;
}

.nav-links a:hover {
  color: var(--ink);
}

.cta-button {
  background: var(--ink);
  color: var(--on-dark) !important;
  padding: 11px 22px;
  border-radius: var(--radius-md);
  font-weight: 600 !important;
  transition: all 0.3s ease;
}

.cta-button:hover {
  background: var(--accent);
  transform: translateY(-2px);
}

.mobile-toggle {
  display: none;
  flex-direction: column;
  justify-content: center;
  gap: 5px;
  width: 32px;
  height: 32px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 0;
}

.mobile-toggle span {
  display: block;
  width: 100%;
  height: 2px;
  background: var(--ink);
  border-radius: 2px;
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.mobile-toggle.open span:nth-child(1) {
  transform: translateY(7px) rotate(45deg);
}

.mobile-toggle.open span:nth-child(2) {
  opacity: 0;
}

.mobile-toggle.open span:nth-child(3) {
  transform: translateY(-7px) rotate(-45deg);
}

@media (max-width: 900px) {
  .mobile-toggle {
    display: flex;
    z-index: 1002;
  }

  .nav-links {
    position: fixed;
    top: 0;
    right: -100%;
    width: 82%;
    max-width: 340px;
    height: 100vh;
    background: var(--bg);
    flex-direction: column;
    justify-content: center;
    transition: right 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    border-left: 1px solid var(--border);
    padding: 40px;
    box-shadow: var(--shadow-lg);
    z-index: 1001;
  }

  .nav-links.mobile-active {
    right: 0;
  }

  .nav-links a {
    font-size: 1.1rem;
    width: 100%;
    text-align: center;
    padding: 15px 0;
  }

  .cta-button {
    width: 100%;
    margin-top: 20px;
  }
}
</style>
