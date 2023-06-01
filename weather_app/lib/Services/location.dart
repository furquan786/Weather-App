import 'package:geolocator/geolocator.dart';

class Location {
  var longitude;
  var latitude;
  Future<void> getcurrentloaction() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
