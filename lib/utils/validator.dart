class Validator {
  Validator._();
  static String? checkEmail(value) {
    bool emailIsValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$')
            .hasMatch(value!);
    if (value.isEmpty || value == '') {
      return 'Cannot be empty';
    }
    if (!emailIsValid) {
      return 'Invalid email format';
    }
    return null;
  }
}
