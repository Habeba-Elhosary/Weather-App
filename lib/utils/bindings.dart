import 'package:get/get.dart';
import '../controller/home&forecast_screen_controller.dart';
import '../controller/search_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => SearchScreenController());
  }
}
