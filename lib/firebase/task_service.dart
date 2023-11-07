import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/firebase/auth_service.dart';
import 'package:todo_flutter/models/task_model.dart';

class TaskService {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  User? user = FirebaseAuth.instance.currentUser;
//add task
  Future<void> addTaskToFirebase({String? title, String? subTitle}) async {
    final CollectionReference tasksColection =
        FirebaseFirestore.instance.collection('tasks');
        DateTime dateTime = DateTime.now();
  //  int timestamp = tasksColection!.date.millisecondsSinceEpoch ?? 0; // Chuyển đổi DateTime thành số nguyên
    String formatedDate = DateFormat('HH:mm dd/MM/yyyy').format(dateTime);
    TaskModel taskModel = TaskModel()
      ..uID = user!.uid
      ..title = title
      ..subTitle = subTitle
      ..date = formatedDate;
    try {
      await tasksColection.add(taskModel.toJson());
      print("Task đã được thêm vào Firestore.");
    } catch (e) {
      print("Lỗi khi thêm task vào Firestore: $e");
    }
  }

  // get task by uID
  Future<List<TaskModel>> getTasksByUIDFromFirebase() async {
    CollectionReference tasksCollection =
        FirebaseFirestore.instance.collection('tasks');
    QuerySnapshot querySnapshot =
        await tasksCollection.where('uID', isEqualTo: user!.uid).get();
    List<TaskModel> tasks = [];
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      TaskModel task = TaskModel.fromJson(data);
      tasks.add(task);
    }
    return tasks;
  }
}
