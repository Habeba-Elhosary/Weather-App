class ForecastModel {
  List<ListElement> list = [];

  ForecastModel({required this.list});

  ForecastModel.empty();

  ForecastModel.fromJson(Map<String, dynamic> json) {
    list = (json["list"] as List<dynamic>).map((e) => ListElement.fromJson(e as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['list'] = list.map((e) => e.toJson()).toList();
    return data;
  }
}
///****************************************************************************************
class ListElement {
  late final int dt;
  late final MainClass main;
  late final String dtTxt;

  ListElement(
      {required this.dt,
      required this.main,
      required this.dtTxt
      });

  ListElement.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? '';
    main = MainClass.fromJson(json['main'] ?? {});

    // Format dtTxt property as "dd-HH" like in FiveDayData class
    final dateTimeParts = DateTime.parse(json['dt_txt']).toLocal();
    final day = dateTimeParts.day.toString().padLeft(2, '0');
    final hour = dateTimeParts.hour.toString().padLeft(2, '0');
    dtTxt = '$day/$hour';
    // dtTxt = json['dt_txt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    data['main'] = main.toJson();
    data['dt_txt'] = dtTxt;
    return data;
  }
}
///****************************************************************************************
class MainClass {
  late final double temp;
  late final double tempMin;
  late final double tempMax;
  late final int humidity;

  MainClass({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  MainClass.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble() ?? 0.0;
    tempMin = (json['temp_min'] as num?)?.toDouble() ?? 0.0;
    tempMax = (json['temp_max'] as num?)?.toDouble() ?? 0.0;
    humidity = (json['humidity'] as int?) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['humidity'] = humidity;
    return data;
  }
}
