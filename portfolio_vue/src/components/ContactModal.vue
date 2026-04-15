<template>
  <Transition name="fade">
    <div v-if="isOpen" class="modal-overlay" @click.self="close">
      <div class="modal-container glass-card" :class="{ 'whatsapp-view': view === 'whatsapp' }">
        <button class="close-btn" @click="close">
          <X size="24" />
        </button>

        <Transition name="slide-up" mode="out-in">
          <!-- Selection View -->
          <div v-if="view === 'selection'" class="modal-content selection-view">
            <h2 class="modal-title">Vamos conversar?</h2>
            <p class="modal-subtitle">Escolha a melhor forma de entrar em contato.</p>
            
            <div class="contact-options">
              <button class="contact-btn whatsapp" @click="view = 'whatsapp'">
                <MessageCircle size="20" />
                <span>WhatsApp</span>
              </button>
              
              <a href="https://www.linkedin.com/in/gustavopalla/" target="_blank" class="contact-btn linkedin">
                <Linkedin size="20" />
                <span>LinkedIn</span>
              </a>
              
              <a href="mailto:contato@gustavopalla.com.br" class="contact-btn email">
                <Mail size="20" />
                <span>E-mail</span>
              </a>
            </div>
          </div>

          <!-- WhatsApp Form View -->
          <div v-else-if="view === 'whatsapp'" class="modal-content whatsapp-form-view">
            <button class="back-btn" @click="view = 'selection'">
              <ArrowLeft size="18" />
              Voltar
            </button>
            <h2 class="modal-title">Fale Comigo</h2>
            <p class="modal-subtitle">Me conte um pouco sobre o seu projeto.</p>

            <form @submit.prevent="sendWhatsApp" class="whatsapp-form">
              <div class="form-group">
                <label for="name">Seu Nome</label>
                <input v-model="form.name" type="text" id="name" placeholder="Como posso te chamar?" required />
              </div>

              <div class="form-group">
                <label for="interest">Assunto de interesse</label>
                <select v-model="form.interest" id="interest" required>
                  <option value="" disabled selected>Selecione um assunto</option>
                  <option value="Projeto para minha loja">Projeto para minha loja</option>
                  <option value="Landing Page de Alta Conversão">Landing Page de Alta Conversão</option>
                  <option value="Automação Inteligente (n8n)">Automação Inteligente (n8n)</option>
                  <option value="Outros">Outros</option>
                </select>
              </div>

              <div class="form-group">
                <label for="message">Mensagem (opcional)</label>
                <textarea v-model="form.message" id="message" rows="3" placeholder="Conte um pouco mais..."></textarea>
              </div>

              <button type="submit" class="submit-btn whatsapp">
                Enviar para o WhatsApp
                <ArrowRight size="18" />
              </button>
            </form>
          </div>
        </Transition>
      </div>
    </div>
  </Transition>
</template>

<script setup>
import { ref, reactive, watch } from 'vue';
import { X, MessageCircle, Linkedin, Mail, ArrowLeft, ArrowRight } from 'lucide-vue-next';

const props = defineProps({
  isOpen: Boolean
});

const emit = defineEmits(['close']);

const view = ref('selection');
const form = reactive({
  name: '',
  interest: '',
  message: ''
});

watch(() => props.isOpen, (newVal) => {
  if (newVal) {
    view.value = 'selection';
    form.name = '';
    form.interest = '';
    form.message = '';
  }
});

const close = () => {
  emit('close');
};

const sendWhatsApp = () => {
  const phone = '5519974123403';
  let text = `Olá Gustavo! Meu nome é ${form.name}.\n\n`;
  text += `Tenho interesse em: *${form.interest}*\n`;
  if (form.message) {
    text += `Mensagem: ${form.message}`;
  }
  
  const encodedText = encodeURIComponent(text);
  window.open(`https://wa.me/${phone}?text=${encodedText}`, '_blank');
  close();
};
</script>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(3, 0, 20, 0.8);
  backdrop-filter: blur(8px);
  z-index: 9999;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.modal-container {
  width: 100%;
  max-width: 450px;
  background: var(--card-bg);
  border: 1px solid var(--border-color);
  border-radius: 24px;
  padding: 40px;
  position: relative;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
  transition: max-width 0.3s ease;
}

.modal-container.whatsapp-view {
  max-width: 500px;
}

.close-btn {
  position: absolute;
  top: 20px;
  right: 20px;
  background: none;
  border: none;
  color: var(--text-secondary);
  cursor: pointer;
  transition: color 0.3s ease;
}

.close-btn:hover {
  color: var(--text-primary);
}

.back-btn {
  display: flex;
  align-items: center;
  gap: 8px;
  background: none;
  border: none;
  color: var(--text-secondary);
  font-size: 0.9rem;
  cursor: pointer;
  margin-bottom: 20px;
  transition: color 0.3s ease;
}

.back-btn:hover {
  color: var(--primary-accent);
}

.modal-title {
  font-size: 2rem;
  margin-bottom: 8px;
  color: var(--text-primary);
}

.modal-subtitle {
  color: var(--text-secondary);
  margin-bottom: 32px;
  font-size: 1rem;
}

.contact-options {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.contact-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  padding: 16px;
  border-radius: 14px;
  text-decoration: none;
  font-weight: 600;
  font-size: 1rem;
  transition: all 0.3s ease;
  border: 1px solid var(--border-color);
  cursor: pointer;
}

.contact-btn.whatsapp {
  background: #25d36615;
  color: #25d366;
  border-color: #25d36633;
}

.contact-btn.whatsapp:hover {
  background: #25d36625;
  transform: translateY(-2px);
  box-shadow: 0 10px 20px #25d36622;
}

.contact-btn.linkedin {
  background: #0a66c215;
  color: #0a66c2;
  border-color: #0a66c233;
}

.contact-btn.linkedin:hover {
  background: #0a66c225;
  transform: translateY(-2px);
  box-shadow: 0 10px 20px #0a66c222;
}

.contact-btn.email {
  background: rgba(255, 255, 255, 0.03);
  color: var(--text-primary);
}

.contact-btn.email:hover {
  background: rgba(255, 255, 255, 0.08);
  transform: translateY(-2px);
}

/* WhatsApp Form */
.whatsapp-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  font-size: 0.9rem;
  color: var(--text-secondary);
  font-weight: 500;
}

.form-group input,
.form-group select,
.form-group textarea {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 12px 16px;
  color: var(--text-primary);
  font-family: inherit;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  outline: none;
  border-color: var(--primary-accent);
  background: rgba(255, 255, 255, 0.06);
  box-shadow: 0 0 15px rgba(59, 130, 246, 0.2);
}

.submit-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  padding: 16px;
  border-radius: 14px;
  border: none;
  font-weight: 600;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-top: 10px;
}

.submit-btn.whatsapp {
  background: #25d366;
  color: white;
}

.submit-btn.whatsapp:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px #25d36644;
}

/* Transitions */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.slide-up-enter-active,
.slide-up-leave-active {
  transition: all 0.3s ease;
}

.slide-up-enter-from {
  opacity: 0;
  transform: translateY(20px);
}

.slide-up-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

@media (max-width: 480px) {
  .modal-container {
    padding: 30px 20px;
  }
  
  .modal-title {
    font-size: 1.5rem;
  }
}
</style>
