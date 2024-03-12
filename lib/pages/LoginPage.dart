import 'package:bitebybyte_mobile/components/fullTitle.dart';
import 'package:bitebybyte_mobile/components/loginFields.dart';
import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/components/secondaryButton.dart';
import 'package:bitebybyte_mobile/functions/login.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String error = "";

  @override
  Widget build(BuildContext context) {
    double fs = 48;
    return Scaffold(
      backgroundColor: creamsicle[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                  ),
                  FullTitle(fs: fs),
                  Container(
                    height: 20,
                  ),
                  LoginFields(
                    userController: userController,
                    passController: passController,
                  ),
                  SecondaryButton(
                      text: "Forgot Password",
                      function: () => goForgot(context)),
                  PrimaryButton(
                    text: "Login",
                    function: () => setUser(
                        login: userController.text,
                        password: passController.text,
                        context: context),
                  ),
                  Container(
                    height: 150,
                  ),
                  SecondaryButton(
                      text: "New? Sign Up!",
                      function: () => goRegister(context))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
