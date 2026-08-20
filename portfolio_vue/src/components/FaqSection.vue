<template>
  <section id="duvidas" class="faq">
    <div class="container faq-grid">
      <div class="faq-intro">
        <span class="eyebrow">Perguntas frequentes</span>
        <h2 class="section-title">
          As dúvidas que <em>todo mundo</em> tem.
        </h2>
        <p class="faq-lead">
          Se a sua não estiver aqui, é só me chamar no WhatsApp. Respondo
          sem compromisso, mesmo que você não feche nada.
        </p>
        <a :href="WA.contact" target="_blank" rel="noopener" class="btn secondary">
          Tirar outra dúvida
        </a>
      </div>

      <ul class="faq-list">
        <li v-for="(item, index) in faqs" :key="item.q" class="faq-item">
          <button
            class="faq-question"
            :aria-expanded="open === index"
            :aria-controls="`faq-answer-${index}`"
            :id="`faq-question-${index}`"
            @click="toggle(index)"
          >
            <span>{{ item.q }}</span>
            <Plus :size="19" class="icon" :class="{ rotated: open === index }" />
          </button>
          <div
            v-show="open === index"
            :id="`faq-answer-${index}`"
            role="region"
            :aria-labelledby="`faq-question-${index}`"
            class="faq-answer"
          >
            <p>{{ item.a }}</p>
          </div>
        </li>
      </ul>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { Plus } from 'lucide-vue-next'
import { WA } from '../lib/contact.js'

const open = ref(0)
const toggle = index => {
  open.value = open.value === index ? null : index
}

const faqs = [
  {
    q: 'Quanto custa? Por que o preço não está no site?',
    a: 'Porque o valor muda bastante conforme o tamanho do projeto e o que você já tem pronto, quem chega com fotos, textos e logo definidos paga menos que quem precisa de tudo do zero. Colocar um número fixo aqui só criaria expectativa errada dos dois lados. Me manda uma mensagem contando o que você faz e eu te passo o valor fechado no mesmo dia, sem reunião obrigatória e sem enrolação.',
  },
  {
    q: 'O que você precisa que eu mande para começar?',
    a: 'Basicamente o que você já tem: nome e descrição do serviço, fotos do trabalho ou do espaço, e o número de WhatsApp que vai receber os contatos. Logo, textos e depoimentos ajudam, mas não são obrigatórios, se você não tiver, eu escrevo e a gente resolve com o que existe.',
  },
  {
    q: 'Preciso ter um domínio próprio (tipo meunegocio.com.br)?',
    a: 'Não. A sua página já sai no ar com um endereço gratuito que funciona normalmente e pode ser divulgado no Instagram, no cartão e no Google. Se você quiser um endereço próprio depois, eu configuro, só existe uma taxa anual de registro paga por você direto ao órgão responsável.',
  },
  {
    q: 'Quanto tempo demora para ficar pronto?',
    a: 'Até 7 dias para uma landing page, contando do dia em que você me manda as informações e as fotos do negócio. Projetos maiores, com mais páginas, costumam levar de 2 a 4 semanas. Combino o prazo com você antes de começar.',
  },
  {
    q: 'E se eu não gostar do resultado?',
    a: 'A gente ajusta. Não trabalho com limite de revisões: se a cor, o texto ou a ordem das coisas não ficou como você imaginou, eu mexo até você aprovar. Você só considera o trabalho entregue quando estiver satisfeito com a página.',
  },
  {
    q: 'Preciso saber mexer no site depois que ele estiver no ar?',
    a: 'Não precisa. A página fica funcionando sozinha, sem você ter que atualizar nada. Quando precisar mudar um preço, uma foto ou um horário, é só me mandar mensagem. Se preferir mexer você mesmo, eu te ensino como.',
  },
  {
    q: 'Como funciona o pagamento?',
    a: 'Conversamos primeiro, eu entendo o que você precisa e só depois você decide. O pagamento é combinado direto comigo por PIX, e a gente acerta a forma antes de eu começar, sem contrato de fidelidade e sem mensalidade obrigatória para manter a página no ar.',
  },
  {
    q: 'Você atende só em Campinas?',
    a: 'Atendo presencialmente Campinas e a região, e remotamente o Brasil inteiro. Boa parte do processo acontece por WhatsApp e videochamada, então a distância não muda o resultado nem o prazo.',
  },
]
</script>

<style scoped>
.faq {
  padding: var(--space-section) 0;
}

.faq-grid {
  display: grid;
  grid-template-columns: 0.85fr 1.15fr;
  gap: 72px;
  align-items: start;
}

.faq-intro {
  position: sticky;
  top: 100px;
}

.eyebrow {
  display: flex;
  margin-bottom: 16px;
}

.section-title {
  margin-bottom: 18px;
}

.faq-lead {
  color: var(--ink-soft);
  margin-bottom: 28px;
}

.faq-list {
  list-style: none;
}

.faq-item {
  border-bottom: 1px solid var(--border);
}

.faq-question {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
  padding: 24px 0;
  background: none;
  border: none;
  cursor: pointer;
  text-align: left;
  font-family: var(--font-display);
  font-size: 1.04rem;
  font-weight: 600;
  color: var(--ink);
  transition: color 0.2s ease;
}

.faq-question:hover {
  color: var(--accent);
}

.faq-question:focus-visible {
  outline: 2px solid var(--accent);
  outline-offset: 4px;
  border-radius: var(--radius-sm);
}

.icon {
  flex-shrink: 0;
  color: var(--muted);
  transition: transform 0.3s ease, color 0.3s ease;
}

.icon.rotated {
  transform: rotate(45deg);
  color: var(--accent);
}

.faq-answer {
  padding: 0 40px 26px 0;
}

.faq-answer p {
  color: var(--ink-soft);
  font-size: 0.96rem;
  line-height: 1.75;
}

@media (max-width: 992px) {
  .faq-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .faq-intro {
    position: static;
  }

  .faq-answer {
    padding-right: 16px;
  }
}
</style>
