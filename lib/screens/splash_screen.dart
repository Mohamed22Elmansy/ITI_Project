import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/screens/login_screen.dart';

import 'home_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => (FirebaseAuth.instance.currentUser == null)
                ? const Login_Screen()
                : const Home_Screen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcom In ",
            style: GoogleFonts.merriweather(
              color: Colors.amber,
              fontSize: 60,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Image(
            image: NetworkImage(
                'https://calculator.itimanufacturing.com/img/iti-logo.png'),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => (FirebaseAuth.instance.currentUser == null)
                  ? const Login_Screen()
                  : const Home_Screen(),
            ),
          );
        },
        child: Text(
          "Skip >>>",
          style: GoogleFonts.libreBaskerville(
            color: Colors.white,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
