import 'package:flutter/material.dart';
import 'package:todo_flutter/components/drawer/app_drawer.dart';
import 'package:todo_flutter/screens/add_task_screen/add_task_screen.dart';
import 'package:todo_flutter/services/remote/task_service.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/screens/main_screen/widgets/list_todo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TaskService taskService = TaskService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hD6D7EF,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'todo app'.toUpperCase(),
          style: AppStyle.s18_w600_hffffff.copyWith(fontSize: 24.0),
        ),
      ),
      endDrawer: const AppDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: [
          ListTodo(isEqualTo: false),
          ListTodo(isEqualTo: true),
        ],
      ),
      floatingActionButton: Hero(
        tag: 'add_task_hero',
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTaskScreen(),
          )),
          child: const CircleAvatar(
            radius: 35.0,
            backgroundColor: AppColor.primaryColor,
            child: Icon(
              Icons.add,
              color: AppColor.hFFFFFF,
              size: 25.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'All',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Completed',
            )
          ]),
    );
  }
}
