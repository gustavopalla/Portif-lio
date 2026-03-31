import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portifolio_app/features/home/presentation/widgets/projects_detail_modal.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // Função para abrir links externos
  Future<void> _launchExternalUrl(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(uri)) {
      debugPrint('Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final yellowColor = AppTheme.vibrantYellow;
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projetos',
              style: GoogleFonts.poppins(
                color: yellowColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),

            // Exemplo de Projeto
            _buildProjectCard(
              context: context,
              isMobile: isMobile,
              yellowColor: yellowColor,
              title: 'BookFinder',
              description:
                  'Um buscador livros desenvolvido para facilitar a localização de arquivos PDF na internet. A ideia desse projeto veio de uma necessidade real. Minha namorada precisava facilitar a busca dela por PDFs para colocar subir no kindle que ela tem. Como ela tem Iphone, então não queria pagar uma taxa para a apple para subir minha aplicação para IOS. Então subi o projeto na vercel para que ela pudesse utilizar via web e o projeto ficou responsivo para computador e para mobile.',
              tags: [
                'Flutter Web/Android',
                'NodeJS',
                'TypeScript',
                'Render',
                'API Serper.dev',
              ],
              url: 'https://book-finder-lilac-six.vercel.app/',
              imagePath: 'assets/projects/bookfinder/3.png',
              screenshotPaths: [
                'assets/projects/bookfinder/1.png',
                'assets/projects/bookfinder/2.png',
              ],
            ),
            SizedBox(height: 42),
            _buildProjectCard(
              context: context,
              isMobile: isMobile,
              yellowColor: yellowColor,
              title: 'AirMouse',
              description:
                  'Este projeto transforma um smartphone em um mouse sem fio utilizando o giroscópio do dispositivo e comunicação via WebSockets. Utiliza os sensores de giroscópio (Pitch, Roll e Yaw) para traduzir inclinações do celular em deslocamento do cursor no PC.',
              tags: ['Flutter', 'NodeJS', 'TypeScript'],
              url: 'https://github.com/gustavopalla/AirMouse---App',
              imagePath: 'assets/projects/airmouse/1.jpeg',
              screenshotPaths: [
                'assets/projects/airmouse/1.jpeg',
                'assets/projects/airmouse/2.jpeg',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required bool isMobile,
    required Color yellowColor,
    required String title,
    required String description,
    required List<String> tags,
    required String url,
    required List<String> screenshotPaths,
    String? imagePath, // Imagem principal do card (opcional)
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: isMobile ? double.infinity : 260,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(16),
              ),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.broken_image,
                        color: Colors.white10,
                        size: 48,
                      ),
                    )
                  : const Icon(
                      Icons.broken_image,
                      color: Colors.white10,
                      size: 48,
                    ),
            ),
          ),
          const SizedBox(width: 40, height: 32),

          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),

                // Botões com ações separadas
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  children: [
                    // AÇÃO 1: Abrir Link Externo
                    _ActionButton(
                      label: 'Ver projeto',
                      icon: Icons.open_in_new,
                      color: yellowColor,
                      onTap: () => _launchExternalUrl(url),
                    ),

                    // AÇÃO 2: Abrir Modal de Screenshots
                    _ActionButton(
                      label: '${screenshotPaths.length} screenshots',
                      icon: Icons.image_outlined,
                      color: Colors.white24,
                      onTap: () => _openModal(
                        context,
                        title,
                        description,
                        url,
                        screenshotPaths,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openModal(
    BuildContext context,
    String title,
    String desc,
    String url,
    List<String> paths,
  ) {
    showDialog(
      context: context,
      builder: (context) => ProjectsDetailModal(
        title: title,
        description: desc,
        url: url,
        screenshots: paths,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, color: color, size: 18),
          ],
        ),
      ),
    );
  }
}
