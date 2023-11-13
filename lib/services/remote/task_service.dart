import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/services/remote/auth_service.dart';

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
      String taskId = documentReference.id;
      taskModel = TaskModel(
        taskId: taskId,
        uID: user!.uid,
        title: title,
        subTitle: subTitle,
        date: timestamp,
      );
      await tasksColection.doc(taskId).set(taskModel.toJson());
      print("Task đã được thêm vào Firestore. Task ID: $taskId");
    } catch (e) {
      print("Lỗi khi thêm task vào Firestore: $e");
    }
  }

  // get task by uID and completed
  Future<List<TaskModel>> getIncompleteTasksByUIDFromFirebase(
      Object? isEqualTo) async {
    CollectionReference tasksCollection =
        FirebaseFirestore.instance.collection('tasks');
    QuerySnapshot querySnapshot = await tasksCollection
        .where('uID', isEqualTo: user!.uid)
        .where('isCompleted', isEqualTo: isEqualTo)
        .get();
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

  // update task
  Future<void> updateTaskInFirebase({
    required String taskId,
    String? newTitle,
    String? newSubTitle,
  }) async {
    try {
      CollectionReference tasksCollection =
          FirebaseFirestore.instance.collection('tasks');
      Timestamp timestamp = Timestamp.now();
      Map<String, dynamic> updatedData = {
        'title': newTitle,
        'subTitle': newSubTitle,
        'date': timestamp,
      };
      await tasksCollection.doc(taskId).update(updatedData);

      print("Task đã được cập nhật trong Firestore. Task ID: $taskId");
    } catch (e) {
      print("Lỗi khi cập nhật task trong Firestore: $e");
    }
  }

  // set task as complete
  Future<void> setTaskComplete(String taskId) async {
    try {
      // Create a reference to the tasks collection
      CollectionReference tasksCollection =
          FirebaseFirestore.instance.collection('tasks');

      // Update the document with the new data (set 'complete' to true)
      await tasksCollection.doc(taskId).update({'isCompleted': true});

      print(
          "Task đã được đánh dấu là hoàn thành trong Firestore. Task ID: $taskId");
    } catch (e) {
      print("Lỗi khi đánh dấu task là hoàn thành trong Firestore: $e");
    }
  }
}
