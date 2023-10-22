import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/api_constants.dart';
import '../model/weather_model.dart';

class SearchScreenController extends GetxController {
  RxList<WeatherModel> weatherSearch = <WeatherModel>[].obs;
  RxString searchText = ''.obs;
  final RxBool cityNotFound = false.obs;

  void fetchCityResults(String cityName) async {
    try {
      final response = await http.get(Uri.parse('$baseURL/find?q=$cityName&appid=$apiKey&units=metric'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> cityList = data['list'];
        weatherSearch.clear();

        for (final cityData in cityList) {
          final weather = WeatherModel.fromJson(cityData);
          weatherSearch.add(weather);
        }
        cityNotFound.value = false;
      }

      else {
        weatherSearch.clear();
        cityNotFound.value = true;
      }

    } catch (e) {
      print("Error: $e");
      weatherSearch.clear();
      cityNotFound.value = true;
    }
  }
}
