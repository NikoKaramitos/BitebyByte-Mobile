import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  MyTitle(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pressStart2p(
          textStyle: TextStyle(
        fontSize: size,
        color: color,
        shadows: const [
          Shadow(
            color: Colors.black26, // Choose the color of the shadow
            blurRadius: 2.0, // Adjust the blur radius for the shadow effect
            offset: Offset(-6.0,
                3.0), // Set the horizontal and vertical offset for the shadow
          ),
        ],
      )),
    );
  }
}
