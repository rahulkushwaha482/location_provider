import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static Future<String> getLocationFullAddress(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    String platformVersion =
        '${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].country}';
    return platformVersion;
  }

  static Future<String> getSubLocality(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    final subLocality = '${placemarks[0].subLocality}';

    return subLocality;
  }

  static Future<String> getLocality(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    final locality = '${placemarks[0].locality}';
    return locality;
  }

  static Future<String> getCountry(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    final locality = '${placemarks[0].country}';
    return locality;
  }

  static Future<String> getLatitudeFromAddress(String address) async {
    List<Location> locations = await locationFromAddress(address);
    String latLong = '${locations.first.latitude}';
    return latLong;
  }

  static Future<String> getLongitudeFromAddress(String address) async {
    List<Location> locations = await locationFromAddress(address);
    String latLong = '${locations.first.longitude}';
    return latLong;
  }
}
