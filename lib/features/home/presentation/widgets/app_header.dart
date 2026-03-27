import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
// 1. Não esqueça do import do pacote
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Uri _url = Uri.parse('https://w.app/rxdhuo');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 20,
      ),
      color: AppTheme.pureBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          
          if (size.width > 600)
            Text(
              'Gustavo Palla',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
          
          // 2. Substituindo pelo ícone do WhatsApp
          TextButton.icon(
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp, 
              color: Colors.green, // Ou AppTheme.vibrantYellow para manter a paleta
              size: 24,
            ),
            label: Text(
              'Entre em contato comigo direto no WhatsApp', 
              textAlign: TextAlign.center, 
              style: const TextStyle(color: AppTheme.lightGrey), // O parâmetro correto é style
            ),
            onPressed: () async {
              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            },
          ),
        ],
      ),
    );
  }
}