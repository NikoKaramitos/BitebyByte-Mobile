import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/functions/changePassword.dart';
import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:flutter/material.dart';

class CodeInputs extends StatefulWidget {
  int code;
  String email;
  CodeInputs({super.key, required this.code, required this.email});

  @override
  State<CodeInputs> createState() => _CodeInputsState();
}

class _CodeInputsState extends State<CodeInputs> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  text: "Reset Password",
                  function: () => {
                        tryReset(
                          context: context,
                          email: widget.email,
                          password: passController.text,
                          confirm: confirmController.text,
                        )
                      })
            ],
          ),
        ),
      ],
    );
  }
}
