import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/controllers/login_controller.dart';
import 'package:look_acara/controllers/register_controller.dart';
import 'package:look_acara/views/account_page.dart';
import 'package:look_acara/views/login_page.dart';
import 'package:look_acara/views/register_page.dart';
// import 'package:look_acara/views/register_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginAndRegisterPage extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  LoginAndRegisterController loginAndRegisterController =
      Get.find<LoginAndRegisterController>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(376, 726),
    );
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Obx(
        () => IndexedStack(
          index: loginAndRegisterController.pageIndex.value,
          children: [
            LoginPage(),
            RegisterPage(),
            AccountPage(),
          ],
        ),
      ),
    );
  }
}
