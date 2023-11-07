import 'package:flutter/material.dart';
import 'package:todo_flutter/firebase/task_service.dart';
import 'package:todo_flutter/screens/main_screen/widgets/todo_item.dart';

class ListTodo extends StatelessWidget {
  ListTodo({
    super.key,
  });
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
              return TodoItem(
                todoTitle: snapshot.data![index].title,
                todoSubTitle: snapshot.data![index].subTitle,
                date: '${snapshot.data![index].date}',
              );
            },
          );
        }
      },
    );
  }
}
