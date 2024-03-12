import 'package:bitebybyte_mobile/components/logo.dart';
import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/components/registerFields.dart';
import 'package:bitebybyte_mobile/functions/register.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        backgroundColor: creamsicle[300],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
              child: ListView(
            children: [
              const MyLogo(height: 180),
              RegisterFields(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  usernameController: usernameController,
                  passwordController: passwordController,
                  emailController: emailController,
                  confirmPasswordController: confirmPasswordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: "Sign Up",
                    function: () => registerUser(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPass: confirmPasswordController.text,
                      context: context,
                    ),
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
