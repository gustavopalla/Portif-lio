<template>
  <section id="garantias" class="guarantees">
    <div class="container">
      <span class="eyebrow eyebrow-centered">O que eu garanto</span>
      <h2 class="section-title centered">
        Contratar alguém pela internet dá <em>medo</em>. Eu sei.
      </h2>
      <p class="section-lead centered">
        Por isso deixo por escrito o que você pode cobrar de mim, antes de
        você pagar qualquer coisa.
      </p>

      <div class="grid">
        <div v-for="item in guarantees" :key="item.title" class="card">
          <div class="card-icon">
            <component :is="item.icon" :size="20" />
          </div>
          <h3 class="card-title">{{ item.title }}</h3>
          <p class="card-text">{{ item.text }}</p>
        </div>
      </div>

      <!--
        Depoimentos reais entram aqui. Basta preencher o array `testimonials`
        no script com { name, role, initial, text, rating } que a lista
        aparece automaticamente — nada mais precisa ser alterado.
      -->
      <div v-if="testimonials.length" class="testimonials">
        <h3 class="testimonials-title">O que os clientes dizem</h3>
        <div class="testimonials-grid">
          <figure
            v-for="person in testimonials"
            :key="person.name"
            class="testimonial"
          >
            <div class="stars" :aria-label="`Nota ${person.rating} de 5`">
              <Star
                v-for="n in 5"
                :key="n"
                :size="15"
                :class="['star', { filled: n <= person.rating }]"
              />
            </div>
            <blockquote class="quote">"{{ person.text }}"</blockquote>
            <figcaption class="person">
              <span class="person-initial">{{ person.initial }}</span>
              <span class="person-info">
                <span class="person-name">{{ person.name }}</span>
                <span class="person-role">{{ person.role }}</span>
              </span>
            </figcaption>
          </figure>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { Clock, RefreshCw, MessageSquare, KeyRound, Star } from 'lucide-vue-next'

// Promessas que dependem só de mim — nada aqui depende de histórico
// de cliente, então tudo é verificável e honesto desde o primeiro dia.
const guarantees = [
  {
    title: 'Página no ar em até 7 dias',
    text: 'A contar do dia em que você me mandar as informações do negócio. Se atrasar por minha causa, você não paga.',
    icon: Clock,
  },
  {
    title: 'Ajusto até você aprovar',
    text: 'Não existe "número de revisões". Se não ficou do jeito que você imaginou, a gente mexe até ficar.',
    icon: RefreshCw,
  },
  {
    title: 'Você fala comigo, não com um robô',
    text: 'Mesmo número de WhatsApp do começo ao fim. Sem chamado, sem protocolo, sem atendente diferente a cada mensagem.',
    icon: MessageSquare,
  },
  {
    title: 'O site fica no seu nome',
    text: 'Você não fica refém de mim. O endereço e o conteúdo são seus, e leva junto se um dia quiser trocar de profissional.',
    icon: KeyRound,
  },
]

// Ainda sem depoimentos publicados — a seção acima cobre a prova por
// enquanto. Preencher assim que o primeiro cliente autorizar:
// { name: 'Nome', role: 'Negócio', initial: 'N', text: '...', rating: 5 }
const testimonials = []
</script>

<style scoped>
.guarantees {
  padding: var(--space-section) 0;
  background: var(--bg-alt);
}

.centered {
  text-align: center;
}

.section-title {
  margin-bottom: 16px;
}

.section-lead {
  color: var(--ink-soft);
  max-width: 520px;
  margin: 0 auto 60px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 22px;
}

.card {
  padding: 30px 26px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
}

.card-icon {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-md);
  background: var(--teal-soft);
  color: var(--teal);
  margin-bottom: 18px;
}

.card-title {
  font-size: 1.04rem;
  margin-bottom: 10px;
}

.card-text {
  font-size: 0.9rem;
  line-height: 1.65;
  color: var(--ink-soft);
}

/* --- Depoimentos (aparecem quando houver) --- */
.testimonials {
  margin-top: 72px;
  padding-top: 56px;
  border-top: 1px solid var(--border-strong);
}

.testimonials-title {
  font-size: 1.4rem;
  text-align: center;
  margin-bottom: 36px;
}

.testimonials-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 22px;
}

.testimonial {
  margin: 0;
  padding: 28px;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
}

.stars {
  display: flex;
  gap: 3px;
  margin-bottom: 16px;
}

.star {
  color: var(--border-strong);
}

.star.filled {
  color: var(--accent);
  fill: var(--accent);
}

.quote {
  margin: 0 0 22px;
  font-size: 0.96rem;
  line-height: 1.7;
  color: var(--ink-soft);
}

.person {
  display: flex;
  align-items: center;
  gap: 12px;
}

.person-initial {
  width: 38px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: var(--dark-panel);
  color: var(--on-dark);
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 0.95rem;
}

.person-info {
  display: flex;
  flex-direction: column;
  line-height: 1.35;
}

.person-name {
  font-weight: 600;
  font-size: 0.92rem;
  color: var(--ink);
}

.person-role {
  font-size: 0.82rem;
  color: var(--muted);
}

@media (max-width: 992px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 560px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
</style>
