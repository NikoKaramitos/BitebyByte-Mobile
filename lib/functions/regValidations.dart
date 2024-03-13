bool userVal(String username) {
  return username.length > 1;
}

bool emailVal(String email) {
  RegExp emailChecker =
      RegExp(r'\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}\b');
  print("is valid email: ${emailChecker.hasMatch(email)}");
  return emailChecker.hasMatch(email);
}

bool passwordVal(String password) {
  // 8 char
  // 1 capital
  // 1 number
  // 1 special char
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regex.hasMatch(password);
}

bool passwordConfirm(String password, String confirmPass) {
  return password == confirmPass;
}
