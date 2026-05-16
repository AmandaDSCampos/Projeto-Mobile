import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'arte.dart';
import 'fauna_page.dart';
import 'astronomia_page.dart';
import 'anatomia.dart';

void main() {
  runApp(const Learning3DApp());
}

class Learning3DApp extends StatelessWidget {
  const Learning3DApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning 3D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class SubjectCard {
  final String title;
  final String imagePath;
  final Color overlayColor;

  const SubjectCard({
    required this.title,
    required this.imagePath,
    required this.overlayColor,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista de matérias — substitua os imagePath pelos seus assets reais
  static const List<SubjectCard> subjects = [
    SubjectCard(
      title: 'ARTE',
      imagePath: 'assets/images/arte.jpeg',
      overlayColor: Color(0x66A855C8), // roxo semitransparente
    ),
    SubjectCard(
      title: 'ANATOMIA',
      imagePath: 'assets/images/anatomia.jpeg',
      overlayColor: Color(0x662E8B6E), // verde semitransparente
    ),
    SubjectCard(
      title: 'FAUNA',
      imagePath: 'assets/images/fauna.jpeg',
      overlayColor: Color(0x66D4614A), // salmão semitransparente
    ),
    SubjectCard(
      title: 'ASTRONOMIA',
      imagePath: 'assets/images/astronomia.jpeg',
      overlayColor: Color(0x661A3A6B), // azul escuro semitransparente
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // Título principal
              Text(
                'LEARNING\n3D',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 24),

              // Subtítulo
              Text(
                'Minhas matérias',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              // Grid de cards
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return _SubjectCardWidget(card: subjects[index]);
                  },
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubjectCardWidget extends StatelessWidget {
  final SubjectCard card;

  const _SubjectCardWidget({required this.card});

 @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
  if (card.title == 'ARTE') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ArteScreen(),
      ),
    );
  } else if (card.title == 'FAUNA') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FaunaPage(),
      ),
    );
  } else if (card.title == 'ASTRONOMIA') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AstronomiaPage(),
      ),
    );
  }
   else if (card.title == 'ANATOMIA') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AnatomiaPage(),
      ),
    );
  }
},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagem de fundo
            Image.asset(
              card.imagePath,
              fit: BoxFit.cover,
              // Fallback caso o asset não seja encontrado
              errorBuilder: (context, error, stackTrace) => Container(
                color: card.overlayColor.withOpacity(0.6),
              ),
            ),

            // Overlay colorido semitransparente
            Container(
              decoration: BoxDecoration(
                color: card.overlayColor,
              ),
            ),

            // Gradiente escuro na parte inferior para legibilidade
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.45),
                    ],
                  ),
                ),
              ),
            ),

            // Título do card
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                card.title,
                style: GoogleFonts.leagueSpartan(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}