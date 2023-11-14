class UserModel {
  String? uID;
  String? email;
  String? name;

  UserModel({this.uID, this.email, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uID: json['uID'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uID': uID,
      'email': email,
      'name': name,
    };
  }
}
