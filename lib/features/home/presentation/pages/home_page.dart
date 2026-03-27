import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_me.dart';
import '../widgets/experience_section.dart';
import '../widgets/education.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects.section.dart';
import '../widgets/footer_section.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. O controller precisa estar dentro do State para ser persistente
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    // 2. O dispose() só existe em State de StatefulWidget
    _scrollController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pureBlack,
      // 3. O floatingActionButton deve estar DENTRO dos parênteses do Scaffold
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        backgroundColor: AppTheme.vibrantYellow, // Usando sua cor definida
        child: const Icon(Icons.arrow_upward, color: Colors.black),
      ),
      body: SingleChildScrollView(
        // 4. ESSENCIAL: Vincular o controller ao scroll
        controller: _scrollController, 
        child: Column(
          children: [
            AppHeader(),
            HeroSection(),
            AboutMe(),
            const SizedBox(height: 64),
            Education(),
            const SizedBox(height: 64),
            ExperienceSection(),
            const SizedBox(height: 64),
            SkillsSection(),
            const SizedBox(height: 64),
            ProjectsSection(),
            const SizedBox(height: 64),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}