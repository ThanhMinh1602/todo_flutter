import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? taskId; // Thêm trường taskId
  String? uID;
  String? title;
  String? subTitle;
  Timestamp? date;
  bool isCompleted;

  TaskModel({
    this.taskId, // Thêm trường taskId
    this.uID,
    this.title,
    this.subTitle,
    this.date,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['taskId'] as String?, // Thêm trường taskId
      uID: json['uID'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      date: json['date'],
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId, // Thêm trường taskId
      'uID': uID,
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'isCompleted': isCompleted,
    };
  }
}
