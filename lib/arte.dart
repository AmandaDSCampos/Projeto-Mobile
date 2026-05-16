import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class ArtSection {
  final String title;
  final String body;
  const ArtSection({required this.title, required this.body});
}

const String _introBody =
    'A arte tem o poder de atravessar séculos e ainda provocar emoções, '
    'dúvidas e fascínio. Algumas obras se tornaram tão marcantes que continuam '
    'sendo estudadas, reinterpretadas e admiradas até hoje. A seguir, você vai '
    'conhecer curiosidades e detalhes interessantes sobre algumas dessas '
    'criações famosas.';

const List<ArtSection> _sections = [
  ArtSection(
    title: 'A Noite Estrelada — Vincent van Gogh',
    body: 'Pintada em 1889, essa é uma das obras mais reconhecidas do mundo. '
        'Mas por trás da beleza das espirais no céu, existem detalhes pouco '
        'conhecidos:\n\n'
        '• Van Gogh criou a obra enquanto estava internado em um hospital '
        'psiquiátrico em Saint-Rémy-de-Provence.\n\n'
        '• A paisagem não é exatamente o que ele via da janela — ele misturou '
        'realidade com imaginação.\n\n'
        '• Os redemoinhos no céu já foram analisados por cientistas e '
        'apresentam padrões semelhantes à turbulência de fluidos.\n\n'
        '• Apesar de hoje ser considerada uma obra-prima, Van Gogh vendeu '
        'apenas um quadro em vida.',
  ),
  ArtSection(
    title: 'Emma in a Straw Hat — Mary Cassatt',
    body: 'Essa obra, criada por Mary Cassatt, destaca-se pela delicadeza e '
        'pelo olhar intimista:\n\n'
        '• Cassatt foi uma das poucas mulheres associadas ao movimento '
        'impressionista.\n\n'
        '• A pintura retrata uma jovem com um chapéu de palha, transmitindo '
        'leveza e naturalidade — características marcantes do impressionismo.\n\n'
        '• A artista tinha grande interesse em retratar a vida cotidiana, '
        'especialmente mulheres e crianças.\n\n'
        '• Diferente de muitos artistas da época, Cassatt focava em cenas '
        'domésticas e íntimas, trazendo uma nova perspectiva para a arte.',
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
            // 🔹 BANNER COM IMAGEM + GRADIENTE + TÍTULO
            Stack(
              children: [
                // Imagem de fundo full-width
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Image.asset(
                    'assets/images/arte.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),

                // Overlay gradiente escuro
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

                // Título no canto inferior esquerdo
                Positioned(
                  bottom: 16,
                  left: 20,
                  child: Text(
                    'ARTE',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                // Botão de voltar
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

            // 🔹 CONTEÚDO
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
                      accentColor: _purple,
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
              onPressed: () => debugPrint('Abrir AR: ${section.title}'),
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
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