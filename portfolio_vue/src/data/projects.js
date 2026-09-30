// Projetos em destaque: usados na home e nas páginas de detalhes.
// Página do tipo que eu vendo — é ela que carrega a prova social.
export const featured = [
  // Ordem de exibição: o case (cliente real) sempre primeiro.
  {
    status: 'case',
    slug: 'jonas-vitorino',
    title: 'Jonas Vitorino',
    kind: 'Portfólio · Videomaker',
    description:
      'Portfólio para um videomaker de Campinas, especializado em cobertura de eventos ao vivo, feito para transformar quem visita a página em um contato direto pelo WhatsApp.',
    delivers: [
      'Pedido de orçamento direto no WhatsApp',
      'Vitrine do portfólio de vídeos e trabalhos entregues',
      'Visual escuro e cinematográfico, alinhado ao trabalho',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://www.jonasvitorino.com.br/',
    image: '/jonasvitorino.jpg',
    // Material entregue ao cliente, exibido na página de detalhes.
    video: {
      src: '/projetos/jonas-vitorino/apresentacao.mp4',
      poster: '/projetos/jonas-vitorino/apresentacao-poster.jpg',
      title: 'Apresentação do site',
      text: 'Um vídeo curto, no formato vertical que o Jonas usa nas redes, mostrando a página funcionando.',
    },
    pdf: {
      src: '/projetos/jonas-vitorino/guia-identidade-visual.pdf',
      cover: '/projetos/jonas-vitorino/guia-capa.jpg',
      title: 'Guia de identidade visual',
      text: 'Cores, tipografia, símbolo, componentes e tom de voz da marca, para que toda peça nova pareça feita pela mesma mão.',
    }
  },
  {
    status: 'demo',
    slug: 'dimarte-autosom',
    title: 'Dimarte Autosom',
    kind: 'Landing page · Comércio local',
    description:
      'Página para uma loja de som automotivo, criada para transformar quem chega pelo Google ou pelo Instagram em um orçamento no WhatsApp, sem o cliente precisar ligar ou ir até a loja.',
    delivers: [
      'Pedido de orçamento direto no WhatsApp',
      'Separa quem quer orçamento de quem quer agendar',
      'Preparada para aparecer nas buscas do Google',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://dimarteautosom.vercel.app/',
    image: '/dimarte.png'
  },
  {
    status: 'demo',
    slug: 'divitto-pizzaria',
    title: 'Di Vitto Pizzaria',
    kind: 'Landing page · Restaurante local',
    description:
      'Página para uma pizzaria de forno a lenha em São Paulo, feita para converter quem chega pelo Instagram ou pelo Google direto em um pedido, sem obrigar o cliente a escolher entre WhatsApp e iFood.',
    delivers: [
      'Botões diretos para pedido no WhatsApp e no iFood',
      'Cardápio e localização sempre visíveis',
      'Fotos e vídeo do forno a lenha em destaque',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://divittopizzaria.vercel.app/',
    image: '/divitto.jpg'
  },
  {
    status: 'demo',
    slug: 'flow-taquaral',
    title: 'Flow Taquaral',
    kind: 'Landing page · Restaurante local',
    description:
      'Página para uma casa de comida saudável em Campinas (crepes, sucos e bowls), pensada para quem descobre o Flow pelo Instagram decidir na hora entre pedir pelo WhatsApp ou pelo iFood.',
    delivers: [
      'Botões diretos para pedido no WhatsApp e no iFood',
      'Cardápio com fotos reais dos pratos',
      'Depoimentos de clientes em destaque',
      'Abre rápido e se ajusta à tela do celular',
    ],
    url: 'https://sejaflow.vercel.app/',
    image: '/flow.jpg'
  },
]
