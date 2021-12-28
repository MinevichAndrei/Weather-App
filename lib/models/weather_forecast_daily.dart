class WeatherForecast {
  WeatherForecast({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });
  late final double lat;
  late final double lon;
  late final String timezone;
  late final int timezoneOffset;
  late final Current current;
  late final List<Daily> daily;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'].toDouble;
    lon = json['lon'].toDouble;
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = Current.fromJson(json['current']);
    daily = List.from(json['daily']).map((e) => Daily.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current.toJson();
    _data['daily'] = daily.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });
  late final int dt;
  late final int sunrise;
  late final int sunset;
  late final double temp;
  late final double feelsLike;
  late final int pressure;
  late final int humidity;
  late final double dewPoint;
  late final int uvi;
  late final int clouds;
  late final int visibility;
  late final double windSpeed;
  late final int windDeg;
  late final double windGust;
  late final List<Weather> weather;

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'].toDouble;
    feelsLike = json['feels_like'].toDouble;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'].toDouble;
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'].toDouble;
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'].toDouble;
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
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

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });
  late final int dt;
  late final int sunrise;
  late final int sunset;
  late final int moonrise;
  late final int moonset;
  late final double? moonPhase;
  late final Temp temp;
  late final FeelsLike feelsLike;
  late final int pressure;
  late final int humidity;
  late final double dewPoint;
  late final double windSpeed;
  late final int windDeg;
  late final double windGust;
  late final List<Weather> weather;
  late final int clouds;
  late final double? pop;
  late final double? uvi;

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'].toDouble;
    temp = Temp.fromJson(json['temp']);
    feelsLike = FeelsLike.fromJson(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'].toDouble;
    windSpeed = json['wind_speed'].toDouble;
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'].toDouble;
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = json['clouds'];
    pop = json['pop'].toDouble;
    uvi = json['uvi'].toDouble;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['temp'] = temp.toJson();
    _data['feels_like'] = feelsLike.toJson();
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds;
    _data['pop'] = pop;
    _data['uvi'] = uvi;
    return _data;
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final double day;
  late final double min;
  late final double max;
  late final double night;
  late final double eve;
  late final double morn;

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble;
    min = json['min'].toDouble;
    max = json['max'].toDouble;
    night = json['night'].toDouble;
    eve = json['eve'].toDouble;
    morn = json['morn'].toDouble;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['min'] = min;
    _data['max'] = max;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final double day;
  late final double night;
  late final double eve;
  late final double morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble;
    night = json['night'].toDouble;
    eve = json['eve'].toDouble;
    morn = json['morn'].toDouble;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}
