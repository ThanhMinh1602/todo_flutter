import 'package:firebase_auth/firebase_auth.dart';

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
}
