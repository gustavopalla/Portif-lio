import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final yellowColor = AppTheme.vibrantYellow;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      width: double.infinity, // Ocupa a largura total para permitir centralização
      alignment: Alignment.center, // Garante que o conteúdo fique no meio em monitores grandes
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40, // Respiro para não colar nas bordas do monitor
        vertical: 60,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200), // Limite de largura elegante
        child: Container(
          padding: EdgeInsets.all(isMobile ? 32 : 60),
          decoration: BoxDecoration(
            // Mesma cor do bloco de código da Hero Section
            color: const Color(0xFF0A0A0A), 
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: yellowColor.withOpacity(0.03),
                blurRadius: 60,
                spreadRadius: 10,
              )
            ],
          ),
          child: isMobile 
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContent(yellowColor, isMobile),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildContent(yellowColor, isMobile),
                ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(Color yellowColor, bool isMobile) {
    return [
      // Texto à esquerda / Superior
      Expanded(
        flex: isMobile ? 0 : 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'QUEM SOU EU?',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Consultor de Implantação JR e futuro Desenvolvedor. '
              'Atualmente cursando Sistemas de informação na UNIP, busco unir a ' // Corrigido: Sistemas
              'tecnologia mobile com experiências de usuário que realmente fazem a diferença. '
              'Focado em Flutter, Dart e integração de sistemas escaláveis.',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontSize: isMobile ? 16 : 18,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
      
      // Espaçamento responsivo
      if (!isMobile) const SizedBox(width: 80) else const SizedBox(height: 48),

      // Elemento visual à direita / Inferior
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar Circular
          Container(
            width: isMobile ? 100 : 130,
            height: isMobile ? 100 : 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: yellowColor.withOpacity(0.4), width: 1.5),
              color: const Color(0xFF121212),
            ),
            alignment: Alignment.center,
            child: Text(
              'GP',
              style: GoogleFonts.poppins(
                color: yellowColor,
                fontSize: isMobile ? 32 : 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Nome Vertical
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              'GUSTAVO PALLA',
              style: GoogleFonts.poppins(
                color: yellowColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 4,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ];
  }
}