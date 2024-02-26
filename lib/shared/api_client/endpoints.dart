import 'package:bus_iraq2/shared/cache/locale_storage.dart';

String role = KStorage.i.getRole;

abstract class KEndPoints {
  static String baseUrl = 'https://www.bus-iraq.com/api/v1/$role/';

  static String login = '${baseUrl}login';
  static String getSeats = '${baseUrl}direct-bookings/seats/7';
}
