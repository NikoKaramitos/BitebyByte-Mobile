// ignore_for_file: prefer_const_constructors

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
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();

  void setUser() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DashPage(firstName: firstName, lastName: lastName)));
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
          child: Container(
              height: 500,
              child: ListView(
                children: [
                  Container(
                    height: 10,
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
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password'),
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
                        onPressed: setUser,
                        child: Text("Register"),
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
