import 'package:bus_iraq2/shared/api_client/endpoints.dart';
import 'package:bus_iraq2/shared/cache/locale_storage.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';

class AuthTypeView extends StatelessWidget {
  const AuthTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * .15,
          ),
          Center(
            child: Text(
              'اختيار طرق التسجيل',
              style: KTextStyle.of(context)
                  .twenty
                  .copyWith(color: KColors.whiteColor),
            ),
          ),
          67.h,
          Expanded(
            child: Container(
              color: KColors.whiteColor,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KButton(
                        title: "مسافر",
                        onPressed: () {
                          setUserRole('client');
                        },
                        width: Get.width * .4,
                        iconPath: 'assets/images/passenger.png',
                      ),
                      const Spacer(),
                      KButton(
                        width: Get.width * .4,
                        title: "وكيل",
                        iconPath: 'assets/images/agent.png',
                        onPressed: () {
                          setUserRole('Agent');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setUserRole(String userRole) {
    Get.to(() => const LoginView());
    debugPrint(role);
    KStorage.i.setRole(userRole);
  }
}
