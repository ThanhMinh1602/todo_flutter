import 'package:flutter/material.dart';

class AppBoxShadow {
  static List<BoxShadow> appBoxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3), // Màu của bóng đổ
      spreadRadius: 0.5, // Độ rộng của bóng đổ
      blurRadius: 1, // Độ mờ của bóng đổ
      offset: const Offset(0, 1),
    ) // Độ dịch chuyển của bóng đổ (ngang, dọc)
  ];
}
