import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_flutter/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //đăng nhập
  Future loginWithEmail({String? email, String? password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return userCredential.user;
    } catch (e) {
      print('ThanhMinh: $e');
    }
    return null;
  }

  //đăng ký
  Future sigupWithEmail({String? email, String? password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      return userCredential.user;
    } catch (e) {
      print('ThanhMinh: $e');
    }
    return null;
  }

  // Lấy thông tin người dùng đã đăng nhập từ Firebase và chuyển đổi thành UserModel
  Future<UserModel?> getCurrentUser() async {
    User? user = _auth.currentUser;
    return _userFromFirebaseUser(user);
  }

  // Chuyển đổi từ User của Firebase thành UserModel
  UserModel? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return UserModel(
        uID: user.uid,
        email: user.email,
        name: user.displayName,
      );
    }
    return null;
  }
}
