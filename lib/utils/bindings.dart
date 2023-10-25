import 'package:get/get.dart';
import '../controller/global_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
  }
}
