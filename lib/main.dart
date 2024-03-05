import 'package:flutter/material.dart';
import 'package:bitebybyte_mobile/pages/HomePage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'pressStart2P',
            colorScheme: ColorScheme.fromSeed(
              seedColor: blue,
            )),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
