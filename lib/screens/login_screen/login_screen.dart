import 'package:flutter/material.dart';
import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/buttons/outline_row_button.dart';
import 'package:todo_flutter/components/textfields/custom_email_input.dart';
import 'package:todo_flutter/components/textfields/custom_password_input.dart';
import 'package:todo_flutter/gen/assets.gen.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/screens/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              key: _formfield,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Image.asset(Assets.images.loginlogo.path),
                  const Text(
                    "Login",
                    style: AppStyle.s35_w600_h000000,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  CustomEmailInput(
                      controller: _emailController,
                      hintText: 'Enter your email'),
                  const SizedBox(height: 16.0),
                  CustomPasswordInput(
                      controller: _passwordController,
                      hintText: 'Enter your password'),
                  const SizedBox(height: 36.6),
                  CustomButton(
                      label: 'Login',
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print('success');
                          _emailController.clear();
                          _passwordController.clear();
                        }
                      }),
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
