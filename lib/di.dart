import 'package:bus_iraq2/data/repository/direct_trip/direct_trip_repo.dart';
import 'package:bus_iraq2/data/repository/general/general_repo.dart';
import 'package:bus_iraq2/logic/banner/banner_bloc.dart';
import 'package:bus_iraq2/logic/book_direct_trip/book_direct_trip_bloc.dart';
import 'package:bus_iraq2/logic/choose_seet/choose_seet_bloc.dart';
import 'package:bus_iraq2/logic/register/register_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'data/repository/auth/auth_repo.dart';
import 'logic/country_codes/country_codes_bloc.dart';
import 'logic/get_locations/get_locations_bloc.dart';
import 'logic/login/login_bloc.dart';
import 'logic/logout/logout_bloc.dart';
import 'logic/trip_search/trip_search_bloc.dart';
import 'shared/api_client/api_client_impl.dart';
import 'shared/api_middleware_bloc/api_client_bloc.dart';
import 'shared/observer.dart';

import 'logic/theme/theme_cubit.dart';
import 'main.dart';

abstract class Di {
  static final GetIt _i = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    Bloc.observer = MyBlocObserver();
    // await NotificationCtrl.fcm_init('Forall Sales');
    _reg();
  }

  static Future reset(context) async {
    await _unReg();
    RestartWidget.restartApp(context);
    await _i.resetScope(dispose: true);
    _reg();
  }

  static _reg() {
    ///Repos

    _i.registerLazySingleton(() => DioClientImpl(apiClientBloc: _i()));
    _i.registerLazySingleton(() => Connectivity());
    _i.registerLazySingleton(() => ThemeBloc());
    _i.registerLazySingleton(() => ApiClientBloc());
    _i.registerLazySingleton(() => ImagePicker());
    _i.registerLazySingleton(() => AuthRepoImpl());
    _i.registerLazySingleton(() => DirectTripRepoImp());
    _i.registerLazySingleton(() => GeneralRepoImp());

    ///bloc

    _i.registerFactory(() => LoginBloc(authRepoImpl: _i()));
    _i.registerFactory(() => RegisterBloc(registerRepoImp: _i()));
    _i.registerFactory(() => LogoutBloc(authRepoImpl: _i()));
    _i.registerFactory(() => ChooseSeetBloc(chooseSeetRepoImp: _i()));
    _i.registerFactory(() => GetLocationsBloc(getLocationsRepoImp: _i()));
    _i.registerFactory(() => TripSearchBloc(tripSearchRepoImp: _i()));
    _i.registerFactory(() => CountryCodesBloc(countryCodesRepoImp: _i()));
    _i.registerFactory(() => BookDirectTripBloc(bookDirectTripRepoImp: _i()));
    _i.registerFactory(() => BannerBloc(bannerRepoImp: _i()));

  }

  static _unReg() async {
    await _i.unregister<DioClientImpl>();

    await _i.unregister<Connectivity>();
    await _i.unregister<ThemeBloc>();
    await _i.unregister<ApiClientBloc>();

    await _i.unregister<ImagePicker>();
    await _i.unregister<AuthRepoImpl>();
    await _i.unregister<LoginBloc>();
    await _i.unregister<LogoutBloc>();
  }

  // getters
  static DioClientImpl get dioClient => _i.get<DioClientImpl>();

  static Connectivity get connectivity => _i.get<Connectivity>();

  static ThemeBloc get themeBloc => _i.get<ThemeBloc>();

  static ApiClientBloc get apiClientBloc => _i.get<ApiClientBloc>();

  static ImagePicker get imagePicker => _i.get<ImagePicker>();

  static LoginBloc get loginBloc => _i.get<LoginBloc>();

  static LogoutBloc get logOut => _i.get<LogoutBloc>();

  static ChooseSeetBloc get chooseSeat => _i.get<ChooseSeetBloc>();

  static GetLocationsBloc get getLocations => _i.get<GetLocationsBloc>();

  static TripSearchBloc get searchTrip => _i.get<TripSearchBloc>();

  static CountryCodesBloc get countryCode => _i.get<CountryCodesBloc>();
  static BannerBloc get getBanner => _i.get<BannerBloc>();
  static BookDirectTripBloc get bookDirectTrip => _i.get<BookDirectTripBloc>();
  static RegisterBloc get register => _i.get<RegisterBloc>();
}
