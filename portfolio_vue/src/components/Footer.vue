<template>
  <footer class="footer">
    <div class="container footer-content">
      <div class="footer-info">
        <div class="logo">
          <span class="logo-dot"></span>
          Gustavo Palla
        </div>
        <p class="tagline">Sites e landing pages que convertem.</p>
        <p class="copyright">
          © {{ new Date().getFullYear() }} — Desenvolvido com Vue.js &amp; GSAP
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
  padding: 64px 0;
  background: var(--dark-panel);
  color: var(--on-dark-soft);
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
}

.logo {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.1rem;
  color: var(--on-dark);
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 12px;
}

.logo-dot {
  width: 6px;
  height: 6px;
  background: var(--accent);
  border-radius: 50%;
}

.tagline {
  font-size: 0.95rem;
  color: var(--on-dark-soft);
  margin-bottom: 16px;
}

.copyright {
  font-size: 0.8rem;
  color: var(--on-dark-soft);
  opacity: 0.7;
}

.footer-socials {
  display: flex;
  gap: 32px;
}

.social-link {
  text-decoration: none;
  font-size: 0.9rem;
  color: var(--on-dark-soft);
  transition: color 0.3s ease;
  font-weight: 500;
}

.social-link:hover {
  color: var(--accent);
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    align-items: center;
    text-align: center;
    gap: 32px;
  }

  .footer-socials {
    justify-content: center;
  }
}
</style>
