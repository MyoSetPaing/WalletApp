import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet_app/screen/home_screen.dart';

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/images/splash_icon.png'),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.fade, //with that line commented there is no error
          nextScreen: const HomeScreen(),
          backgroundColor: Colors.white
      ),
    );
  }
}
