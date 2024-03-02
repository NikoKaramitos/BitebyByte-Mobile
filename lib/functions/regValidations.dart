
    // Field Validation here:
    // user check for existing username
    // email validation (something@something.something)
    // password validation (≥ 8 char, 1 num, 1 special char, 1 cap)
    // password = confirmation password

    bool userVal (String username) {
      return true;
    }

    bool emailVal (String email) {
      RegExp emailChecker = RegExp(r'\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}\b');
      print(emailChecker.hasMatch(email));
      return emailChecker.hasMatch(email);
    }

    bool passwordVal(String password) {
      // 8 char
      // 1 capital
      // 1 number
      // 1 special char
      return true;
    }

    bool passwordConfirm(String password, String confirmPass) {
      return password == confirmPass;
    }