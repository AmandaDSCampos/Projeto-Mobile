import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Importe a tela do visualizador AR. Certifique-se de que o caminho do arquivo está correto:
import 'ArViewerScreen.dart'; 

class _BackArrow extends CustomPainter {
  final Color color;
  const _BackArrow({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double cx = size.width / 2;
    final double cy = size.height / 2;

    final path = Path()
      ..moveTo(cx + 5, cy - 7)
      ..lineTo(cx - 4, cy)
      ..lineTo(cx + 5, cy + 7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}

class ArtSection {
  final String title;
  final String body;
  final String glbUrl;  // URL para Android

  const ArtSection({
    required this.title,
    required this.body,
    required this.glbUrl,  
  });
}

const String _introBody =
    'A arte tem o poder de atravessar séculos e ainda provocar emoções, '
    'dúvidas e fascínio. Algumas obras se tornaram tão marcantes que continuam '
    'sendo estudadas, reinterpretadas e admiradas até hoje. A seguir, você vai '
    'conhecer curiosidades e detalhes interessantes sobre algumas dessas '
    'criações famosas.';

// ── LISTA DE SEÇÕES COM OS LINKS DO SEU DRIVE CONFIGURADOS ──
const List<ArtSection> _sections = [
  ArtSection(
    title: 'O Pensador — Auguste Rodin',
    body: 'Inaugurada em 1904, esta icônica escultura de bronze representa um homem em meditação profunda, lutando com uma poderosa força interna:\n\n'
        '• Originalmente, a obra não foi feita de forma isolada; ela fazia parte de um portal monumental chamado "As Portas do Inferno", baseado na Divina Comédia de Dante.\n\n'
        '• A figura representa o próprio Dante Alighieri na frente das portas, reflecting sobre o destino da humanidade.',
    glbUrl: 'assets/models/Pensador.glb',
  ),
  ArtSection(
    title: 'A Noite Estrelada — Vincent van Gogh',
    body: 'Pintada em 1889, essa é uma das obras mais reconhecidas do mundo. '
        'Mas por trás da beleza das espirais no céu, existem detalhes pouco '
        'conhecidos:\n\n'
        '• Van Gogh criou a obra enquanto estava internado em um hospital psiquiátrico...\n\n'
        '• Os redemoinhos no céu apresentam padrões semelhantes à turbulência matemática de fluidos.',
    glbUrl: 'assets/models/NoiteEstreladaQuadro.glb',
  ),  
];

class ArteScreen extends StatelessWidget {
  const ArteScreen({super.key});

  static const Color _purple = Color(0xFF7B4FA6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Principal
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Image.asset(
                    'assets/images/arte.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xAA000000)],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 15,
                  child: Text(
                    'ARTE',
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CustomPaint(
                        painter: const _BackArrow(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Conteúdo textual e Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _introBody,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ..._sections.map(
                    (section) => _SectionCard(
                      section: section,
                      accentColor: const Color.fromARGB(255, 125, 92, 147),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final ArtSection section;
  final Color accentColor;

  const _SectionCard({
    required this.section,
    required this.accentColor,
  });

  // Direciona o fluxo para a tela preta com feedback visual ativo
  void _openDirectAR(BuildContext context, String title, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArViewerScreen(
          title: title,
          modelUrl: url,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E8E8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: GoogleFonts.leagueSpartan(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            section.body,
            style: GoogleFonts.roboto(
              fontSize: 13.5,
              height: 1.65,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (section.glbUrl.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Modelo 3D ainda não disponível para esta obra.')),
                  );
                  return;
                }
                
                _openDirectAR(context, section.title, section.glbUrl);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Text(
                'Ver em realidade aumentada',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}