import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'data/repository/auth/auth_repo.dart';
import 'logic/login/login_bloc.dart';
import 'logic/logout/logout_bloc.dart';
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


    ///bloc

    _i.registerFactory(() => LoginBloc(authRepoImpl: _i()));
    _i.registerFactory(() => LogoutBloc(authRepoImpl: _i()));

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

}
