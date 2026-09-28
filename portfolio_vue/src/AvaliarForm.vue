<template>
  <div class="avaliar-page">
    <div class="avaliar-card">
      <!--
        O estado inicial é sempre "loading", tanto no servidor (pré-render)
        quanto no cliente antes do onMounted — ler a URL antes disso geraria
        um mismatch de hidratação, já que o servidor não tem window/location.
      -->
      <template v-if="status === 'loading'">
        <p class="muted">Carregando...</p>
      </template>

      <template v-else-if="status === 'invalid'">
        <h1 class="title">Link inválido</h1>
        <p class="muted">
          Esse link de avaliação não existe ou já foi utilizado. Se você
          recebeu esse endereço de mim, me chama que eu gero um novo.
        </p>
      </template>

      <template v-else-if="status === 'sent'">
        <h1 class="title">Obrigado! 🙌</h1>
        <p class="muted">
          Sua avaliação foi enviada e vai aparecer no site assim que eu
          revisar.
        </p>
      </template>

      <template v-else>
        <h1 class="title">Como foi sua experiência?</h1>
        <p class="muted">
          Sua avaliação aparece de verdade no meu site, com seu nome e
          comentário. Leva menos de um minuto.
        </p>

        <form class="form" @submit.prevent="submit">
          <!-- Honeypot: invisível pra gente, tentador pra robô de spam. -->
          <input
            v-model="honeypot"
            type="text"
            name="website"
            class="honeypot"
            tabindex="-1"
            autocomplete="off"
          />

          <label class="field">
            <span>Seu nome</span>
            <input v-model="name" type="text" required maxlength="100" placeholder="Seu nome" />
          </label>

          <label class="field">
            <span>Seu negócio / cargo (opcional)</span>
            <input v-model="role" type="text" maxlength="100" placeholder="Ex: Dona da Pizzaria X" />
          </label>

          <div class="field">
            <span>Nota</span>
            <div class="stars" role="radiogroup" aria-label="Nota de 1 a 5">
              <button
                v-for="n in 5"
                :key="n"
                type="button"
                class="star-button"
                :aria-checked="rating === n"
                role="radio"
                @click="rating = n"
              >
                <Star :size="26" :class="['star', { filled: n <= rating }]" />
              </button>
            </div>
          </div>

          <label class="field">
            <span>Comentário</span>
            <textarea
              v-model="text"
              required
              maxlength="1000"
              rows="4"
              placeholder="Conta como foi o atendimento, o resultado, o que valeu a pena..."
            ></textarea>
          </label>

          <p v-if="error" class="error">{{ error }}</p>

          <button type="submit" class="submit" :disabled="sending">
            {{ sending ? 'Enviando...' : 'Enviar avaliação' }}
          </button>
        </form>
      </template>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Star } from 'lucide-vue-next'

const status = ref('loading') // loading | form | invalid | sent
const token = ref('')

const name = ref('')
const role = ref('')
const rating = ref(0)
const text = ref('')
const honeypot = ref('')
const sending = ref(false)
const error = ref('')

onMounted(() => {
  const params = new URLSearchParams(window.location.search)
  const t = params.get('token')
  if (!t) {
    status.value = 'invalid'
    return
  }
  token.value = t
  status.value = 'form'
})

async function submit() {
  error.value = ''

  if (!name.value.trim() || !text.value.trim() || rating.value < 1) {
    error.value = 'Preencha seu nome, a nota e o comentário.'
    return
  }

  sending.value = true
  try {
    const res = await fetch('/api/submit-review', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        token: token.value,
        name: name.value,
        role: role.value,
        rating: rating.value,
        text: text.value,
        website: honeypot.value,
      }),
    })
    const data = await res.json()
    if (!res.ok) {
      error.value = data.error || 'Não deu pra enviar. Tenta de novo.'
      return
    }
    status.value = 'sent'
  } catch (e) {
    error.value = 'Não deu pra enviar. Verifica sua conexão e tenta de novo.'
  } finally {
    sending.value = false
  }
}
</script>

<style scoped>
.avaliar-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 32px 20px;
  background: var(--bg-alt);
}

.avaliar-card {
  width: 100%;
  max-width: 480px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-md);
  padding: 40px 32px;
}

.title {
  font-family: var(--font-display);
  font-size: 1.6rem;
  color: var(--ink);
  margin: 0 0 12px;
}

.muted {
  color: var(--ink-soft);
  font-size: 0.96rem;
  line-height: 1.6;
  margin: 0;
}

.form {
  margin-top: 28px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.honeypot {
  position: absolute;
  left: -9999px;
  width: 1px;
  height: 1px;
  opacity: 0;
}

.field {
  display: flex;
  flex-direction: column;
  gap: 8px;
  font-size: 0.86rem;
  color: var(--ink-soft);
}

.field input[type='text'],
.field textarea {
  font: inherit;
  font-family: var(--font-body);
  color: var(--ink);
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  padding: 12px 14px;
  resize: vertical;
}

.field input:focus,
.field textarea:focus {
  outline: none;
  border-color: var(--accent);
}

.stars {
  display: flex;
  gap: 6px;
}

.star-button {
  background: none;
  border: none;
  padding: 4px;
  cursor: pointer;
  line-height: 0;
}

.star {
  color: var(--border-strong);
  transition: color 0.15s ease;
}

.star.filled {
  color: var(--accent);
  fill: var(--accent);
}

.error {
  color: #c0392b;
  font-size: 0.86rem;
  margin: 0;
}

.submit {
  font-family: var(--font-body);
  font-weight: 600;
  font-size: 1rem;
  color: #fff;
  background: var(--accent);
  border: none;
  border-radius: var(--radius-md);
  padding: 15px 24px;
  cursor: pointer;
  transition: background-color 0.2s ease, opacity 0.2s ease;
}

.submit:hover:not(:disabled) {
  background: var(--accent-dark);
}

.submit:disabled {
  opacity: 0.6;
  cursor: default;
}
</style>
