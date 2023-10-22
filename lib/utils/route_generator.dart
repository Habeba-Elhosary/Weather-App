import 'package:get/get.dart';
import 'package:weather_app/view/forecast_screen/forecast_screen.dart';
import 'package:weather_app/view/home_screens/offline_home_screen/offline_home_screen.dart';
import 'package:weather_app/view/search_screen/search_screen.dart';
import '../view/home_screens/home_screen/home_screen.dart';
import '../view/home_screens/online_home_screen/online_home_screen.dart';
import '../view/search_screen/search_details_screen.dart';
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
        name: '/home_screens/home_screen/home_screen',
        page: () => const HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/home_screens/online_home_screen/online_home_screen',
        page: () => const OnlineHomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/home_screens/offline_home_screen/offline_home_screen',
        page: () => const OfflineHomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/forecast_screen/forecast_screen',
        page: () => const ForecastScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/search_screen/search_screen',
        page: () => const SearchScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: '/search_screen/search_details_screen',
        page: () => const SearchDetailsScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
