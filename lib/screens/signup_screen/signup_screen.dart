import 'package:flutter/material.dart';
import 'package:todo_flutter/components/buttons/circle_button_back.dart';
import 'package:todo_flutter/components/buttons/custom_button.dart';
import 'package:todo_flutter/components/buttons/outline_row_button.dart';
import 'package:todo_flutter/components/textfields/custom_email_input.dart';
import 'package:todo_flutter/components/textfields/custom_password_input.dart';
import 'package:todo_flutter/gen/assets.gen.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  const CustomEmailInput(hintText: 'Enter your email'),
                  const SizedBox(height: 16.0),
                  const CustomPasswordInput(hintText: 'Enter your password'),
                  const SizedBox(height: 16.0),
                  const CustomPasswordInput(
                    hintText: 'Confirm password',
                  ),
                  const SizedBox(height: 36.6),
                  CustomButton(
                    label: 'Register',
                    onTap: () {},
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
