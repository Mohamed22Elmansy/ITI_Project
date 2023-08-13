import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iti_project/screens/nav_hone.dart';
import 'package:iti_project/screens/nav_person.dart';
import 'package:iti_project/screens/nav_sections.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int _selectedIndex = 0;
  static final List<Widget> _screen = <Widget>[
    Nav_Home(),
    Nav_Person(),
    const Nav_Sections(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: GNav(
          rippleColor: Colors.grey[800]!,
          hoverColor: Colors.grey[700]!,
          haptic: true,
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[800]!,
          backgroundColor: Colors.black,
          color: Colors.white,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
              iconSize: 27,
            ),
            GButton(
              icon: Icons.person,
              text: "Account",
              iconSize: 27,
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
              iconSize: 27,
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
