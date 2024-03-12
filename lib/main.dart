import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_movie_app_tmdb/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App TMDB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Intermediatescreen(),
    );
  }
}

class Intermediatescreen extends StatefulWidget {
  const Intermediatescreen({super.key});

  @override
  State<Intermediatescreen> createState() => _intermediatescreenState();
}

class _intermediatescreenState extends State<Intermediatescreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // disableNavigation: true,
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),

      duration: 2000,
      nextScreen: const HomePage(),
      splash: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/icon.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: const Text(
                    'By Prabhat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // splash: Image.asset('assets/images/background.jpg'),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
      // centered: false,
    );
  }
}
