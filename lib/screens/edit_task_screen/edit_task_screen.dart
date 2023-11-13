// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_flutter/components/appbar/custom_appbar.dart';
import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/textfields/custom_add_task.dart';
import 'package:todo_flutter/screens/main_screen/main_screen.dart';
import 'package:todo_flutter/services/remote/task_service.dart';
import 'package:todo_flutter/utils/validator.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    Key? key,
    required this.title,
    required this.detail,
    required this.taskId,
  }) : super(key: key);
  final String title;
  final String detail;
  final String taskId;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.title;
    _subTitleController.text = widget.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Task'),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            AddTaskCustom(
              hintText: 'Title',
              controller: _titleController,
              validator: (value) => Validator.checkIsEmpty(value),
            ),
            const SizedBox(height: 20.0),
            AddTaskCustom(
              hintText: 'Detail',
              controller: _subTitleController,
              validator: (value) => Validator.checkIsEmpty(value),
            ),
            const SizedBox(height: 20.0),
            Hero(
              tag: 'add_task_hero',
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Update',
                      onTap: () {
                        if (_globalKey.currentState!.validate()) {
                          TaskService().updateTaskInFirebase(
                              taskId: widget.taskId,
                              newTitle: _titleController.text.trim(),
                              newSubTitle: _subTitleController.text.trim());
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                              (route) => false);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomButton(
                        label: 'Cancel',
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
