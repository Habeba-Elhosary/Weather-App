import 'dart:convert';
import 'package:weather_app/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  Future<WeatherModel> fetchWeatherData (double lat,double lon) async {
    final weatherURL = "$baseURL/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely&lang=en";
    final response = await http.get(Uri.parse(weatherURL));
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Error fetching weather data');
    }
  }
}
///********************************************************************************************
// class ForecastService {
//   Future<Forecast> fetchWeatherData (double lat , double lon) async {
//     final forecastURL = "$baseURL/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely&lang=en&cnt=7";
//     final response = await http.get(Uri.parse(forecastURL));
//     print(response.body);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return Forecast.fromJson(data);
//     } else {
//       throw Exception('Error fetching weather data');
//     }
//     // var jsonString = jsonDecode(response.body);
//     // weatherData = WeatherData(
//     //   totalWeatherItems: TotalWeatherItems.fromJson(jsonString),
//     //   forecast: Forecast.fromJson(jsonString)
//     // );
//     // return weatherData!;
//   }
// }
//
