import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final firstName = widget.user['firstName'];
    final lastName = widget.user['lastName'];
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        backgroundColor: creamsicle,
        title: Text(
          "$firstName $lastName's Profile",
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
