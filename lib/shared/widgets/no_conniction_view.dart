import 'package:flutter/material.dart';
import '../localization/trans.dart';
import '../theme/text_theme.dart';

class KOfflineView extends StatelessWidget {
  final void Function()? onTryAgain;
  const KOfflineView({Key? key, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Tr.get.no_connection,
                style: KTextStyle.of(context).ten,
              ),
              // Lottie.asset('assets/animations/no_connection.json', width: Get.width * .6),
              const SizedBox(height: 25),
              if (onTryAgain != null)
                TextButton(
                  onPressed: onTryAgain,
                  child: Text(Tr.get.try_again, style: KTextStyle.of(context).btnTitle),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
