import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // --- FUNÇÕES DE AÇÃO ---

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'impalla404@gmail.com',
      queryParameters: {
        'subject': 'Contato através do Portfólio',
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  Future<void> _launchCV() async {
    try {
      // Abre o PDF que está na pasta web/
      html.window.open('curriculo.pdf', '_blank');
    } catch (e) {
      debugPrint('Erro ao abrir o PDF: $e');
      final Uri url = Uri.parse('curriculo.pdf');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : size.width * 0.1,
        vertical: 60,
      ),
      child: isMobile 
          ? _buildMobileContent(context)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildDesktopContent(context),
            ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIdentity(isMobile: true),
        const SizedBox(height: 40),
        _buildCodeBlock(context),
      ],
    );
  }

  List<Widget> _buildDesktopContent(BuildContext context) {
    return [
      Expanded(flex: 1, child: _buildIdentity(isMobile: false)),
      const SizedBox(width: 60),
      Expanded(flex: 1, child: _buildCodeBlock(context)),
    ];
  }
  
  Widget _buildIdentity({required bool isMobile}) {
    final yellowColor = AppTheme.vibrantYellow;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Olá,',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 42 : 64,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
            ),
            children: [
              const TextSpan(text: 'Gustavo Palla,\n'),
              TextSpan(
                text: 'Estudante e Futuro Dev',
                style: TextStyle(color: yellowColor.withOpacity(0.9)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ElevatedButton(
              onPressed: _launchEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('CONTATO', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            OutlinedButton(
              onPressed: _launchCV,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white24),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('CURRÍCULO'),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            _SocialIcon(
              icon: FontAwesomeIcons.linkedin, 
              url: 'https://www.linkedin.com/in/gustavopalla',
            ),
            SizedBox(width: 20),
            _SocialIcon(
              icon: FontAwesomeIcons.github, 
              url: 'https://github.com/gustavopalla',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCodeBlock(BuildContext context) {
    const syntaxBlue = Color(0xFF3B82F6); 
    const syntaxWhite = Colors.white;
    const syntaxGrey = Colors.grey;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
        BoxShadow(
          color: AppTheme.vibrantYellow.withOpacity(0.2), 
        
        // 2. Aumentamos o blur para o brilho espalhar mais
        blurRadius: 60, 
        
        // 3. O spreadRadius ajuda a "engrossar" a base do brilho
        spreadRadius: 5, 
        
        // 4. Offset em (0, 0) para o brilho sair por igual em todos os lados
        offset: const Offset(0, 0),
        )
      ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFF5F56), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFFBD2E), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF27C93F), shape: BoxShape.circle)),
                ],
              ),
              const SizedBox(width: 20),
              Text(
                'developer.dart',
                style: GoogleFonts.firaCode(color: syntaxGrey, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(14, (i) => Text(
                  '${i + 1}  ',
                  style: GoogleFonts.firaCode(color: syntaxGrey.withOpacity(0.3), fontSize: 13, height: 1.6),
                )),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.firaCode(fontSize: 13, height: 1.6),
                    children: [
                      _code('class ', syntaxBlue),
                      _code('Role {\n', syntaxWhite),
                      _code('  nome = ', syntaxBlue),
                      _code('"Gustavo Palla"', syntaxWhite),
                      _code(';\n', syntaxWhite),
                      _code('  cargo = ', syntaxBlue),
                      _code('"Consultor de Implantação JR e Futuro Dev"', syntaxWhite),
                      _code(';\n', syntaxWhite),
                      _code('  skills = [\n', syntaxBlue),
                      _code('    "Flutter"', syntaxWhite),
                      _code(', ', syntaxGrey),
                      _code('"Dart"', syntaxWhite),
                      _code(',\n', syntaxGrey),
                      _code('    "Supabase"', syntaxWhite),
                      _code(', ', syntaxGrey),
                      _code('"REST APIs"', syntaxWhite),
                      _code(',\n', syntaxGrey),
                      _code('    "Git"', syntaxWhite),
                      _code(', ', syntaxGrey),
                      _code('"NodeJS"', syntaxWhite),
                      _code(',\n', syntaxGrey),
                      _code('    "Typescript"', syntaxWhite),
                      _code('\n  ];\n', syntaxWhite),
                      _code('  build', syntaxBlue),
                      _code('() {\n', syntaxWhite),
                      _code('    return ', syntaxBlue),
                      _code('"Apps incríveis"', syntaxWhite),
                      _code(';\n', syntaxWhite),
                      _code('  }\n', syntaxWhite),
                      _code('}', syntaxWhite),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextSpan _code(String text, Color color) {
    return TextSpan(text: text, style: TextStyle(color: color));
  }
}

class _SocialIcon extends StatefulWidget {
  final dynamic icon; 
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: FaIcon(
            widget.icon, 
            size: 24,
            color: _isHovered ? AppTheme.vibrantYellow : Colors.grey,
          ),
        ),
      ),
    );
  }
}