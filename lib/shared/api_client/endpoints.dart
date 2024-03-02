import 'package:bus_iraq2/shared/cache/locale_storage.dart';

String? role = KStorage.i.getRole??'client';
bool isClient = KStorage.i.getRole=='client';

abstract class KEndPoints {
  static String baseUrl = 'https://www.bus-iraq.com/api/v1/client/';

  static String login = '${baseUrl}login';
  static String getSeats = '${baseUrl}direct-bookings/seats/7';
  static String getLocations = '${baseUrl}booking-locations';
  static String getCountryCode = '${baseUrl}countries';
  static String getBanners = '${baseUrl}banners';
  static String directSearch = '${baseUrl}direct-bookings/search';
  static String bookDirectTrip = '${baseUrl}direct-bookings/book';
}
