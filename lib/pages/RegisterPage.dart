// ignore_for_file: prefer_const_constructors

import 'package:bitebybyte_mobile/functions/login.dart';
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
      return;
    }
    if (lastName.isEmpty) {
      setState(() {
        error = "Last name field is empty";
      });
      return;
    }
    if (!userVal(username)) {
      setState(() {
        error = "Invalid username";
      });
      return;
    }
    if (!emailVal(email)) {
      setState(() {
        error = "Invalid email: \nUse a format like example@mail.com";
      });
      return;
    }
    if (!passwordVal(password)) {
      setState(() {
        error =
            "Password must contain: \n8 characters \n1 number \n1 special character \n1 capital letter";
      });
      return;
    }
    if (!passwordConfirm(password, confirmPass)) {
      setState(() {
        error = "Password has to match";
      });
      return;
    }

    sendRegistration(firstName, lastName, username, email, password)
        .then((value) {
      // what do i write here?
      if (value['error'] != "") {
        setState(() {
          error = value['error'];
        });
        return;
      }
      setState(() {
        firstName = value['firstName'];
        lastName = value['lastName'];
        id = value['id'];
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashPage(
              firstName: firstName,
              lastName: lastName,
              id: id,
            ),
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
        automaticallyImplyLeading: false,
        backgroundColor: creamsicle,
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
              child: ListView(
            children: [
              Container(
                height: 150,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage())),
                      child: Text("Back")),
                  TextButton(
                    onPressed: registerUser,
                    child: Text("Register"),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
