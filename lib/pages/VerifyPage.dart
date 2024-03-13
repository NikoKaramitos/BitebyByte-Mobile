import 'dart:math';

import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/verifyAccount.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  dynamic user;

  int code;
  VerifyPage({super.key, required this.user, required this.code});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController codeController = TextEditingController();
  Future<void> checkCorrect(var inputCode) async {
    print(widget.code);
    inputCode = int.tryParse(inputCode);
    //int? code = int.tryParse(widget.user['TokenKey'].toString());
    if (inputCode != null && inputCode == widget.code) {
      await verify(widget.code);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashPage(user: widget.user),
          ));
    } else {
      print("Yike");
      displayError("Incorrect Code", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the code sent to your email",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: codeController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Code',
                ),
              ),
              Container(
                height: 20,
              ),
              PrimaryButton(
                  function: () => checkCorrect(codeController.text),
                  text: "Check Code"),
            ],
          ),
        ),
      ),
    );
  }
}
