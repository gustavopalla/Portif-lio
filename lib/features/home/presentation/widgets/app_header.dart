import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Uri _url = Uri.parse('https://w.app/rxdhuo');
    
    // 1. Definindo o que é mobile (menos de 600px de largura)
    final bool isMobile = size.width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        // Ajustando o padding lateral para mobile (5%) vs desktop (10%)
        horizontal: isMobile ? size.width * 0.05 : size.width * 0.1,
        vertical: 20,
      ),
      color: AppTheme.pureBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [          
          // 2. No mobile, vamos mostrar apenas "Gustavo" ou diminuir a letra
          Text(
            isMobile ? 'Gustavo' : 'Gustavo Palla',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
          ),
          
          // 3. Botão do WhatsApp inteligente
          TextButton.icon(
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp, 
              color: Colors.green, 
              size: 24,
            ),
            // Se for mobile, o texto some para não cortar. Se for desktop, mostra tudo.
            label: isMobile 
              ? const SizedBox.shrink() 
              : Text(
                  'Fale Comigo', // Texto mais curto ajuda na estética
                  style: GoogleFonts.poppins(
                    color: AppTheme.lightGrey,
                    fontSize: 14,
                  ),
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