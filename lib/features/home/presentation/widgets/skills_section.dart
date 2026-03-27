import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio_app/features/home/classes/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = Skill.mainSkills;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity, // Ocupa a largura total para permitir centralização
      alignment: Alignment.center, // Centraliza o bloco de habilidades no monitor
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200), // Mantendo o padrão de 1200px
        child: Column(
          children: [
            Text(
              'Habilidades',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.vibrantYellow,
              ),
            ),
            const SizedBox(height: 50),
            
            // Grid adaptável
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // Melhorei a lógica de colunas para telas médias (tablets)
                crossAxisCount: screenWidth < 600 ? 2 : (screenWidth < 1000 ? 3 : 5),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return _SkillCard(skill: skills[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Interno do Card
class _SkillCard extends StatelessWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A), // Ajustado para o preto profundo que você usa nos outros cards
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          skill.isFaIcon
              ? FaIcon(skill.icon, color: skill.iconColor, size: 32)
              : Icon(skill.icon, color: skill.iconColor, size: 32),
          const SizedBox(height: 12),
          Text(
            skill.name,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}