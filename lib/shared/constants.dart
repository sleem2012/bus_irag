import 'cache/locale_storage.dart';

class Constant {
  static const String appLogo = 'assets/images/logo.png';
  static const String loginLogo = 'assets/images/login_logo.png';
  bool isClient = KStorage.i.getRole=='client';


}
