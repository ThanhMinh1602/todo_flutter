typedef FormFieldValidator<T> = String Function(T value);

abstract class FieldValidator<T> {
  final String errorText;

  FieldValidator(this.errorText);
  bool isValid(T value);
  String? call(T value) {
    return isValid(value) ? null : errorText;
  }
}

abstract class TextFieldValidator extends FieldValidator<String> {
  TextFieldValidator(String errorText) : super(errorText);

  bool get ignoreEmptyValues => true;
}

class test extends FieldValidator {
  test(super.errorText);

  @override
  bool isValid(value) {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
