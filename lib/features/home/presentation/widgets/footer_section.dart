import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  // Função para abrir o e-mail
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
    } else {
      throw 'Não foi possível abrir o e-mail $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.black, // Cor de fundo conforme o seu design
      child: Column(
        children: [
          const Divider(color: Colors.white24), // Linha sutil acima
          const SizedBox(height: 20),
          
          const Text(
            '© 2026 Gustavo Palla — Desenvolvido com 💙',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}