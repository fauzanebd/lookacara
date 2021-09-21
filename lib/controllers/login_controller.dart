import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:look_acara/controllers/login_and_register_controller.dart';
import 'package:look_acara/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:look_acara/views/login_page.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  // SharedPreferences? sharedPreferences;
  User? user;
  var localData;
  LoginAndRegisterController loginAndRegisterController =
      Get.put(LoginAndRegisterController());

  void changeObscureState() {
    isObscure.value = !isObscure.value;
  }

  @override
  void onInit() {
    this.localData = GetStorage();
    checkLoginState();
    super.onInit();
  }

  void checkLoginState() {
    if (localData.read('loginInfo') == null) {
      isLoggedIn.value = false;
      loginAndRegisterController.changePageIndex(0);
      print("user is logged in? ${isLoggedIn.value}");
    } else {
      isLoggedIn.value = true;
      this.user = User.fromJson(jsonDecode(localData.read('loginInfo')));
      loginAndRegisterController.changePageIndex(2);
      print("user is logged in? ${isLoggedIn.value}");
    }
  }

  void login(String email, String password) async {
    print("trying to login with email: $email, and password: $password");
    isLoading.value = true;

    Map loginInfo = {'email': '$email', 'password': '$password'};
    var loginBodyRequest = json.encode(loginInfo);

    var response = await http.post(
        Uri.parse('https://api-lokacara.herokuapp.com/api/v1/login'),
        headers: {"Content-Type": "application/json"},
        body: loginBodyRequest);

    print(response.body);

    if (response.statusCode == 200) {
      print("user data found. redirecting to account page...");
      this.user = User.fromJson(jsonDecode(response.body));
      isLoading.value = false;
      isLoggedIn.value = true;
      loginAndRegisterController.changePageIndex(2);
      localData.write('loginInfo', response.body);
    } else {
      Fluttertoast.showToast(
        msg: jsonDecode(response.body)["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
      print("login failed");
      isLoading.value = false;
      loginAndRegisterController.changePageIndex(0);
      throw Exception('Failed to login: ${jsonDecode(response.body)}');
    }
  }

  void logout() async {
    EmailController emailController = Get.find<EmailController>();
    emailController.text = "";
    PasswordController passwordController = Get.find<PasswordController>();
    passwordController.text = "";
    localData.remove('loginInfo');
    loginAndRegisterController.changePageIndex(0);
    isLoggedIn.value = false;
  }
}
