import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArViewerScreen extends StatelessWidget {
  final String title;
  final String modelUrl;

  const ArViewerScreen({
    super.key,
    required this.title,
    required this.modelUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Identifica se a obra é a Noite Estrelada
    final bool isWallModel = title.toLowerCase().contains('noite estrelada') || 
                             title.toLowerCase().contains('quadro');

    // ◄ A SOLUÇÃO DEFINITIVA: Forçar os parâmetros nativos do Scene Viewer do Android por Intent URL
    // Se for parede, passamos o placement=wall E também o modo ar_only para blindar o comportamento
    final String finalUrl = isWallModel
        ? '$modelUrl#Intent;scheme=https;package=com.google.ar.core;action=android.intent.action.VIEW;S.browser_fallback_url=https://developers.google.com/ar;end;ar-placement=wall;mode=ar_only'
        : modelUrl;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          title, 
          style: GoogleFonts.leagueSpartan(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // O visualizador 3D limpo rodando a URL formatada por intent
          ModelViewer(
            backgroundColor: Colors.black,
            src: finalUrl,
            alt: 'Modelo 3D - $title',
            ar: true, 
            arModes: const ['scene-viewer', 'quick-look'],
            autoRotate: true,
            cameraControls: true, 
            disableZoom: false,
          ),

          // Texto de instrução dinâmico na tela preta
          Positioned(
            top: 24,
            left: 20,
            right: 20,
            child: IgnorePointer(
              child: Column(
                children: [
                  Text(
                    'Obra carregada com sucesso!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isWallModel
                        ? 'Clique no botão do cubo abaixo e aponte para uma PAREDE'
                        : 'Clique no botão do cubo abaixo e aponte para o CHÃO',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF7B4FA6),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}