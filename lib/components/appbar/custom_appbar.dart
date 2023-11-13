import 'package:flutter/material.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  final Size preferredSize;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: Text(
        title,
        style: AppStyle.s18_w600_hffffff.copyWith(fontSize: 24.0),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: AppColor.hFFFFFF,),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
