import 'package:flutter/material.dart';
import 'package:todo_flutter/gen/assets.gen.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/screens/login_screen/login_screen.dart';
import 'package:todo_flutter/screens/main_screen/main_screen.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 2),
      () => checkLoginStatus(),
    );
  }

  Future<void> checkLoginStatus() async {
    await SharedPrefs.initialise();

    // Check if the user is already logged in
    if (SharedPrefs.isLogin) {
      // If logged in, navigate to MainScreen
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false,
      );
    } else {
      // If not logged in, navigate to LoginScreen
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hD6D7EF,
      body: Center(
        child: Image.asset(Assets.images.splash.path),
      ),
    );
  }
}
