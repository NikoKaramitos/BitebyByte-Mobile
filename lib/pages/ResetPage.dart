import 'package:bitebybyte_mobile/components/codeInput.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  int code;
  String email;
  ResetPage({super.key, required this.code, required this.email});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        backgroundColor: creamsicle[300],
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: CodeInputs(code: widget.code, email: widget.email),
        ),
      ),
    );
  }
}
