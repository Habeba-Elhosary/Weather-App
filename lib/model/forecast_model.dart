class ForecastModel {
  String cod = "";
  int message = 0;
  int cnt = 0;
  List<ListElement> list = [];
  City city = City(
    name: "",
    coord: Coord(lon: 0.0, lat: 0.0),
  );

  ForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  ForecastModel.empty();

  ForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'] ?? 0;
    message = json['message'] ?? 0;
    cnt = json['cnt'] ?? 0;
    list = (json["list"] as List<dynamic>)
        .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
        .toList();
    city = City.fromJson(json['city'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city'] = city.toJson();
    data['list'] = list.map((e) => e.toJson()).toList();
    data['message'] = message;
    data['cnt'] = cnt;
    data['cod'] = cod;
    return data;
  }
}

///****************************************************************************************

class City {
  late final String name;
  late final Coord coord;

  City({
    required this.name,
    required this.coord,
  });

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coord = Coord.fromJson(json['coord'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['coord'] = coord.toJson();
    return data;
  }
}

///****************************************************************************************

class Coord {
  late final double lon;
  late final double lat;

  Coord({required this.lon, required this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon'] as num?)?.toDouble() ?? 0.0;
    lat = (json['lat'] as num?)?.toDouble() ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

///****************************************************************************************

class ListElement {
  late final int dt;
  late final MainClass main;
  late final Clouds clouds;
  // late final DateTime dtTxt;

  ListElement(
      {required this.dt,
      required this.main,
      required this.clouds,
      // required this.dtTxt
      });

  ListElement.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? '';
    main = MainClass.fromJson(json['main'] ?? {});
    clouds = Clouds.fromJson(json['clouds'] ?? {});
    // dtTxt = json['dtTxt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    data['main'] = main.toJson();
    data['clouds'] = clouds.toJson();
    // data['dtTxt'] = dtTxt;
    return data;
  }
}

///****************************************************************************************

class Clouds {
  late final int all;

  Clouds({
    required this.all,
  });

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

///****************************************************************************************

class MainClass {
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int humidity;

  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  MainClass.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble() ?? 0.0;
    feelsLike = (json['feelsLike'] as num?)?.toDouble() ?? 0.0;
    tempMin = (json['tempMin'] as num?)?.toDouble() ?? 0.0;
    tempMax = (json['tempMax'] as num?)?.toDouble() ?? 0.0;
    humidity = (json['humidity'] as int?) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feelsLike'] = feelsLike;
    data['tempMin'] = tempMin;
    data['tempMax'] = tempMax;
    data['humidity'] = humidity;
    return data;
  }
}
