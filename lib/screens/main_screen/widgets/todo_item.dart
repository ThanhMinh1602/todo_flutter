// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:todo_flutter/res/app_boxshadow.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    this.todoTitle,
    this.todoSubTitle,
    this.date,
  }) : super(key: key);
  final String? todoTitle;
  final String? todoSubTitle;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.hFFFFFF,
        boxShadow: AppBoxShadow.appBoxshadow,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoTitle ?? '---',
                  style: AppStyle.taskTitle,
                ),
                const SizedBox(height: 5.0),
                Text(
                  todoSubTitle ?? '---',
                  style: AppStyle.taskSubTitle,
                ),
                Text(
                  date ?? '---',
                  style: AppStyle.taskSubTitle,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.mode_edit_outlined,
                size: 20.0, color: AppColor.hD6D7EF),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child:
                Icon(Icons.delete_outline, size: 20.0, color: AppColor.hD6D7EF),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.check_circle_outlined,
                size: 20.0, color: AppColor.hD6D7EF),
          ),
        ],
      ),
    );
  }
}