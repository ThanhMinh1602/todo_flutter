// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_color.dart';

import 'package:todo_flutter/res/app_style.dart';

class CustomEmailInput extends StatefulWidget {
  const CustomEmailInput({
    Key? key,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.fillColor = AppColor.hFFFFFF,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  @override
  State<CustomEmailInput> createState() => _CustomEmailInputState();
}

class _CustomEmailInputState extends State<CustomEmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppStyle.s16_w500_h000000,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyle.s16_w500_h8B8787,
        filled: true,
        fillColor:widget.fillColor,
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
