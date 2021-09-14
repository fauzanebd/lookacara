import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isObscurePassword = true.obs;
  void changeObscurePasswordState() {
    isObscurePassword.value = !isObscurePassword.value;
  }

  var isObscureConfirmPassword = true.obs;
  void changeObscureConfirmPasswordState() {
    isObscureConfirmPassword.value = !isObscureConfirmPassword.value;
  }
}
