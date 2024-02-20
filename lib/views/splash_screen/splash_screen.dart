import 'package:flutter/material.dart';

import '../../app.dart';
import '../../shared/widgets/nav.dart';
import 'widget/splash_body.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
 {

@override
  void initState() {

   Future.delayed(const Duration(milliseconds: 4800),() {
     Nav.offAll(const Wrapper());
   },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const SplashBody();

    // return BlocBuilder<SettingBloc, SettingState>(
    //   builder: (context, state) {
    //     return state.maybeWhen(orElse: () {
    //     }, error: (error) {
    //       return KErrorView(
    //         error: error,
    //         onTryAgain: SettingBloc.of(context).get,
    //       );
    //     }, success: (model) {
    //
    //         return const MainNavPages();
    //     });
    //   },
    // );
  }
}
