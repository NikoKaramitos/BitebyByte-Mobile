import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  String text;
  void Function()? function;
  SecondaryButton({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12, //decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
