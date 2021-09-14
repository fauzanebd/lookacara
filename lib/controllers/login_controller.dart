import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  void changeObscureState() {
    isObscure.value = !isObscure.value;
  }
}
