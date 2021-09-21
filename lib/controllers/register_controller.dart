import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/controllers/login_controller.dart';

class RegisterController extends GetxController {
  var isObscurePassword = true.obs;
  void changeObscurePasswordState() {
    isObscurePassword.value = !isObscurePassword.value;
  }

  LoginAndRegisterController loginAndRegisterController =
      Get.find<LoginAndRegisterController>();
  LoginController loginController = Get.find<LoginController>();
  var isObscureConfirmPassword = true.obs;
  void changeObscureConfirmPasswordState() {
    isObscureConfirmPassword.value = !isObscureConfirmPassword.value;
  }

  void register(String username, String email, String password) async {
    print("trying to register with email: $email, and password: $password");
    loginController.isLoading.value = true;
    Map registerInfo = {
      'username': '$username',
      'email': '$email',
      'password': '$password'
    };
    var registerBodyRequest = json.encode(registerInfo);
    print("getting response ...");
    var response = await http.post(
        Uri.parse(
            'https://api-lokacara.herokuapp.com/api/v1/register-customer'),
        headers: {"Content-Type": "application/json"},
        body: registerBodyRequest);
    print(response.body);

    if (response.statusCode == 200) {
      print("Register success... attempt to autologin...");
      loginController.login(
        jsonDecode(response.body)["email"],
        jsonDecode(response.body)["password"],
      );
      // Get.putAsync<SharedPreferences>(() async {
      //   var sharedPreferences = await SharedPreferences.getInstance();
      //   await sharedPreferences.setString("data", user!.data);
      //   return sharedPreferences;
      // }, tag: 'tagsAreEverywhere', permanent: true);
    } else {
      Fluttertoast.showToast(
        msg: jsonDecode(response.body)["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
      print("register failed");
      loginController.isLoading.value = false;
      loginAndRegisterController.changePageIndex(1);
    }
  }
}
