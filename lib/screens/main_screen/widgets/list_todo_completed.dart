import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/main_screen/widgets/todo_item.dart';

class ListTodoCompleted extends StatelessWidget {
  const ListTodoCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 7.0).copyWith(top: 20.0),
      itemCount: 50,
      separatorBuilder: (context, index) => const SizedBox(height: 18.0),
      itemBuilder: (context, index) {
        return const TodoItem();
      },
    );
  }
}
