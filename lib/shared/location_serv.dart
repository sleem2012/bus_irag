import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'api_client/connection_ckecker.dart';
import 'error/failures.dart';


class KLocationService {
  static Future<Either<KFailure, LocationData>> call() async {
    bool connected = await ConnectivityCheck.call();

    if (connected) {
      bool serviceEnabled;
      PermissionStatus permission;
      LocationData? locationData;

      debugPrint('======== LocationService========= is connected ');
      Location location = Location();

      serviceEnabled = await location.serviceEnabled();
      debugPrint('======== LocationService========= serviceEnabled $serviceEnabled ');


      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return left(const KFailure.locationDisabled());
        }
      }

      permission = await location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await location.requestPermission();
        if (permission == PermissionStatus.deniedForever) {
          return left(const KFailure.locationDeniedPermanently());
        }
      }

      locationData = await location.getLocation();




      debugPrint('======== LocationService ========= permission ${permission.name} ');
      try {
        locationData = await location.getLocation();
      } catch (e) {
        debugPrint('======== LocationService ========= getCurrentPosition ');
        // printMap(pos?.toJson());
      }
      return locationData != null ? right(locationData) : left(const KFailure.error("Couldn't get Location"));
    } else {
      return left(const KFailure.offline());
    }
  }
}
