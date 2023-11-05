// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_color.dart';

class OutlineRowButton extends StatelessWidget {
  const OutlineRowButton({
    Key? key,
    this.onTap,
    this.backgroundColor = AppColor.hFFFFFF,
    this.labelColor = AppColor.primaryColor,
    this.label,
    this.imageIcon,
  }) : super(key: key);
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? labelColor;
  final String? label;
  final String? imageIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.2, color: AppColor.h8B8787)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageIcon ?? '', width: 30.0),
            const SizedBox(width: 10.0),
            Text(
              label ?? '',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: labelColor),
            ),
          ],
        ),
      ),
    );
  }
}
