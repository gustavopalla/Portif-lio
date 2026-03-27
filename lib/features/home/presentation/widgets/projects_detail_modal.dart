import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio_app/core/theme/app_theme.dart';
import 'image_viewer_dialog.dart'; 

// Ajustado para ProjectDetailsModal (sem o 's' no meio) para bater com o construtor
class ProjectsDetailModal extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final List<String> screenshots;

  const ProjectsDetailModal({
    super.key,
    required this.title,
    required this.description,
    required this.url,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    final yellowColor = AppTheme.vibrantYellow;
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 16 : 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Container(
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0A0A),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- CABEÇALHO ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close, color: yellowColor, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // --- LINK DO PROJETO ---
                  InkWell(
                    onTap: () => debugPrint('Navegando para: $url'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.link, color: Colors.blueAccent, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          url,
                          style: GoogleFonts.poppins(
                            color: Colors.blueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- DESCRIÇÃO ---
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // --- GRADE DE SCREENSHOTS ---
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: screenshots.length,
                    itemBuilder: (context, index) {
                      return _InteractiveScreenshotCard(
                        imagePath: screenshots[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- WIDGET PARA O CARD INTERATIVO ---
class _InteractiveScreenshotCard extends StatefulWidget {
  final String imagePath;
  const _InteractiveScreenshotCard({required this.imagePath});

  @override
  State<_InteractiveScreenshotCard> createState() =>
      _InteractiveScreenshotCardState();
}

class _InteractiveScreenshotCardState extends State<_InteractiveScreenshotCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, _isHovering ? -10 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovering
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.8),
              builder: (context) => ImageViewerDialog(imagePath: widget.imagePath),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.white10,
                    child: const Icon(Icons.broken_image, color: Colors.white10),
                  ),
                ),
                if (_isHovering)
                  Container(
                    color: Colors.black38,
                    child: const Icon(Icons.zoom_in, color: Colors.white, size: 32),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}