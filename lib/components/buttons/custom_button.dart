// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_boxshadow.dart';
import 'package:todo_flutter/res/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    this.backgroundColor = AppColor.primaryColor,
    this.labelColor = AppColor.hFFFFFF,
    this.label,
  }) : super(key: key);
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? labelColor;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: AppBoxShadow.appBoxshadow,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          label ?? '',
          style: TextStyle(
              fontSize: 23.0, fontWeight: FontWeight.w500, color: labelColor),
        ),
      ),
    );
  }
}
