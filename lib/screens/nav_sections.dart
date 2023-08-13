import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/screens/Devoloper.dart';
import 'package:iti_project/screens/about_us.dart';
import 'package:iti_project/screens/login_screen.dart';

class Nav_Sections extends StatelessWidget {
  const Nav_Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: const Icon(Icons.accessibility_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "About Us",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const About_Us(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: const Icon(Icons.developer_mode_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Devolopers",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Devolopers(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: const Icon(Icons.login_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Log Out",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Login_Screen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Image.network(
                  "https://calculator.itimanufacturing.com/img/iti-logo.png")
            ],
          ),
        ),
      ),
    );
  }
}
