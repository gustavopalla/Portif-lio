// Guardas de animação.
//
// As animações de entrada usam gsap.from/fromTo, que zeram a opacidade
// imediatamente. Se a página abrir numa aba em segundo plano (clique do
// meio, "abrir em nova aba", link compartilhado), o requestAnimationFrame
// é estrangulado pelo navegador, a timeline não avança e o visitante
// encontra a página em branco ao voltar para a aba.
//
// Por isso nada é animado enquanto a aba não estiver visível — e quem
// pediu menos movimento no sistema simplesmente vê o conteúdo parado.

export function prefersReducedMotion() {
  return (
    typeof window !== 'undefined' &&
    window.matchMedia('(prefers-reduced-motion: reduce)').matches
  )
}

/**
 * Roda `run` agora se a aba estiver visível; senão, na primeira vez que ficar.
 * @param {() => void} run
 */
export function whenVisible(run) {
  if (typeof document === 'undefined') return

  if (!document.hidden) {
    run()
    return
  }

  const onShow = () => {
    if (document.hidden) return
    document.removeEventListener('visibilitychange', onShow)
    run()
  }
  document.addEventListener('visibilitychange', onShow)
}

/** Atalho: só executa animações se fizer sentido animar. */
export function animateWhenReady(run) {
  if (prefersReducedMotion()) return
  whenVisible(run)
}
