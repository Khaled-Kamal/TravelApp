import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => Homepage()),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F73B7),
              Color(0xFF002D72),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Travel',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 44,
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Image.asset(
                    'assets/travel_icon.png',
                    width: 36,
                    height: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Find Your Dream',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color(0xffE8E8E8),
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              'Destination With Us',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color(0xffE8E8E8),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
