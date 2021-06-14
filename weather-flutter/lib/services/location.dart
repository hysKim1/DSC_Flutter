import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longtitude;
  double altitude;

  Future<void> getCurrentLoc() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position); //lat, long
      latitude = position.latitude;
      longtitude = position.longitude;
      altitude = position.altitude;
    } catch (e) {
      print(e); //debugging
    }
  }
}
