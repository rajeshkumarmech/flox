import 'dart:ui';

import 'package:flox/Chits_Investment.dart';
import 'package:flox/Saving_chit.dart';
import 'package:flox/about_us.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Image.asset('assets/logo.png'),
        actions: [
          Image.asset('assets/Foxl.png', width: 300),
          const SizedBox(width: 10),
          const Icon(Icons.notifications_sharp, color: Colors.white, size: 30),
          const SizedBox(width: 10),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: size.height / 1.8,
                width: size.width,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.95,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/homepageimage.jpg',
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.height / 1.8,
                          ),
                          Container(
                            width: size.width,
                            height: size.height / 1.8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              'Welcome to Chits',
                              style: TextStyle(
                                fontFamily: 'Paytone One',
                                fontWeight: FontWeight.w400,
                                fontSize: 35,
                                height: 44 / 32,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'We’re here to help you save and invest for your',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    height: 19 / 13,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'future. Get started with as little as 5',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    height: 19 / 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ],
                ),
              ),
              nextpageinhome(
                size,
                'Fixed Chit Investment',
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ChitsInvestment()),
                ),
              ),
              nextpageinhome(size, 'Saving Chit Pots', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const SavingChit()),
                );
              }),
              nextpageinhome(size, 'Other Investment', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AboutUs()),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector nextpageinhome(Size size, String text, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 12,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.white, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 22 / 15,
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.play_arrow_rounded,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
