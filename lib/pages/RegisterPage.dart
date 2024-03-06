// ignore_for_file: prefer_const_constructors

import 'package:bitebybyte_mobile/components/logo.dart';
import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/functions/register.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
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
  String email = "";
  String error = "";
  bool confirmVis = true;
  bool passwordVis = true;

  void registerUser() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String username = usernameController.text;
    email = emailController.text;
    String password = passwordController.text;
    String confirmPass = confirmPasswordController.text;

    String id = "";
    error = "";

    // Field Validation Checks
    if (firstName.isEmpty) {
      setState(() {
        error = "First name field is empty";
      });
    } else if (lastName.isEmpty) {
      setState(() {
        error = "Last name field is empty";
      });
    } else if (!userVal(username)) {
      setState(() {
        error = "Invalid username";
      });
    } else if (!emailVal(email)) {
      setState(() {
        error = "Invalid email: \nUse a format like example@mail.com";
      });
    } else if (!passwordVal(password)) {
      setState(() {
        error =
            "Password must contain: \n8 characters \n1 number \n1 special character \n1 capital letter";
      });
    } else if (!passwordConfirm(password, confirmPass)) {
      setState(() {
        error = "Password has to match";
      });
    }
    if (error != "") {
      displayError(error, context);
      return;
    }

    sendRegistration(firstName, lastName, username, email, password)
        .then((value) {
      // what do i write here?
      if (value['error'] != "") {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(error),
          ),
        );
        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashPage(user: value),
          ));
    }).catchError((error) {
      this.error = error;
    });
  }

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
              MyLogo(height: 180),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'First Name'),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Last Name'),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Username'),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordVis,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        passwordVis ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordVis = !passwordVis;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: confirmVis,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        confirmVis ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        confirmVis = !confirmVis;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 12,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
              ),
            ],
          )),
        ),
      ),
    );
  }
}


/// HI CARLOS  BE BACK ON SOON Teehee
