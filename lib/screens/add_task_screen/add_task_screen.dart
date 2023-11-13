import 'package:flutter/material.dart';
import 'package:todo_flutter/components/appbar/custom_appbar.dart';
import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/textfields/custom_add_task.dart';
import 'package:todo_flutter/screens/main_screen/main_screen.dart';
import 'package:todo_flutter/services/remote/task_service.dart';
import 'package:todo_flutter/utils/validator.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
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
              controller: _detailController,
              validator: (value) => Validator.checkIsEmpty(value),
            ),
            const SizedBox(height: 20.0),
            Hero(
              tag: 'add_task_hero',
              child: CustomButton(
                label: 'ADD',
                onTap: () {
                  if (_globalKey.currentState!.validate()) {
                    TaskService().addTaskToFirebase(
                      title: _titleController.text.trim(),
                      subTitle: _detailController.text.trim(),
                    );
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
