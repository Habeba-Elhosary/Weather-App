import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';

class LocationService {
  Future<Position> getUserLocation() async {

    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      showLocationServiceSnackBar();
      throw Exception("Location service is not enabled");
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      Get.dialog(
        AlertDialog(
          title: const Text('Location Permission is Required'),
          content:
              const Text('Please enable location permission to use the app.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
                _openAppSettings(); // Open app settings
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
      throw Exception("Location permission is denied forever");
    }
    else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Get.dialog(
          AlertDialog(
            title: const Text('Location Permission is Required'),
            content:
                const Text('Please enable location permission to use the app.'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                  _openAppSettings(); // Open app settings
                },
                child: const Text('Open Settings'),
              ),
            ],
          ),
        );
      }
    }

    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
  ///********************************************************************************************
  void _openAppSettings() async {
    await Geolocator.openAppSettings();
  }
  ///********************************************************************************************
  showLocationServiceSnackBar() {
    Get.snackbar(
      "Location Service",
      "Location service is not enabled",
      snackPosition: SnackPosition.TOP,
      colorText: MyColors.white,
    );
  }
}
