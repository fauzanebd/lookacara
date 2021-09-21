import 'dart:convert';

import 'package:get/get.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/models/user.dart';

import 'package:http/http.dart' as http;
import 'package:look_acara/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  User? user;

  LoginAndRegisterController loginAndRegisterController =
      Get.put(LoginAndRegisterController());

  void changeObscureState() {
    isObscure.value = !isObscure.value;
  }

  SharedPreferences? sharedPreferences;

  @override
  void onInit() {
    checkLoginState();
    super.onInit();
  }

  checkLoginState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString("data") == null) {
      isLoggedIn.value = false;
    } else {
      isLoggedIn.value = true;
      loginAndRegisterController.changePageIndex(2);
    }
  }

  void login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse('https://api-lokacara.herokuapp.com/api/v1/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      user = User.fromJson(jsonDecode(response.body));
      isLoading.value = false;
      isLoggedIn.value = true;
      sharedPreferences.setString("data", user!.data);
      loginAndRegisterController.changePageIndex(2);
    } else {
      throw Exception('Failed to login: ${jsonDecode(response.body)}');
    }
  }
}
