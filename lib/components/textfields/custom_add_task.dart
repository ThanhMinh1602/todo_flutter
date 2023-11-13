// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_color.dart';

import 'package:todo_flutter/res/app_style.dart';

class AddTaskCustom extends StatefulWidget {
  const AddTaskCustom({
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
  State<AddTaskCustom> createState() => _AddTaskCustomState();
}

class _AddTaskCustomState extends State<AddTaskCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppStyle.s18_w400_h000000,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyle.s18_w400_h8B8787,
      ),
    );
  }
}
