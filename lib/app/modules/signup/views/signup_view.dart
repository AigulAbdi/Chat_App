import 'dart:developer';

import 'package:chat_app/app/components/text_field.dart';
import 'package:chat_app/app/constants/colors/app_colors.dart';
import 'package:chat_app/app/constants/text_style/app_text_styles.dart';

import 'package:chat_app/app/modules/login/views/login_view.dart';
import 'package:chat_app/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  SignupController _controller = Get.put<SignupController>(SignupController());
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Sign up',
                            style: AppTextStyle.black40wbold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFieldWidget(
                        onChanged: (value) {
                          _controller.name.value = value;
                        },
                        icon: const Icon(Icons.account_circle),
                        labelText: 'User name'),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        onChanged: (value) {
                          _controller.email.value = value;
                        },
                        icon: const Icon(Icons.mail),
                        labelText: 'Email adress'),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        onChanged: (value) {
                          _controller.password.value = value;
                        },
                        icon: const Icon(Icons.lock),
                        labelText: 'Password'),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        onChanged: (value) {
                          _controller.password.value = value;
                        },
                        icon: const Icon(Icons.lock),
                        labelText: 'Confirm password'),
                    const SizedBox(
                      height: 30,
                    ),
                    RegisterWidget(
                        onTap: () {
                          if (_controller.name.value.isNotEmpty &&
                              _controller.email.value.isNotEmpty &&
                              _controller.password.value.isNotEmpty)
                            _controller.signUp();
                          log('sign up ==>${_controller.signUp()} ');

                          //  Get.to(() => const ChatView());
                          // FocusManager.instance.primaryFocus?.unfocus();
                        },
                        horizontal: 125,
                        vertical: 14,
                        title: 'Sign Up',
                        containerColor: AppColors.deepBlue),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: AppTextStyle.black15wnormal,
                        ),
                        InkWell(
                          onTap: () => Get.to(() => LoginView()),
                          child: const Text(
                            'Login',
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
      ),
    );
  }
}
