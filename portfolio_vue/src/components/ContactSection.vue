<template>
  <section id="contato" class="contact">
    <div class="container contact-inner">
      <span class="offer-flag">
        <span class="pulse" aria-hidden="true"></span>
        Agenda aberta para novos projetos este mês
      </span>

      <h2 class="contact-title">
        Vamos colocar o seu negócio <em>no ar</em>?
      </h2>

      <p class="contact-lead">
        Me manda uma mensagem contando o que você faz. Eu respondo com uma
        ideia do que dá para fazer e quanto custa — sem compromisso e sem
        insistência depois.
      </p>

      <div class="contact-actions">
        <a :href="WA.contact" target="_blank" rel="noopener" class="wa-button">
          <MessageCircle :size="21" />
          Chamar no WhatsApp
        </a>
        <span class="phone">{{ PHONE_DISPLAY }}</span>
      </div>

      <div class="contact-alt">
        <span>Prefere e-mail?</span>
        <a :href="`mailto:${EMAIL}`" class="mail-link">{{ EMAIL }}</a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { MessageCircle } from 'lucide-vue-next'
import { WA, EMAIL, PHONE_DISPLAY } from '../lib/contact.js'
</script>

<style scoped>
.contact {
  padding: 104px 0;
  background: var(--dark-panel);
  position: relative;
  overflow: hidden;
}

/* Brilho quente atrás do bloco, para o CTA final não ficar chapado. */
.contact::before {
  content: '';
  position: absolute;
  top: -180px;
  left: 50%;
  transform: translateX(-50%);
  width: 620px;
  height: 620px;
  background: radial-gradient(circle, rgba(255, 90, 43, 0.16), transparent 68%);
  pointer-events: none;
}

.contact-inner {
  position: relative;
  text-align: center;
  max-width: 660px;
}

.offer-flag {
  display: inline-flex;
  align-items: center;
  gap: 9px;
  font-family: var(--font-mono);
  font-size: 0.72rem;
  letter-spacing: 0.09em;
  text-transform: uppercase;
  color: var(--on-dark-soft);
  border: 1px solid rgba(255, 255, 255, 0.16);
  border-radius: 100px;
  padding: 8px 17px;
  margin-bottom: 28px;
}

.pulse {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: var(--accent);
  animation: pulse 2.4s ease-out infinite;
  flex-shrink: 0;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(255, 90, 43, 0.55); }
  70% { box-shadow: 0 0 0 9px rgba(255, 90, 43, 0); }
  100% { box-shadow: 0 0 0 0 rgba(255, 90, 43, 0); }
}

.contact-title {
  font-size: clamp(2rem, 4.4vw, 3rem);
  line-height: 1.08;
  color: var(--on-dark);
  margin-bottom: 20px;
}

.contact-lead {
  color: var(--on-dark-soft);
  font-size: 1.04rem;
  margin-bottom: 40px;
}

.contact-actions {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  margin-bottom: 36px;
}

.wa-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  padding: 20px 44px;
  border-radius: var(--radius-md);
  background: var(--accent);
  color: #fff;
  font-family: var(--font-body);
  font-weight: 600;
  font-size: 1.08rem;
  text-decoration: none;
  box-shadow: 0 18px 40px -14px rgba(255, 90, 43, 0.6);
  transition: transform 0.25s ease, background-color 0.25s ease;
}

.wa-button:hover {
  transform: translateY(-3px);
  background: var(--accent-dark);
}

.phone {
  font-family: var(--font-mono);
  font-size: 0.9rem;
  color: var(--on-dark-soft);
}

.contact-alt {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  gap: 10px;
  padding-top: 28px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  font-size: 0.93rem;
  color: var(--on-dark-soft);
}

.mail-link {
  color: var(--on-dark);
  font-weight: 600;
  text-decoration: none;
  border-bottom: 1px solid rgba(255, 255, 255, 0.28);
  transition: color 0.25s ease, border-color 0.25s ease;
}

.mail-link:hover {
  color: var(--accent);
  border-color: var(--accent);
}

@media (max-width: 560px) {
  .contact {
    padding: 76px 0;
  }

  .wa-button {
    width: 100%;
    padding: 18px 24px;
  }
}
</style>
