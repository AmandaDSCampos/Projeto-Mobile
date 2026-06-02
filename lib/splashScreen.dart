import 'package:flutter/material.dart';
import 'teladeCards.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FUNDO
          SizedBox.expand(
            child: Image.asset(
              'assets/images/SplashScreen.png',
              fit: BoxFit.cover,
            ),
          ),

          // LOGO CENTRAL
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}