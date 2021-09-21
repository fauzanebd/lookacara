import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:look_acara/controllers/login_controller.dart';

class AccountPage extends StatelessWidget {
  LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        if (loginController.isLoggedIn.value) {
          return Center(child: Text(loginController.user!.user.username));
        } else {
          return Center(child: Text("Not Logged in"));
        }
      }),
    );
  }
}
