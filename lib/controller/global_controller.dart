import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import '../model/forecast_model.dart';
import '../service/api_service.dart';
import '../service/location_service.dart';

class GlobalController extends GetxController {

  final LocationService _locationService = LocationService();
  final WeatherService _weatherService = WeatherService();
  final ForecastService _forecastService = ForecastService();
  final SearchService _searchService = SearchService();

  Rx<WeatherModel> weather = WeatherModel.empty().obs;
  Rx<WeatherModel> weather2 = WeatherModel.empty().obs;
  Rx<ForecastModel> forecast = ForecastModel.empty().obs;

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
    _getUserLocation().then((value){
      fetchWeatherData();
      fetchForecastData();
    });
  }

  Future<void> _getUserLocation() async {
    try {
      final position = await _locationService.getUserLocation();
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _isLoading.value = false;
      await fetchWeatherData();
      await fetchForecastData();
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

  Future<void> fetchForecastData() async {
    try {
      final forecastData = await _forecastService.fetchForecastData(
        _latitude.value,
        _longitude.value,
      );
      forecast.value = forecastData;
    } catch (e) {
      print("Error: $e");
      // Handle the error gracefully, show a message, etc.
    }
  }

  Future<void> fetchSearchData(String value) async {
    try {
      final searchData = await _searchService.fetchSearchData(value);
      weather2.value = searchData;
    } catch (e) {
      print("Error: $e");
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
