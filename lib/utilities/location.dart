import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  late LocationPermission permission;

  Future<void> getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true,
            desiredAccuracy: LocationAccuracy.lowest,
            timeLimit: null);
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        throw "Something goes wrong: $e";
      }
    }
  }
}
