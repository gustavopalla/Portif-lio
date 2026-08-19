<template>
  <div class="app-wrapper">
    <Navbar />

    <main>
      <HeroSection />
      <AboutMe />
      <EducationSection />
      <SkillsSection />
      <ProcessSection />
      <ExperienceSection />
      <ProjectsSection />
    </main>

    <Footer />

    <ContactModal
      :is-open="isContactModalOpen"
      @close="closeContactModal"
    />
  </div>
</template>

<script setup>
import Navbar from './components/Navbar.vue';
import HeroSection from './components/HeroSection.vue';
import AboutMe from './components/AboutMe.vue';
import EducationSection from './components/EducationSection.vue';
import SkillsSection from './components/SkillsSection.vue';
import ProcessSection from './components/ProcessSection.vue';
import ExperienceSection from './components/ExperienceSection.vue';
import ProjectsSection from './components/ProjectsSection.vue';
import Footer from './components/Footer.vue';
import ContactModal from './components/ContactModal.vue';
import { ref, provide } from 'vue';

const isContactModalOpen = ref(false);

const openContactModal = () => {
  isContactModalOpen.value = true;
};

const closeContactModal = () => {
  isContactModalOpen.value = false;
};

provide('openContactModal', openContactModal);
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
