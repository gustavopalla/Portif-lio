<template>
  <div class="app-wrapper">
    <Navbar />

    <main>
      <!-- Ordem pensada para venda: prova primeiro, pedido depois. -->
      <HeroSection />
      <ProjectsSection />
      <ProcessSection />
      <AboutMe />
      <ServicesSection />
      <GuaranteesSection />
      <FaqSection />
      <ContactSection />
    </main>

    <Footer />
  </div>
</template>

<script setup>
import Navbar from './components/Navbar.vue'
import HeroSection from './components/HeroSection.vue'
import ProjectsSection from './components/ProjectsSection.vue'
import ProcessSection from './components/ProcessSection.vue'
import AboutMe from './components/AboutMe.vue'
import ServicesSection from './components/ServicesSection.vue'
import GuaranteesSection from './components/GuaranteesSection.vue'
import FaqSection from './components/FaqSection.vue'
import ContactSection from './components/ContactSection.vue'
import Footer from './components/Footer.vue'
</script>

<style>
.app-wrapper {
  position: relative;
  min-height: 100vh;
}

main {
  position: relative;
  z-index: 1;
}
</style>
