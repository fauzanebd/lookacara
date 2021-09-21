import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/controllers/login_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccountPage extends StatelessWidget {
  LoginController loginController = Get.find<LoginController>();
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
      mobile: Center(
        child: Column(
          children: [
            Container(height: 50.w),
            Obx(() {
              if (loginController.isLoggedIn.value) {
                return Center(child: Text(loginController.user!.user.username));
              } else {
                return Center(child: Text("Not Logged in"));
              }
            }),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                ),
                Container(
                  height: 44.w,
                  width: 328.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    border: Border.all(color: Color(0xFF0f84DE)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        loginController.logout();
                        print(
                            "changingPageIndex: from ${loginAndRegisterController.pageIndex.value}");
                        loginAndRegisterController.changePageIndex(0);
                        print(
                            "to ${loginAndRegisterController.pageIndex.value}");
                      },
                      child: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F84DE),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
