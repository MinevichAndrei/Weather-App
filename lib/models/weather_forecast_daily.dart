class WeatherForecast {
  WeatherForecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
  late final String cod;
  late final double message;
  late final int cnt;
  late final List<WeatherList> list;
  late final City city;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'].toDouble();
    cnt = json['cnt'];
    list = List.from(json['list']).map((e) => WeatherList.fromJson(e)).toList();
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
    _data['message'] = message;
    _data['cnt'] = cnt;
    _data['list'] = list.map((e) => e.toJson()).toList();
    _data['city'] = city.toJson();
    return _data;
  }
}

class WeatherList {
  WeatherList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.snow,
    required this.sys,
    required this.dtTxt,
  });
  late final int dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;
  late final Snow snow;
  late final Sys sys;
  late final String dtTxt;

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    snow = Snow.fromJson(json['snow']);
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds.toJson();
    _data['wind'] = wind.toJson();
    _data['snow'] = snow.toJson();
    _data['sys'] = sys.toJson();
    _data['dt_txt'] = dtTxt;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });
  late final double temp;
  late final double tempMin;
  late final double tempMax;
  late final double? pressure;
  late final double seaLevel;
  late final double? grndLevel;
  late final int humidity;
  late final double? tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble();
    tempMin = json['temp_min'].toDouble();
    tempMax = json['temp_max'].toDouble();
    pressure = json['pressure'].toDouble();
    seaLevel = json['sea_level'].toDouble();
    grndLevel = json['grnd_level'].toDouble();
    humidity = json['humidity'];
    tempKf = json['temp_kf'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['sea_level'] = seaLevel;
    _data['grnd_level'] = grndLevel;
    _data['humidity'] = humidity;
    _data['temp_kf'] = tempKf;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });
  late final double speed;
  late final double? deg;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
    deg = json['deg'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    return _data;
  }
}

class Snow {
  Snow({
    required this.h3,
  });
  late final double h3;

  Snow.fromJson(Map<String, dynamic> json) {
    h3 = json['3h'].toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      '3h': h3,
    };
  }
}

class Sys {
  Sys({
    required this.pod,
  });
  late final String pod;

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pod'] = pod;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
  });
  late final int id;
  late final String name;
  late final Coord coord;
  late final String country;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['coord'] = coord.toJson();
    _data['country'] = country;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });
  late final double lat;
  late final double lon;

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'].toDouble();
    lon = json['lon'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    return _data;
  }
}
