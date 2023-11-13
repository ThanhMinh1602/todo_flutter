// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo_flutter/components/dialogs/dialog.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/screens/edit_task_screen/edit_task_screen.dart';
import 'package:todo_flutter/screens/main_screen/widgets/todo_item.dart';
import 'package:todo_flutter/screens/main_screen/widgets/todo_item_completed.dart';
import 'package:todo_flutter/services/remote/task_service.dart';

class ListTodo extends StatefulWidget {
  ListTodo({
    Key? key,
    this.isEqualTo = false,
  }) : super(key: key);
  final Object isEqualTo;
  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          TaskService().getIncompleteTasksByUIDFromFirebase(widget.isEqualTo),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 18.0),
            itemBuilder: (context, index) {
              List<TaskModel> lists = snapshot.data!;
              lists.sort(
                (a, b) => b.date!.compareTo(a.date!),
              );
              DateTime dateTime = lists[index].date!.toDate();
              String formatedDate =
                  DateFormat('HH:mm dd/MM/yyyy').format(dateTime);
              return widget.isEqualTo == false
                  ? TodoItem(
                      todoTitle: lists[index].title,
                      todoSubTitle: lists[index].subTitle,
                      date: '$formatedDate',
                      onEditTask: () => onEditTask(lists, index),
                      onDeleteTask: () => onDeleteTask(lists, index),
                      onSetTaskComplete: () => onSetTaskComplete(lists, index),
                    )
                  : TodoItemCompleted(
                      todoTitle: lists[index].title,
                      todoSubTitle: lists[index].subTitle,
                      date: '$formatedDate',
                      onDeleteTask: () => onDeleteTask(lists, index),
                    );
            },
          );
        }
      },
    );
  }

  void onEditTask(lists, index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditTaskScreen(
          title: lists[index].title.toString(),
          detail: lists[index].subTitle.toString(),
          taskId: lists[index].taskId.toString()),
    ));
  }

  void onDeleteTask(lists, index) {
    showCustomDialog(context,
        title: 'Delete task',
        content: 'Are you sure you want to delete this task?',
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                TaskService().deleteTaskByUIDFromFirebase(
                  lists[index].taskId.toString(),
                );
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('OK'))
        ]);
  }

  void onSetTaskComplete(lists, index) {
    showCustomDialog(context,
        title: 'Completed?',
        content: 'Are you sure you have completed this task?',
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                TaskService().setTaskComplete(
                  lists[index].taskId.toString(),
                );
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('OK'))
        ]);
  }
}
