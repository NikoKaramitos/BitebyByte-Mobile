import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/functions/changePassword.dart';
import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/email.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPage extends StatefulWidget {
  int code;
  String email;
  ResetPage({super.key, required this.code, required this.email});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String error = "";
  MaterialColor color = Colors.red;
  bool correct = false;
  bool passwordVisible = true;
  bool confirmVisible = true;
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  void checkCorrect(int userCode) {
    if (userCode == widget.code) {
      setState(() {
        correct = true;
      });
    } else {
      displayError("Incorrect Code", context);
    }
  }

  void tryReset() {
    sendResetRequest(
      widget.email,
      passController.text,
      confirmController.text,
      context,
    ).then((value) {
      if (value['error'] != "") {
        displayError(error, context);
        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    }).catchError((error) {
      displayError(error, context);
    });
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !correct,
                child: Column(
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
                      height: 10,
                    ),
                    PrimaryButton(
                        function: () =>
                            {checkCorrect(int.parse(codeController.text))},
                        text: "Check Code"),
                  ],
                ),
              ),
              Visibility(
                visible: correct,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: passwordVisible,
                      controller: passController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(),
                          labelText: 'New Password',
                          suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              })),
                    ),
                    Container(
                      height: 10,
                    ),
                    TextFormField(
                      controller: confirmController,
                      obscureText: confirmVisible,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                              icon: Icon(confirmVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    confirmVisible = !confirmVisible;
                                  },
                                );
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        error,
                        style: TextStyle(color: color),
                      ),
                    ),
                    PrimaryButton(
                        text: "Reset Password", function: () => {tryReset()})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
