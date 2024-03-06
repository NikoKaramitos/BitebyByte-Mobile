import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  TextEditingController userController;
  TextEditingController passController;
  LoginFields(
      {super.key, required this.userController, required this.passController});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    var userController = widget.userController;
    var passController = widget.passController;
    return Column(
      children: [
        TextFormField(
          controller: userController,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 5, right: 8, left: 8),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Username'),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          controller: passController,
          obscureText: passwordVisible,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 5, right: 8, left: 8),
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              labelText: 'Password',
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
      ],
    );
  }
}
