// import 'package:geolocator/geolocator.dart' ;

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'cache/locale_storage.dart';

class LocationHelper {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<LocationData> determinePosition() async {
    bool serviceEnabled;
    PermissionStatus? permission;
    Location location = Location();
    // Test if location services are enabled.
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      await location.requestService();

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == PermissionStatus.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await location.getLocation();
  }

  static double getDistance({required String lat2, required String lon2}) {
    double distance = Geolocator.distanceBetween(
          double.parse(KStorage.i.getLocation?.latitude.toString() ?? '0'),
          double.parse(KStorage.i.getLocation?.longitude.toString() ?? '0'),
          double.parse(lat2),
          double.parse(lon2),
        ) /
        1000;
    return distance;
  }
}
