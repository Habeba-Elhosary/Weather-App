import 'package:get/get.dart';
import 'package:weather_app/view/home_screens/offline_home_screen.dart';
import '../view/home_screens/home_screen.dart';
import '../view/home_screens/online_home_screen.dart';
import '../view/splash_screen/splash_screen.dart';
import 'bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: '/splash_screen/splash_screen',
        page: () => const SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/home_screens/home_screen',
        page: () => const HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/home_screens/online_home_screen',
        page: () => const OnlineHomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/home_screens/offline_home_screen',
        page: () => const OfflineHomeScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
