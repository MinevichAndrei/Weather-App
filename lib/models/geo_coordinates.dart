class GeoCoordinates {
  GeoCoordinates({
    required this.coord,
  });
  late final Coord coord;

  GeoCoordinates.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coord'] = coord.toJson();
    return _data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'].toDouble();
    lat = json['lat'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lon'] = lon;
    _data['lat'] = lat;
    return _data;
  }
}
