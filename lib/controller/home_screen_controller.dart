import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import '../service/api_service.dart';
import '../service/location_service.dart';

class HomeScreenController extends GetxController {

  final LocationService _locationService = LocationService();
  final WeatherService _weatherService = WeatherService();
  Rx<WeatherModel> weather = WeatherModel.empty().obs;

  RxString city = ''.obs;
  RxString? cityArea = ''.obs;

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() async {
    super.onInit();
    _getUserLocation().then((value) => fetchWeatherData());
  }


  Future<void> _getUserLocation() async {
    try {
      final position = await _locationService.getUserLocation();
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _isLoading.value = false;
      await fetchWeatherData();
      getUserAddress();
    } catch (e) {
      print("Error: $e");
      _isLoading.value = false;
    }
  }

  Future<void> fetchWeatherData() async {
    try {
      final weatherData = await _weatherService.fetchWeatherData(
        _latitude.value,
        _longitude.value,
      );
      weather.value = weatherData;
    } catch (e) {
      print("Error: $e");
      // Handle the error gracefully, show a message, etc.
    }
  }

  getUserAddress() async {
    List<Placemark> placeMark =
    await placemarkFromCoordinates(_latitude.value, _longitude.value);
    print(placeMark);
    Placemark place = placeMark[0];
    city.value = place.locality!;
    cityArea!.value = place.subLocality!;
  }

}
