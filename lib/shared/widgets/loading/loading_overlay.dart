
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../theme/helper.dart';
import '../error/error_view.dart';

class KLoadingOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading, reverseTheme;
  final Widget? loadingWidget;

  const KLoadingOverlay(
      {Key? key, this.child, this.isLoading = false, this.reverseTheme = false, this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  (isLoading)?
      loadingWidget ??Animate(
          onPlay: (controller) => controller
            ..repeat(
              period: const Duration(seconds: 1),
            ),
          effects: const [FadeEffect()],
          child: Image.asset(
            Constant.appLogo,
            // fit: BoxFit.fitHeight,
          ),
        )
  :
        child ?? SizedBox(width: KHelper.width, height: KHelper.height),
    );
  }
}


class KRequestOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  final String? error;
  final Widget? loadingWidget;
  final void Function()? onTryAgain;
  const KRequestOverlay({Key? key, this.child, required this.isLoading, this.error, this.onTryAgain, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          if (isLoading)
            loadingWidget ??
                Animate(
                  onPlay: (controller) => controller
                    ..repeat(
                      period: const Duration(seconds: 1),
                    ),
                  effects: const [FadeEffect()],
                  child: Image.asset(
                    Constant.appLogo,
                    // fit: BoxFit.fitHeight,
                  ),
                )
          else if (error != null)
            KErrorView(error: error, onTryAgain: onTryAgain)
          else
            child ?? SizedBox(width: Get.width, height: Get.height),
        ],
      ),
    );
  }
}
