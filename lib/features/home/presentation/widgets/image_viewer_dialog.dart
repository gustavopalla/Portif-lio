import 'package:flutter/material.dart';

class ImageViewerDialog extends StatelessWidget {
  final String imagePath;

  const ImageViewerDialog({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 700;

    return Dialog(
      backgroundColor: Colors.transparent, // Permite o blur/escurecimento do fundo
      elevation: 0,
      insetPadding: EdgeInsets.all(isMobile ? 10 : 20), // Margem mínima do monitor
      child: Stack(
        alignment: Alignment.center,
        children: [
          // A Imagem Expandida (com limite de tamanho para monitores grandes)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.9, // Máximo 90% da largura da tela
              maxHeight: size.height * 0.9, // Máximo 90% da altura da tela
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Garante que a imagem inteira apareça sem cortes
              ),
            ),
          ),
          
          // Botão Fechar (X) no canto superior direito da imagem
          Positioned(
            top: 10,
            right: 10,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black54,
              child: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context), // Fecha este diálogo
            ),
          ),
        ],
      ),
    );
  }
}