import 'package:flutter/material.dart';

class RegisterFields extends StatefulWidget {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  RegisterFields(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.usernameController,
      required this.passwordController,
      required this.emailController,
      required this.confirmPasswordController});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool confirmVis = true;
  bool passwordVis = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.firstNameController,
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'First Name'),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          controller: widget.lastNameController,
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Last Name'),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          controller: widget.usernameController,
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Username'),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          controller: widget.emailController,
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Email'),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          controller: widget.passwordController,
          obscureText: passwordVis,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(),
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(passwordVis ? Icons.visibility : Icons.visibility_off),
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
          controller: widget.confirmPasswordController,
          obscureText: confirmVis,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(),
            labelText: 'Confirm Password',
            suffixIcon: IconButton(
              icon: Icon(confirmVis ? Icons.visibility : Icons.visibility_off),
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
      ],
    );
  }
}
