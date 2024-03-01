// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/pages/RegisterPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  String firstName = "";
  String lastName = "";
  void setUser() {
    firstName = userController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DashPage(firstName: firstName, lastName: lastName)));
  }

  void goRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
        backgroundColor: creamsicle,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text(greeting, style: TextStyle(fontSize: 30)),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 5, right: 8, left: 8),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Username'),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 5, right: 8, left: 8),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 10),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: goRegister, child: Text("Register")),
                      TextButton(
                        onPressed: setUser,
                        child: Text("Login"),
                        statesController: MaterialStatesController(),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}