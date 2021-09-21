import 'package:get/get.dart';

class LoginAndRegisterController extends GetxController {
  var pageIndex = 0.obs;
  void changePageIndex(int value) {
    pageIndex.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    super.dispose();
  }
}
