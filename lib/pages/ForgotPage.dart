// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/functions/changePassword.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});
  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController emailController = TextEditingController();
  int code = Random().nextInt(900000) + 100000;
  String error = "";
  MaterialColor color = Colors.red;

  void sendEmail(email) {
    if (!emailVal(email)) {
      setState(() {
        color = Colors.red;
        error = "*Enter a valid email";
      });
      return;
    } else {
      sendEmailRequest(email, code);
      setState(() {
        color = Colors.green;
        error = "Sent";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        backgroundColor: creamsicle[300],
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Send a password reset code",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error,
                  style: TextStyle(color: color),
                ),
              ),
              PrimaryButton(
                  text: "Send Email",
                  function: () => sendEmail(emailController.text)),
              TextButton(
                onPressed: () => {goReset(code, context, emailController.text)},
                child: const Text("Go to Reset"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
