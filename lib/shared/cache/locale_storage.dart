import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

import '../../data/model/user_model.dart';



class KStorageKeys {
  static const String themeMode = 'themeMode';
  static const String locale = 'locale';
  static const String lang = 'language';

  static const String token = 'token';
  static const String fcmToken = 'fcmToken';
  static const String userModel = 'userModel';
  static const String isSplashSeen = 'isSplashSeen';
  static const String settings = 'settings';
  static const String location = 'location';
  static const String role = 'role';



}

class KStorage {
  KStorage();
  final GetStorage _storage = GetStorage();
  static KStorage i = _kStorage;

  static KStorage get _kStorage {
    if (GetIt.instance.isRegistered<KStorage>()) {
      return GetIt.instance.get<KStorage>();
    } else {
      GetIt.instance.registerLazySingleton(() => KStorage());
      return GetIt.instance.get<KStorage>();
    }
  }

  get erase async => await _storage.erase();


  setToken(String? token) => _storage.write(KStorageKeys.token, token);
  get delToken => _storage.remove(KStorageKeys.token);
  String? get getToken => _storage.read(KStorageKeys.token);



  setLang(String lang) => _storage.write(KStorageKeys.lang, lang);
  String? get getLang => _storage.read(KStorageKeys.lang);


  setIsSplashSeen() => _storage.write(KStorageKeys.isSplashSeen, true);
  bool get isSplashSeen => _storage.read(KStorageKeys.isSplashSeen) ?? false;

  setFcmToken(String? token) => _storage.write(KStorageKeys.fcmToken, token);
  String? get getFcmToken => _storage.read(KStorageKeys.fcmToken);

  setUserInfo(UserModel? model) => _storage.write(KStorageKeys.userModel, model?.toJson() as Map<String, dynamic>);

  get delUserInfo => _storage.remove(KStorageKeys.userModel);

  UserModel? get getUserInfo {
    if (_storage.read(KStorageKeys.userModel) != null) {
      return UserModel.fromJson(_storage.read(KStorageKeys.userModel));
    } else {
      return null;
    }
  }

  setLocation(LocationData location) {
    Map<String, double> locationMap = {
      'latitude': location.latitude??0.0,
      'longitude': location.longitude??0.0,
    };
    return _storage.write(KStorageKeys.location, locationMap);
  }

  LocationData? get getLocation {
    // debugPrint(
    //     '================= >>>> Location form cache  :${_storage.read(KStorageKeys.location)} ');
    if (_storage.read(KStorageKeys.location) != null) {
      return LocationData.fromMap(_storage.read(KStorageKeys.location));
    }
    return null;
  }

  String? get getRole=>_storage.read(KStorageKeys.role);
  setRole(String role) => _storage.write(KStorageKeys.role, role);

}
