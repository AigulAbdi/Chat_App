import 'package:chat_app/app/constants/colors/app_colors.dart';
import 'package:chat_app/app/modules/login/views/login_view.dart';
import 'package:chat_app/app/modules/signup/views/signup_view.dart';
import 'package:chat_app/widgets/animated_text_kit_widget.dart';
import 'package:chat_app/widgets/register_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedTextKitWidget(),
            const SizedBox(
              height: 100,
            ),
            RegisterWidget(
              onTap: () => Get.to(LoginView()),
              horizontal: 140,
              vertical: 14,
              title: 'LOGIN',
              containerColor: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterWidget(
              onTap: () => Get.to(SignupView()),
              horizontal: 130,
              vertical: 14,
              title: 'SIGN UP',
              containerColor: AppColors.deepBlue,
            ),
          ],
        ),
      ),
    );
  }
}
