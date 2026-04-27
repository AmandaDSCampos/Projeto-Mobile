import 'package:flutter/material.dart';

class AstronomiaPage extends StatelessWidget {
  const AstronomiaPage({super.key});

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
              imagePath: 'assets/images/astronomia.jpeg',
              title: 'ASTRONOMIA',
            ),

            // ── Corpo da página ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto introdutório
                  const Text(
                    'A astronomia é a ciência que estuda os corpos celestes e os '
                    'fenômenos do universo. Desde os planetas do nosso sistema solar '
                    'até galáxias distantes, ela nos ajuda a compreender melhor o '
                    'cosmos e o nosso lugar nele. A seguir, descubra curiosidades '
                    'incríveis sobre o espaço.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Card: Saturno ──
                  _ContentCard(
                    title: 'Saturno — O gigante dos anéis',
                    intro:
                        'Saturno é um dos planetas mais impressionantes do '
                        'sistema solar:',
                    bullets: const [
                      'É conhecido por seus extensos e brilhantes anéis.',
                      'É o segundo maior planeta do sistema solar.',
                      'Possui mais de 80 luas conhecidas.',
                      'Sua composição é predominantemente de gases, como hidrogênio e hélio.',
                    ],
                    onArButtonPressed: () {
                      // Integrar com realidade aumentada
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
          bottom: 16,
          left: 20,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),

        // Botão voltar
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 12,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
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
                backgroundColor: const Color(0xFF7B3FA0),
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
