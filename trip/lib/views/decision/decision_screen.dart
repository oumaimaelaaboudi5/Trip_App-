// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trip/controller/auth_controller.dart';
import 'package:trip/views/login_screen.dart';
import 'package:trip/widgets/intro_widget.dart';

import '../../widgets/my_button.dart';

class DecisionScreen extends StatelessWidget {
  DecisionScreen({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            introWidget(),
            const SizedBox(
              height: 50,
            ),
            DecisionButton('assets/driver.png', 'Login As Driver', () {
              authController.isLoginAsDriver = true;
              Get.to(() => LoginScreen());
            }, Get.width * 0.8),
            const SizedBox(
              height: 20,
            ),
            DecisionButton('assets/customer.png', 'Login As User', () {
              authController.isLoginAsDriver = false;
              Get.to(() => LoginScreen());
            }, Get.width * 0.8),
          ],
        ),
      ),
    );
  }
}
