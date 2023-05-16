import 'package:chat_app/app/components/text_field.dart';
import 'package:chat_app/app/constants/colors/app_colors.dart';
import 'package:chat_app/app/constants/text_style/app_text_styles.dart';
import 'package:chat_app/app/modules/signup/views/signup_view.dart';
import 'package:chat_app/widgets/register_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Login',
                          style: AppTextStyle.black40wbold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextFieldWidget(
                      onChanged: (p0) {},
                      icon: const Icon(Icons.mail),
                      labelText: 'Email adress'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      onChanged: (p0) {},
                      icon: const Icon(Icons.lock),
                      labelText: ' Password'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.check_box,
                        color: AppColors.blue,
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        'Forgot Password?',
                        style: AppTextStyle.black15wnormal,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RegisterWidget(
                      horizontal: 135,
                      vertical: 14,
                      title: 'Login',
                      containerColor: AppColors.blue),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: AppTextStyle.black15wnormal,
                      ),
                      InkWell(
                        onTap: () => Get.to(() => SignupView()),
                        child: const Text(
                          'Sign Up',
                          style: AppTextStyle.blue15wbold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
