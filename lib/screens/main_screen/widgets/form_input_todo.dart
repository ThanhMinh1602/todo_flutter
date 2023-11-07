// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_flutter/components/textfields/custom_email_input.dart';
import 'package:todo_flutter/firebase/task_service.dart';
import 'package:todo_flutter/res/app_style.dart';

class FormInputTodo extends StatelessWidget {
  const FormInputTodo({
    Key? key,
    required this.titleController,
    required this.subTitleController,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController subTitleController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding:
          const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 20.0),
      title: Center(
        child: Text(
          'Add your todo',
          style: AppStyle.taskTitle.copyWith(fontSize: 20.0),
        ),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15.0),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            CustomEmailInput(
                hintText: 'Enter your todo title', controller: titleController),
            const SizedBox(height: 10.0),
            CustomEmailInput(
                hintText: 'Enter your todo sub title',
                controller: subTitleController)
          ],
        ),
      ),
      actionsPadding:
          const EdgeInsets.symmetric(horizontal: 15.0).copyWith(bottom: 10.0),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Exits',
            style: AppStyle.taskTitle,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Add',
            style: AppStyle.taskTitle,
          ),
        ),
      ],
    );
  }
}
