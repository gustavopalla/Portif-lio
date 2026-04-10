<template>
  <footer class="footer">
    <div class="container footer-content">
      <div class="footer-info">
        <div class="logo">
          <span class="logo-dot"></span>
          GUSTAVO PALLA
        </div>
        <p class="copyright">
          © {{ new Date().getFullYear() }} — Desenvolvido com Vue.js & GSAP
        </p>
      </div>

      <div class="footer-socials">
        <a href="https://linkedin.com/in/gustavopalla" target="_blank" class="social-link">LinkedIn</a>
        <a href="https://github.com/gustavopalla" target="_blank" class="social-link">GitHub</a>
        <a href="mailto:impalla404@gmail.com" class="social-link">Email</a>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  padding: 60px 0;
  border-top: 1px solid var(--border-color);
  background: rgba(3, 0, 20, 0.5);
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-family: 'Outfit', sans-serif;
  font-weight: 700;
  font-size: 1.1rem;
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 8px;
}

.logo-dot {
  width: 6px;
  height: 6px;
  background: var(--primary-accent);
  border-radius: 50%;
}

.copyright {
  font-size: 0.85rem;
  color: var(--text-secondary);
}

.footer-socials {
  display: flex;
  gap: 32px;
}

.social-link {
  text-decoration: none;
  font-size: 0.9rem;
  color: var(--text-secondary);
  transition: color 0.3s ease;
  font-weight: 500;
}

.social-link:hover {
  color: var(--primary-accent);
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    text-align: center;
    gap: 32px;
  }

  .footer-socials {
    justify-content: center;
  }
}
</style>
