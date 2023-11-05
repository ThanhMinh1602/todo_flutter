import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_boxshadow.dart';
import 'package:todo_flutter/res/app_color.dart';

class CircleButtonBack extends StatelessWidget {
  const CircleButtonBack({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.all(10.0),
        decoration: BoxDecoration(
            color: AppColor.hFFFFFF,
            shape: BoxShape.circle,
            boxShadow: AppBoxShadow.appBoxshadow),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
