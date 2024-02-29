import 'package:bus_iraq2/views/main_screen/main_screen.dart';
import 'package:bus_iraq2/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'shared/cache/locale_storage.dart';
import 'shared/widgets/no_conniction_view.dart';
import 'views/auth/auth_type/auth_type_view.dart';
import 'views/auth/login/login_view.dart';
import 'shared/api_middleware_bloc/api_client_bloc.dart';
import 'shared/api_middleware_bloc/api_client_state.dart';
import 'shared/error/failures.dart';
import 'shared/widgets/nav.dart';

import 'di.dart';

import 'logic/theme/theme_cubit.dart';
import 'shared/theme/helper.dart';
import 'shared/localization/trans.dart';
import 'shared/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.themeBloc..loadTheme()),
        BlocProvider(create: (context) => Di.apiClientBloc),

        BlocProvider(create: (context) => Di.searchTrip),

      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocListener<ApiClientBloc, ApiClientState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  KHelper.showSnackBar(KFailure.toError(failure));
                  failure.whenOrNull(
                    offline: (options) {
                      Get.dialog(const KOfflineView(),
                          barrierColor: Colors.transparent,
                          barrierDismissible: false);
                    },
                    error401: () {
                      if (KStorage.i.getToken != null) {
                        KStorage.i.delToken;
                        KStorage.i.delUserInfo;
                        Get.offAll(() => const LoginView());
                      }
                    },
                  );
                },
              );
            },
            child: GetMaterialApp(
              navigatorKey: Nav.navigator,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: Tr.delegates,
              supportedLocales: Tr.supportedLocales,
              locale: ThemeBloc.of(context).locale,
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> iterable) {
                return ThemeBloc.of(context).locale;
              },
              theme: KThemeData.light,
              themeMode: ThemeBloc.of(context).themeMode,
              home: Builder(
                builder: (context) {
                  return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: KThemeData.of(context).overlayStyle,
                    child: const SplashScreen(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  initState() {
    super.initState();
    // GetLocationCubit.of(context).initLocation();
    //     .then((value) {
    //   debugPrint(value.fold((l) {
    //     debugPrint(l.toString());
    //     return null;
    //   }, (r) {
    //     debugPrint(":hghhghgyg${r.longitude}");
    //     KStorage.i.setLocation(r);
    //     return null;
    //   }));
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => nav());
  }

  nav() {
    if (KStorage.i.getToken != null) {
      Get.offAll(() => const MainNavPages());
    } else {
      Get.offAll(() => const AuthTypeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
