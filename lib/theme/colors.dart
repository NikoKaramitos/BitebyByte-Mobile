import 'package:flutter/material.dart';

const orange = const Color(0xffFF720B);
const beige = const Color(0xffECE4B7);
const mint = const Color(0xff7DCFB6);
const green = const Color(0xff33CA7F);

const MaterialColor blue = MaterialColor(_bluePrimaryValue, <int, Color>{
  50: Color(0xFFE5E9F9),
  100: Color(0xFFBEC9F0),
  200: Color(0xFF93A5E6),
  300: Color(0xFF6781DB),
  400: Color(0xFF4766D4),
  500: Color(_bluePrimaryValue),
  600: Color(0xFF2244C7),
  700: Color(0xFF1C3BC0),
  800: Color(0xFF1733B9),
  900: Color(0xFF0D23AD),
});
const int _bluePrimaryValue = 0xFF264BCC;

const MaterialColor blueAccent = MaterialColor(_blueAccentValue, <int, Color>{
  100: Color(0xFFDBDFFF),
  200: Color(_blueAccentValue),
  400: Color(0xFF7584FF),
  700: Color(0xFF5C6DFF),
});
const int _blueAccentValue = 0xFFA8B2FF;

const MaterialColor creamsicle =
    MaterialColor(_creamsiclePrimaryValue, <int, Color>{
  50: Color(0xFFFFF9F4),
  100: Color(0xFFFEF1E3),
  200: Color(0xFFFDE8D1),
  300: Color(0xFFFCDFBE),
  400: Color(0xFFFCD8B0),
  500: Color(_creamsiclePrimaryValue),
  600: Color(0xFFFACC9A),
  700: Color(0xFFFAC690),
  800: Color(0xFFF9C086),
  900: Color(0xFFF8B575),
});
const int _creamsiclePrimaryValue = 0xFFFBD1A2;

const MaterialColor creamsicleAccent =
    MaterialColor(_creamsicleAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_creamsicleAccentValue),
  400: Color(0xFFFFFFFF),
  700: Color(0xFFFFFAF6),
});
const int _creamsicleAccentValue = 0xFFFFFFFF;
