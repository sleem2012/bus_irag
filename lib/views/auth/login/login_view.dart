import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/drop_down.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../di.dart';
import '../../../logic/login/login_bloc.dart';
import '../../../logic/login/login_state.dart';
import '../../../shared/constants.dart';
import '../../../shared/extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/lang_toggle_btn.dart';
import '../../../shared/widgets/loading/loading_overlay.dart';
import '../../../shared/widgets/nav.dart';
import '../../../shared/widgets/text_field.dart';
import '../../main_screen/main_screen.dart';
import '../widget/phone_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: KColors.whiteColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * .15,
                ),
                Text(
                  "تسجيل الدخول",
                  style: KTextStyle.of(context)
                      .twenty
                      .copyWith(color: KColors.blackColor),
                ),

                41.h,
                FluxImage(
                  imageUrl: Constant.loginLogo,
                  useExtendedImage: true,
                  // fit: BoxFit.fitHeight,
                ),
                // 15.h,

                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "مرحبا بك",
                    style: KTextStyle.of(context).twenty.copyWith(
                        color: KColors.blackColor, fontWeight: FontWeight.w400),
                  ),
                ),
                11.h,
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "الرجاء ادخال البيانات المطلوبة",
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: KColors.mainColor.withOpacity(.5)),
                    )),
                11.h,
                PhoneFormField(),
                SizedBox(height: KHelper.listPadding),
                KTextFormField(
                  // controller: login.passController,
                  labelText: "ادخل الرمز الخاص بتسجيل  الدخول",

                  upperTitle: "الرقم السري",
                  // obscureText: login.isVisible,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return Tr.get.pass_validation;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,

                  suffixIcon: IconButton(
                    // icon: login.isVisible
                    //     ? const Icon(Icons.visibility_off)
                    //     : const Icon(Icons.visibility),
                    icon: Icon(Icons.visibility_outlined,
                        color: KColors.blackColor.withOpacity(.4)),
                    onPressed: () {
                      // login.togglePassV();
                    },
                  ),
                ),
                38.h,
                // Align(
                //     alignment: Alignment.bottomRight,
                //     child: Text(
                //       Tr.get.forget_password,
                //       style: KTextStyle.of(context).body,
                //     )),
                // const SizedBox(height: 34),
                KButton(
                  isLoading: false,
                  title: Tr.get.login,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      // login.login();
                    }
                  },
                ),
                Lottie.asset('assets/json/splash_animation.json')
              ],
            ),
          ),
        ));
  }
}
