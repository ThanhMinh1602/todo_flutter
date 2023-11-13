// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_flutter/res/app_style.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    this.label,
    this.icon,
  }) : super(key: key);
  final String? label;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10.0),
        Text(
          label ?? '',
          style: AppStyle.s18_w600_prm,
        )
      ],
    );
  }
}
