import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
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
