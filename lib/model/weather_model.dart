// {
// "coord": {},
// "weather": [],
// "base": "stations",
// "main": {},
// "visibility": 10000,
// "wind": {},
// "clouds": {},
// "dt": 1697455652,
// "sys": {},
// "timezone": 10800,
// "id": 360923,
// "name": "Al Khārijah",
// "cod": 200
// }
class WeatherModel {
  Coord coord = Coord(lon: 0.0, lat: 0.0);
  List<Weather> weather = [];
  String base = "";
  Main main = Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0);
  int visibility = 0;
  Wind wind = Wind(speed: 0.0, deg: 0);
  Clouds clouds = Clouds(all: 0);
  int dt = 0;
  Sys sys = Sys(country: "", sunrise: 0 ,sunset: 0);
  int timezone = 0;
  int id = 0;
  String name = "";
  int cod = 0;

  WeatherModel({required this.coord, required this.weather, required this.base, required this.main, required this.visibility, required this.wind, required this.clouds, required this.dt, required this.sys, required this.timezone, required this.id, required this.name, required this.cod});

  WeatherModel.empty();

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord'] ?? {});
    final weatherJson = json['weather'] as List<dynamic>?; // Check if 'weather' key is present
    weather = weatherJson != null ? List<Weather>.from(weatherJson.map((x) => Weather.fromJson(x))) : [];
    base = json['base'] ?? '';
    main = Main.fromJson(json['main'] ?? {});
    visibility = json['visibility'] ?? 0;
    wind = Wind.fromJson(json['wind'] ?? {});
    clouds = Clouds.fromJson(json['clouds'] ?? {});
    dt = json['dt'];
    sys = Sys.fromJson(json['sys'] ?? {});
    timezone = json['timezone'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    cod = json['cod'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coord'] = coord.toJson();
    data['weather'] = weather.map((e) => e.toJson()).toList();
    data['base'] = base;
    data['main'] = main.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind.toJson();
    data['clouds'] = clouds.toJson();
    data['dt'] = dt;
    data['sys'] = sys.toJson();
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
///****************************************************************************************
// "coord": {
// "lon": 30.2356,
// "lat": 25.0235
// },
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
// "weather": [
// {
// "id": 800,
// "main": "Clear",
// "description": "clear sky",
// "icon": "01d"
// }
// ],
class Weather {
  late final int id;
  late final String main;
  late final String description;
  late final String icon;
  String path = '';

  Weather({required this.id, required this.main, required this.description, required this.icon, required this.path});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
    path = "assets/weather/$icon.png";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;

    return data;
  }
}
///****************************************************************************************
// "main": {
// "temp": 30.31,
// "feels_like": 28.44,
// "temp_min": 30.31,
// "temp_max": 30.31,
// "pressure": 1014,
// "humidity": 18,
// "sea_level": 1014,
// "grand_level": 990
// },
class Main {
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;

  Main({required this.temp, required this.feelsLike, required this.tempMin, required this.tempMax, required this.pressure, required this.humidity,});

  Main.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble() ?? 0.0;
    feelsLike = (json['feels_like'] as num?)?.toDouble() ?? 0.0;
    tempMin = (json['temp_min'] as num?)?.toDouble() ?? 0.0;
    tempMax = (json['temp_max'] as num?)?.toDouble() ?? 0.0;
    pressure = (json['pressure'] as int?) ?? 0;
    humidity = (json['humidity'] as int?) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
///****************************************************************************************
// "wind": {
// "speed": 5.51,
// "deg": 3,
// "gust": 5.78
// },
class Wind {
  late final double speed;
  late final int deg;

  Wind({required this.speed, required this.deg,});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}
///****************************************************************************************
// "clouds": {
// "all": 0
// },
class Clouds {
  late final int all;

  Clouds({required this.all,});

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
// "sys": {
// "country": "EG",
// "sunrise": 1697428638,
// "sunset": 1697470309
// },
class Sys {
  late final String country;
  late final int sunrise;
  late final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json["country"] ?? 0, // Provide a default value if necessary,
      sunrise: json["sunrise"] ?? 0,
      sunset: json["sunset"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
///****************************************************************************************




