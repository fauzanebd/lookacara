import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/controllers/login_controller.dart';
import 'package:look_acara/controllers/register_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class RegisterEmailController extends TextEditingController {}

class RegisterPasswordConfirmationController extends TextEditingController {}

class RegisterPasswordController extends TextEditingController {}

class RegisterUsernameController extends TextEditingController {}

class RegisterPage extends StatelessWidget {
  RegisterEmailController registerEmailController =
      Get.put(RegisterEmailController());
  RegisterPasswordController registerPasswordController =
      Get.put(RegisterPasswordController());
  RegisterPasswordConfirmationController
      registerPasswordConfirmationController =
      Get.put(RegisterPasswordConfirmationController());
  RegisterUsernameController registerUsernameController =
      Get.put(RegisterUsernameController());
  RegisterController registerController = Get.find<RegisterController>();
  LoginAndRegisterController loginAndRegisterController =
      Get.find<LoginAndRegisterController>();
  LoginController loginController = Get.find<LoginController>();

  var confirmPass;

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
        () {
          if (!loginController.isLoading.value) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 1000.w,
                        height: 71.w,
                        alignment: Alignment.center,
                      ),
                      Container(
                        width: 154,
                        height: 32,
                        child: SvgPicture.asset("assets/icons/logo.svg"),
                      ),
                      Container(
                        width: 1000.w,
                        height: 52.w,
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(height: 29.w, width: 24.w),
                            Text(
                              "Register",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 24.sp,
                                color: Color(0xFF5D5F61),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1000.w, height: 24.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(height: 20.w, width: 24.w),
                            Text(
                              "Nama",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                color: Color(0xFF5D5F61),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1000.w, height: 4.w),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                          ),
                          Container(
                            width: 328.w,
                            // height: 40.w,
                            child: TextField(
                              controller: registerUsernameController,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0A0A0A),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                hintText: "Deny Caknan",
                                contentPadding: EdgeInsets.only(
                                    top: 10.w, bottom: 10.w, left: 12.w),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                          ),
                        ],
                      ),
                      Container(width: 1000.w, height: 16.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(height: 20.w, width: 24.w),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                color: Color(0xFF5D5F61),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1000.w, height: 4.w),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                          ),
                          Container(
                            width: 328.w,
                            // height: 40.w,
                            child: TextField(
                              controller: registerEmailController,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0A0A0A),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                hintText: "example@mail.com",
                                contentPadding: EdgeInsets.only(
                                    top: 10.w, bottom: 10.w, left: 12.w),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                          ),
                        ],
                      ),
                      Container(width: 1000.w, height: 16.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(height: 20.w, width: 24.w),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                color: Color(0xFF5D5F61),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1000.w, height: 4.w),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                          ),
                          Container(
                            width: 328.w,
                            // height: 40.w,
                            child: Obx(() {
                              return TextFormField(
                                controller: registerPasswordController,
                                validator: (String? value) {
                                  confirmPass = value;
                                  if (value!.isEmpty) {
                                    return "Please Enter new Password";
                                  } else if (value.length < 8) {
                                    return "Password must be at lease 8 characters long";
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0A0A0A),
                                ),
                                obscureText:
                                    registerController.isObscurePassword.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  hintText: "*************",
                                  suffixIcon: IconButton(
                                    icon: Obx(() {
                                      if (registerController
                                          .isObscurePassword.value) {
                                        return Icon(Icons.visibility);
                                      } else {
                                        return Icon(Icons.visibility_off);
                                      }
                                    }),
                                    onPressed: () {
                                      registerController
                                          .changeObscurePasswordState();
                                    },
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      top: 10.w, bottom: 10.w, left: 12.w),
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                          ),
                        ],
                      ),
                      Container(width: 1000.w, height: 24.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(height: 20.w, width: 24.w),
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                color: Color(0xFF5D5F61),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1000.w, height: 4.w),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                          ),
                          Container(
                            width: 328.w,
                            // height: 40.w,
                            child: Obx(() {
                              return TextFormField(
                                controller:
                                    registerPasswordConfirmationController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please confirm your password";
                                  } else if (value != confirmPass) {
                                    return "Password must be same as above";
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0A0A0A),
                                ),
                                obscureText: registerController
                                    .isObscureConfirmPassword.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  hintText: "*************",
                                  suffixIcon: IconButton(
                                    icon: Obx(() {
                                      if (registerController
                                          .isObscureConfirmPassword.value) {
                                        return Icon(Icons.visibility);
                                      } else {
                                        return Icon(Icons.visibility_off);
                                      }
                                    }),
                                    onPressed: () {
                                      registerController
                                          .changeObscureConfirmPasswordState();
                                    },
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      top: 10.w, bottom: 10.w, left: 12.w),
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                          ),
                        ],
                      ),
                      Container(width: 1000.w, height: 24.w),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                          ),
                          Container(
                            height: 44.w,
                            width: 328.w,
                            decoration: BoxDecoration(
                              color: Color(0xFF0F84DE),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    registerController.register(
                                      registerUsernameController.text,
                                      registerEmailController.text,
                                      registerPasswordController.text,
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFF1F1F1),
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
                      Container(width: 1000.w, height: 28.w),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 24.w)),
                          Container(
                            width: 328.w,
                            height: 1.w,
                            color: Color(0xFFD8DCE0),
                          ),
                          Padding(padding: EdgeInsets.only(left: 24.w)),
                        ],
                      ),
                      Container(width: 1000.w, height: 16.w),
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
                                  print(
                                      "changingPageIndex: from ${loginAndRegisterController.pageIndex.value}");
                                  loginAndRegisterController.changePageIndex(0);
                                  print(
                                      "to ${loginAndRegisterController.pageIndex.value}");
                                },
                                child: Center(
                                  child: Text(
                                    "Back to Login",
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
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
