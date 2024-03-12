import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final double height;
  const MyLogo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/images/bear_blue.png',
      height: height,
    );
  }
}
