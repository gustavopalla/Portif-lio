import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final yellowColor = AppTheme.vibrantYellow;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      width: double.infinity, // Ocupa a largura total
      alignment: Alignment.center, // Centraliza o conteúdo no monitor
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40, // Respiro para não colar nos cantos
        vertical: 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200), // Limite padrão do seu site
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha o título e os cards à esquerda do bloco central
          children: [
            // Título
            Text(
              'Experiências',
              style: GoogleFonts.poppins(
                color: yellowColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 56), 
            
            // Lista de Experiências
            Column(
              children: [
                _buildExperienceCard(
                  context: context,
                  isMobile: isMobile,
                  yellowColor: yellowColor,
                  period: '2026 — Presente',
                  role: 'Consultor de Implantação Júnior',
                  company: 'TAB - Think About Business',
                  description: 
                      'Atuação no suporte e implantação do sistema SE Suite, suporte técnico aos usuários.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required bool isMobile,
    required Color yellowColor,
    required String period,
    required String role,
    required String company,
    required String description,
  }) {
    return _HoverableCard(
      yellowColor: yellowColor,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 24 : 40), // Padding menor no mobile
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              period,
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.4),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              role,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              company,
              style: GoogleFonts.poppins(
                color: yellowColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.7),
                fontSize: isMobile ? 15 : 16,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverableCard extends StatefulWidget {
  final Widget child;
  final Color yellowColor;

  const _HoverableCard({required this.child, required this.yellowColor});

  @override
  State<_HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<_HoverableCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: () {}, 
        borderRadius: BorderRadius.circular(20),
        splashColor: widget.yellowColor.withOpacity(0.05),
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity, // CORRIGIDO: Agora respeita o pai e não força 1500px
          decoration: BoxDecoration(
            color: const Color(0xFF0A0A0A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered ? widget.yellowColor : Colors.white.withOpacity(0.05),
              width: 1.5,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.yellowColor.withOpacity(0.05),
                  blurRadius: 30,
                  spreadRadius: 2,
                )
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}