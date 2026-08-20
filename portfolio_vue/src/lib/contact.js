// Ponto único de verdade dos dados de contato e dos links de WhatsApp.
// Centralizado para que a mensagem pré-preenchida de cada CTA seja rastreável
// e para não repetir o número em cinco componentes diferentes.

export const PHONE = '5519974123403'
export const PHONE_DISPLAY = '(19) 97412-3403'
export const EMAIL = 'impalla404@gmail.com'
export const SITE_URL = 'https://gustavopalladev.com.br'

/**
 * Monta um link wa.me com a mensagem já digitada para o visitante.
 * @param {string} message Texto que aparece pronto na conversa.
 */
export function whatsappLink(message) {
  return `https://wa.me/${PHONE}?text=${encodeURIComponent(message)}`
}

// Mensagens por origem do clique — assim dá pra saber de qual seção veio o
// lead. Valores nunca aparecem aqui: orçamento é conversa privada.
export const WA = {
  hero: whatsappLink(
    'Olá! Vi seu site e quero saber mais sobre a criação de uma landing page.'
  ),
  pilot: whatsappLink(
    'Olá! Tenho interesse na Landing Page de Lançamento. Pode me explicar como funciona e qual o investimento?'
  ),
  complete: whatsappLink(
    'Olá! Quero saber mais sobre o Site Completo, com endereço próprio. Pode me passar um orçamento?'
  ),
  care: whatsappLink(
    'Olá! Quero saber mais sobre o acompanhamento mensal do site.'
  ),
  contact: whatsappLink(
    'Olá, Gustavo! Vim pelo seu site e quero conversar sobre um projeto.'
  ),
  navbar: whatsappLink('Olá, Gustavo! Vim pelo seu site e quero fazer um orçamento.'),
}
