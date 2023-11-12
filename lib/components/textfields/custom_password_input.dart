// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_flutter/res/app_style.dart';

class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    Key? key,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool _isHiden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isHiden,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppStyle.s16_w500_h000000,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            _isHiden = !_isHiden;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              _isHiden ? Icons.visibility_off : Icons.visibility,
              size: 22.0,
            ),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyle.s16_w500_h8B8787,
        filled: true,
        fillColor: Colors.white,
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
