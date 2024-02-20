import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../shared/constants.dart';
import '../../../shared/widgets/flux_image.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KColors.mainColor,
      body: FluxImage(imageUrl:'assets/json/splash_animation.json'),
    );
  }
}
