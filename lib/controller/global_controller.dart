// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:weather_app/constants/color_constants.dart';
//
// class GlobalController extends GetxController {
//   final RxBool _isLoading = true.obs;
//   final RxDouble _latitude = 0.0.obs;
//   final RxDouble _longitude = 0.0.obs;
//
//   RxBool checkLoading() => _isLoading;
//   RxDouble getLatitude() => _latitude;
//   RxDouble getLongitude() => _longitude;
//
//   @override
//   void onInit() {
//     super.onInit();
//     checkLocationStatus();
//   }
//
//   checkLocationStatus() async {
//     bool isServiceEnabled;
//     LocationPermission? locationPermission;
//
//     isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       Get.snackbar(
//         "Location Service",
//         "Location service is not enabled",
//         snackPosition: SnackPosition.BOTTOM,
//         colorText:MyColors.white
//       );
//       return;
//     }
//
//     await Geolocator.requestPermission();
//     if (locationPermission == LocationPermission.deniedForever) {
//       Get.snackbar(
//         "Location Permission",
//         "Location permission is denied forever",
//         snackPosition: SnackPosition.BOTTOM,
//           colorText:MyColors.white
//
//       );
//       return;
//     } else if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         Get.snackbar(
//           "Location Permission",
//           "Location permission is denied",
//           snackPosition: SnackPosition.BOTTOM,
//             colorText:MyColors.white
//
//         );
//         return;
//       }
//     }
//
//     // Location service and permission are enabled ===> get the location
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then(
//           (value) => {
//         _latitude.value = value.latitude,
//         _longitude.value = value.longitude,
//         _isLoading.value = false,
//       },
//     );
//   }
// }
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/color_constants.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    super.onInit();
    checkLocationStatus();
  }

  checkLocationStatus() async {
    bool isServiceEnabled;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      showLocationServiceSnackbar();
    } else {
      await checkLocationPermission();
    }

    Geolocator.getPositionStream().listen(
      (position) async {
        isServiceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!isServiceEnabled) {
          showLocationServiceSnackbar();
        } else {
          await checkLocationPermission();
        }
      },
    );
  }

  checkLocationPermission() async {
    LocationPermission? locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Location Permission",
        "Location permission is denied forever",
        snackPosition: SnackPosition.BOTTOM,
        colorText: MyColors.white,
      );
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Get.snackbar(
          "Location Permission",
          "Location permission is denied",
          snackPosition: SnackPosition.BOTTOM,
          colorText: MyColors.white,
        );
      }
    } else {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then(
        (value) => {
          _latitude.value = value.latitude,
          _longitude.value = value.longitude,
          _isLoading.value = false,
        },
      );
    }
  }

  showLocationServiceSnackbar() {
    Get.snackbar(
      "Location Service",
      "Location service is not enabled",
      snackPosition: SnackPosition.BOTTOM,
      colorText: MyColors.white,
    );
  }
}
