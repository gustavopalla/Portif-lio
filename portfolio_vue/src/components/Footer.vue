<template>
  <footer class="footer">
    <div class="container footer-content">
      <div class="footer-brand">
        <div class="logo">
          <span class="logo-dot"></span>
          Gustavo Palla
        </div>
        <p class="tagline">
          Criação de landing pages e sites para pequenos negócios,
          autônomos e profissionais liberais.
        </p>
        <p class="location">Campinas · São Paulo · Atendimento em todo o Brasil</p>
      </div>

      <nav class="footer-nav" aria-label="Navegação do rodapé">
        <div class="nav-col">
          <h3 class="col-title">O site</h3>
          <a href="#projetos">Exemplos</a>
          <a href="#processo">Como funciona</a>
          <a href="#servicos">Serviços</a>
          <a href="#duvidas">Dúvidas</a>
        </div>

        <div class="nav-col">
          <h3 class="col-title">Contato</h3>
          <a :href="WA.contact" target="_blank" rel="noopener">WhatsApp</a>
          <a :href="`mailto:${EMAIL}`">E-mail</a>
          <a href="https://www.linkedin.com/in/gustavopalla/" target="_blank" rel="noopener">LinkedIn</a>
          <a href="https://github.com/gustavopalla" target="_blank" rel="noopener">GitHub</a>
        </div>
      </nav>
    </div>

    <div class="container footer-bottom">
      <p class="copyright">
        © {{ new Date().getFullYear() }} Gustavo Palla, Desenvolvimento web
      </p>
      <a href="/sobre-o-dev/" class="dev-link">Perfil técnico e formação</a>
    </div>
  </footer>
</template>

<script setup>
import { WA, EMAIL } from '../lib/contact.js'
</script>

<style scoped>
.footer {
  padding: 64px 0 32px;
  background: var(--dark-panel-alt);
  color: var(--on-dark-soft);
}

.footer-content {
  display: grid;
  grid-template-columns: 1.3fr 1fr;
  gap: 56px;
  padding-bottom: 44px;
}

.logo {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.1rem;
  color: var(--on-dark);
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 14px;
}

.logo-dot {
  width: 6px;
  height: 6px;
  background: var(--accent);
  border-radius: 50%;
}

.tagline {
  font-size: 0.94rem;
  line-height: 1.65;
  max-width: 340px;
  margin-bottom: 14px;
}

.location {
  font-size: 0.83rem;
  opacity: 0.7;
}

.footer-nav {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 32px;
}

.nav-col {
  display: flex;
  flex-direction: column;
  gap: 11px;
}

.col-title {
  font-family: var(--font-mono);
  font-size: 0.7rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--on-dark);
  margin-bottom: 5px;
  font-weight: 500;
}

.nav-col a {
  font-size: 0.9rem;
  color: var(--on-dark-soft);
  text-decoration: none;
  transition: color 0.25s ease;
  width: fit-content;
}

.nav-col a:hover {
  color: var(--accent);
}

.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 14px;
  padding-top: 26px;
  border-top: 1px solid rgba(255, 255, 255, 0.09);
}

.copyright {
  font-size: 0.81rem;
  opacity: 0.62;
}

.dev-link {
  font-size: 0.81rem;
  color: var(--on-dark-soft);
  text-decoration: none;
  opacity: 0.72;
  transition: opacity 0.25s ease, color 0.25s ease;
}

.dev-link:hover {
  opacity: 1;
  color: var(--accent);
}

@media (max-width: 768px) {
  .footer-content {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .footer-bottom {
    justify-content: center;
    text-align: center;
  }
}
</style>
