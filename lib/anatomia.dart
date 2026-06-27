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

class AnatomiaPage extends StatelessWidget {
  const AnatomiaPage({super.key});

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
              imagePath: 'assets/images/anatomia.jpeg',
              title: 'ANATOMIA',
            ),

            // ── Corpo da página ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'A anatomia é a ciência que estuda a estrutura e a organização '
                    'dos seres vivos. Desde os menores tecidos até os grandes sistemas '
                    'do corpo humano, ela nos ajuda a compreender como funcionamos por '
                    'dentro. A seguir, descubra curiosidades incríveis sobre o corpo humano.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const SizedBox(height: 24),

                  _ContentCard(
                    title: 'Coração — O motor do corpo humano',
                    intro:
                        'O coração é um dos órgãos mais vitais e fascinantes '
                        'do corpo humano:',
                    bullets: const [
                      'É um músculo que bate em média 100 mil vezes por dia.',
                      'Possui quatro câmaras: dois átrios e dois ventrículos.',
                      'Bombeia cerca de 5 litros de sangue por minuto em repouso.',
                      'Seu peso médio em adultos é de aproximadamente 300 gramas.',
                    ],
                    onArButtonPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ArViewerScreen(
                            title: 'Coração',
                            modelUrl: 'assets/models/heart.glb',
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  _ContentCard(
                    title: 'Cérebro — O centro de comando',
                    intro: 'O cérebro é o órgão mais complexo do corpo humano:',
                    bullets: const [
                      'Contém aproximadamente 86 bilhões de neurônios.',
                      'Representa cerca de 2% do peso corporal, mas consome 20% da energia.',
                      'É dividido em dois hemisférios com funções complementares.',
                      'Continua se desenvolvendo e formando novas conexões ao longo da vida.',
                    ],
                    onArButtonPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ArViewerScreen(
                            title: 'Cérebro',
                            modelUrl: 'assets/models/brain.glb',
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
  const _CoverImage({required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 220,
          child: Image.asset(imagePath, fit: BoxFit.cover),
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
        // Titulo do Card
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
        // Botão voltar com CustomPaint
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            intro,
            style: const TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF444444)),
          ),
          const SizedBox(height: 12),
          ...bullets.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 14, color: Color(0xFF444444), height: 1.5)),
                  Expanded(
                    child: Text(item, style: const TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF444444))),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onArButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 152, 130),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 0,
              ),
              child: const Text(
                'Ver em realidade aumentada',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
