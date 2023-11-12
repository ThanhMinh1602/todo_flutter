import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/screens/main_screen/widgets/todo_item.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';
import 'package:todo_flutter/services/remote/task_service.dart';

class ListTodo extends StatefulWidget {
  ListTodo({
    super.key,
  });

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  TaskService taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: taskService.getTasksByUIDFromFirebase(),
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
              return TodoItem(
                todoTitle: lists[index].title,
                todoSubTitle: lists[index].subTitle,
                date: '$formatedDate',
                onDeleteTask: () {
                  TaskService().deleteTaskByUIDFromFirebase(
                      lists[index].taskId.toString());
                  setState(() {});
                },
              );
            },
          );
        }
      },
    );
  }
}
