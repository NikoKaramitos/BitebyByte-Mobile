import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  void Function()? function;
  PrimaryButton({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 12,
      ),
      onPressed: function,
      statesController: MaterialStatesController(),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
