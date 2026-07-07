import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ArViewerScreen.dart';

// ── Seta desenhada via CustomPaint (não depende de fonte de ícone) ──
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

class FaunaPage extends StatelessWidget {
  const FaunaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Banner com imagem de capa + botão de voltar ──
            _CoverImage(
              imagePath: 'assets/images/fauna.jpeg',
              title: 'FAUNA',
            ),

            // ── Corpo da página ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto introdutório
                  const Text(
                    'A fauna representa a diversidade de animais que habitam nosso '
                    'planeta, revelando a riqueza da vida em diferentes ecossistemas. '
                    'Cada espécie possui características únicas e desempenha um papel '
                    'fundamental no equilíbrio da natureza. A seguir, explore '
                    'curiosidades fascinantes sobre o mundo animal.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Card: Raposa ──
                  _ContentCard(
                    title: 'Raposa — Inteligência e adaptação',
                    intro:
                        'A raposa é conhecida por sua astúcia e capacidade de '
                        'adaptação a diferentes ambientes:',
                    bullets: const [
                      'Possui sentidos extremamente aguçados, especialmente audição e olfato.',
                      'Consegue viver tanto em florestas quanto em áreas urbanas.',
                      'Sua cauda ajuda no equilíbrio e também a se proteger do frio.',
                      'É um animal solitário e muito estratégico na caça.',
                    ],
                    onArButtonPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ArViewerScreen(
                            title: 'Raposa',
                            modelUrl: 'assets/models/fox.glb',
                            accentColor: Color.fromARGB(255, 192, 105, 47),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                   _ContentCard(
                    title: 'Coelho — O Mestre dos saltos',
                    intro:
                        'O coelho é um mamífero ágil e dócil, conhecido por  '
                        'suas longas orelhas e grandes saltos:',
                    bullets: const [
                      'Possui orelhas longas que ajudam a detectar sons e a regular a temperatura corporal.',
                      'Pode saltar grandes distâncias graças às suas fortes patas traseiras.',
                      'É um animal herbívoro, alimentando-se principalmente de capim, folhas e vegetais.',
                      'Vive em tocas e costuma ser mais ativo ao amanhecer e ao entardecer.',
                      'Vive em tocas e costuma ser mais ativo ao amanhecer e ao entardecer'
                    ],
                     onArButtonPressed: () {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => const ArViewerScreen(
                             title: 'Coelho',
                             modelUrl: 'assets/models/rabbit.glb',
                             accentColor: Color.fromARGB(255, 192, 105, 47),
                           ),
                         ),
                       );
                     },
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Componente: imagem de capa com overlay e título
// ─────────────────────────────────────────────
class _CoverImage extends StatelessWidget {
  const _CoverImage({
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagem de fundo
        SizedBox(
          width: double.infinity,
          height: 220,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),

        // Overlay escuro gradiente
        Container(
          width: double.infinity,
          height: 220,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xAA000000),
              ],
            ),
          ),
        ),

        // Título sobre a imagem
        Positioned(
            bottom: 5,
            left: 15,
          child: Text(
            title,
            style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: 65,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
            ),
          ),
        ),

        
        // Botão voltar
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
    );
  }
}

// ─────────────────────────────────────────────
// Componente: card de conteúdo reutilizável
// ─────────────────────────────────────────────
class _ContentCard extends StatelessWidget {
  const _ContentCard({
    required this.title,
    required this.intro,
    required this.bullets,
    required this.onArButtonPressed,
  });

  final String title;
  final String intro;
  final List<String> bullets;
  final VoidCallback onArButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título do card
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),

          const SizedBox(height: 12),

          // Introdução
          Text(
            intro,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF444444),
            ),
          ),

          const SizedBox(height: 12),

          // Bullets de curiosidades
          ...bullets.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF444444),
                      height: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Color(0xFF444444),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Botão "Ver em realidade aumentada"
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onArButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 192, 105, 47),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Ver em realidade aumentada',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
