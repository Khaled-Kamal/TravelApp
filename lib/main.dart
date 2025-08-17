import 'package:flutter/material.dart';
import 'package:travel/Page/splash.dart';

void main() {
  runApp(const Travel());
}

class Travel extends StatelessWidget {
  const Travel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home : splash(),

    );
  }
}
