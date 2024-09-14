import 'package:flox/Chits/chits.dart';
import 'package:flox/HomePage.dart';
import 'package:flox/Pots/purchased_pots.dart';
import 'package:flox/User_Profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int index = 0;
  final List<Widget> pages = [
    const Homepage(),
    const PurchasedPotPage(),
    PurchasedChitsScreen(),
    UserProfile(),
    const Center(
      child: Text(
        'Pots',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Chits',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 72),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        width: size.width,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.06),
          color: Colors.white,
        ),
        child: GNav(
            gap: size.width * 0.02,
            backgroundColor: Colors.white,
            color: const Color(0Xff9DB2CE),
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0Xff161E67),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.015,
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Text',
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              height: 1.2,
              letterSpacing: 0.08,
              textBaseline: TextBaseline.alphabetic,
            ),
            onTabChange: (val) {
              setState(() {
                index = val;
              });
            },
            tabs: [
              GButton(
                icon: Icons.circle,
                leading: Image.asset(
                  'assets/home.png',
                  color: index == 0 ? Colors.white : const Color(0Xff9DB2CE),
                ),
                text: 'Home',
              ),
              GButton(
                icon: Icons.circle,
                leading: Image.asset(
                  'assets/bottom2.png',
                  color: index == 1 ? Colors.white : const Color(0Xff9DB2CE),
                ),
                text: 'Pots',
              ),
              GButton(
                icon: Icons.circle,
                leading: Image.asset(
                  'assets/bottom3.png',
                  color: index == 2 ? Colors.white : const Color(0Xff9DB2CE),
                ),
                text: 'Chits',
              ),
              const GButton(
                icon: Icons.person_3_rounded,
                text: 'Profile',
              ),
            ]),
      ),
      body: pages[index],
    );
  }
}
