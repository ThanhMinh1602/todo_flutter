// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_color.dart';

class AppStyle {
  static const TextStyle s35_w600_h000000 = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.w600,
    color: AppColor.h000000,
  );
  static const TextStyle s18_w600_hffffff = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColor.hFFFFFF,
  );
  static const TextStyle s16_w500_h8B8787 = TextStyle(
      color: AppColor.h8B8787, fontSize: 15, fontWeight: FontWeight.w500);
  static const TextStyle s16_w500_h000000 = TextStyle(
      color: AppColor.h000000, fontSize: 15, fontWeight: FontWeight.w500);
  static const TextStyle taskTitle = TextStyle(
      color: AppColor.primaryColor, fontSize: 13, fontWeight: FontWeight.w600);
  static const TextStyle taskSubTitle = TextStyle(
      color: AppColor.h000000, fontSize: 10, fontWeight: FontWeight.w400);
}
