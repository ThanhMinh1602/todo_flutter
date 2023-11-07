class TaskModel {
  String? uID;
  String? title;
  String? subTitle;
  DateTime? date; // Thêm trường thời gian (date) kiểu DateTime
  bool isCompleted;

  TaskModel({
    this.uID,
    this.title,
    this.subTitle,
    this.date,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      uID: json['uID'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'title': title,
      'subTitle': subTitle,
      'date': date != null ? date!.toIso8601String() : null,
      'isCompleted': isCompleted,
    };
  }
}
