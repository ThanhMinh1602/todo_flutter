import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/utils/validator.dart';

class CustomEmailInput extends StatefulWidget {
  const CustomEmailInput({
    super.key,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
  });
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  State<CustomEmailInput> createState() => _CustomEmailInputState();
}

class _CustomEmailInputState extends State<CustomEmailInput> {
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: (value) => Validator.checkEmail(value),
      style: AppStyle.s16_w500_h000000,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyle.s16_w500_h8B8787,
        filled: true,
        fillColor: Colors.white, // Đặt màu nền trong suốt
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
