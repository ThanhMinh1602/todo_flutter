import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_flutter/firebase/auth_service.dart';
import 'package:todo_flutter/models/task_model.dart';

class TaskService {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  User? user = FirebaseAuth.instance.currentUser;

//add task
  Future<void> addTaskToFirebase({String? title, String? subTitle}) async {
    final CollectionReference tasksColection =
        FirebaseFirestore.instance.collection('tasks');
    Timestamp timestamp = Timestamp.now();
    TaskModel taskModel = TaskModel(
      uID: user!.uid,
      title: title,
      subTitle: subTitle,
      date: timestamp,
    );
    try {
      DocumentReference documentReference =
          await tasksColection.add(taskModel.toJson());
      // Lấy taskId tương ứng
      String taskId = documentReference.id;

      // Cập nhật lại taskModel với taskId
      taskModel = TaskModel(
        taskId: taskId,
        uID: user!.uid,
        title: title,
        subTitle: subTitle,
        date: timestamp,
      );

      // Cập nhật lại tài liệu trong Firestore với taskId
      await tasksColection.doc(taskId).set(taskModel.toJson());

      print("Task đã được thêm vào Firestore. Task ID: $taskId");
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

  //delete task
  Future<void> deleteTaskByUIDFromFirebase(String docsID) async {
    FirebaseFirestore.instance
        .collection('tasks')
        .doc(docsID)
        .delete()
        .then((value) {
      print('Đã xóa tài liệu thành công');
    }).catchError((error) {
      print('Lỗi khi xóa tài liệu: $error');
    });
  }
}
