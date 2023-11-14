// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/buttons/outline_row_button.dart';
import 'package:todo_flutter/components/dialogs/dialog.dart';
import 'package:todo_flutter/components/textfields/custom_email_input.dart';
import 'package:todo_flutter/components/textfields/custom_password_input.dart';
import 'package:todo_flutter/gen/assets.gen.dart';
import 'package:todo_flutter/models/user_model.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/screens/main_screen/main_screen.dart';
import 'package:todo_flutter/screens/signup_screen/signup_screen.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';
import 'package:todo_flutter/services/remote/auth_service.dart';
import 'package:todo_flutter/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    this.emali,
  }) : super(key: key);
  final String? emali;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final _formfeeds = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = widget.emali ?? '';
  }

  //method
  void _signin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (_formfeeds.currentState!.validate()) {
      User? user = await _firebaseAuthService.loginWithEmail(
          email: email, password: password);
      if (user != null) {
        SharedPrefs.token = user.uid;
        // print("Thanh Minh token login: ${user.uid}");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (route) => false,
        );
      } else {
        showCustomDialog(context,
            title: 'Faild',
            content: 'Incorrect username or password.',
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.hD6D7EF,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
          top: MediaQuery.of(context).padding.top,
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: _formfeeds,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Image.asset(Assets.images.loginlogo.path),
                  Text(
                    "Login",
                    style: AppStyle.s35_w600_h000000,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  CustomEmailInput(
                      controller: _emailController,
                      validator: (value) => Validator.checkIsEmpty(value),
                      hintText: 'Enter your email'),
                  const SizedBox(height: 16.0),
                  CustomPasswordInput(
                      controller: _passwordController,
                      validator: (value) => Validator.checkIsEmpty(value),
                      hintText: 'Enter your password'),
                  const SizedBox(height: 36.6),
                  CustomButton(
                    label: 'Login',
                    onTap: _signin,
                  ),
                  const SizedBox(height: 16.0),
                  CustomButton(
                    label: 'Register',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ));
                    },
                    backgroundColor: AppColor.hFFFFFF,
                    labelColor: AppColor.primaryColor,
                  ),
                  const SizedBox(height: 16.0),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                            color: AppColor.h8B8787,
                            thickness: 1.2,
                            endIndent: 7.0),
                      ),
                      Text(
                        'or',
                        style: AppStyle.s16_w500_h000000,
                      ),
                      Expanded(
                        child: Divider(
                            color: AppColor.h8B8787,
                            thickness: 1.2,
                            indent: 7.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  OutlineRowButton(
                    label: 'Login with Facebook',
                    labelColor: AppColor.h000000,
                    imageIcon: Assets.images.iconFb.path,
                  ),
                  const SizedBox(height: 16.0),
                  OutlineRowButton(
                    label: 'Login with Google',
                    labelColor: AppColor.h000000,
                    imageIcon: Assets.images.iconGg.path,
                  ),
                  const SizedBox(height: 26.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
