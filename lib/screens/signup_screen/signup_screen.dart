import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/components/buttons/circle_button_back.dart';
import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/buttons/outline_row_button.dart';
import 'package:todo_flutter/components/dialogs/dialog.dart';
import 'package:todo_flutter/components/textfields/custom_email_input.dart';
import 'package:todo_flutter/components/textfields/custom_password_input.dart';
import 'package:todo_flutter/firebase/auth_service.dart';
import 'package:todo_flutter/gen/assets.gen.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/screens/main_screen/main_screen.dart';
import 'package:todo_flutter/utils/validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  //method
  void _signup() async {
    String email = _emailController.text.trim();
    String password = _confirmPassController.text.trim();

    if (_formKey.currentState!.validate()) {
      User? user = await _firebaseAuthService.sigupWithEmail(
          email: email, password: password);

      if (user != null) {
        print("ThanhMinh: ${user.email}");
        if (user.email != null) {
          // User has an email, you can proceed with the success dialog
          return showCustomDialog(context,
              title: 'Success🎊🎉✌️',
              content:
                  'Congratulations, you have successfully registered your account!',
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                    (route) => false,
                  ),
                  child: const Text('OK'),
                ),
              ]);
        }
      } else {
        // Handle the case where user is null (registration failed)
        return showCustomDialog(context,
            title: 'Failed',
            content:
                'Email already exists in the system, please use a different email account.',
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.hD6D7EF,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: MediaQuery.of(context).padding.top),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Image.asset(Assets.images.registerIcon.path),
                    const Text(
                      "Register",
                      style: AppStyle.s35_w600_h000000,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    CustomEmailInput(
                        validator: (value) => Validator.checkEmail(value),
                        controller: _emailController,
                        hintText: 'Enter your email'),
                    const SizedBox(height: 16.0),
                    CustomPasswordInput(
                        validator: (value) => Validator.checkPassword(value),
                        controller: _passwordController,
                        hintText: 'Enter your password'),
                    const SizedBox(height: 16.0),
                    CustomPasswordInput(
                      validator: (value) => Validator.checkCconfirmPassword(
                          value, _passwordController.text.trim()),
                      controller: _confirmPassController,
                      hintText: 'Confirm password',
                    ),
                    const SizedBox(height: 36.6),
                    CustomButton(
                      label: 'Register',
                      onTap: _signup,
                      backgroundColor: AppColor.primaryColor,
                      labelColor: AppColor.hFFFFFF,
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
                          'or connect with',
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
            Positioned(
              top: MediaQuery.of(context).padding.top + 16.0,
              left: 20.0,
              child: CircleButtonBack(
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
