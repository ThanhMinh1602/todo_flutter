class Validator {
  Validator._();
  static String? checkIsEmpty(value) {
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
  }

  static String? checkEmail(value) {
    bool emailIsValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$')
            .hasMatch(value!);
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    if (!emailIsValid) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? checkPassword(value) {
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    if (value.toString().length < 8) {
      return 'The password must be more than 8 characters!';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
        !RegExp(r'[0-9]').hasMatch(value)) {
      return 'The password must contain at least one letter and one digit!';
    }
    return null;
  }

  static String? checkCconfirmPassword(value, password) {
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    if (value != password) {
      return 'Password confirmation is incorrect!';
    }
    return null;
  }
}
