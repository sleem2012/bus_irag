import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants.dart';
import '../../../shared/extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/text_field.dart';
import '../widget/phone_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            children: [
              SizedBox(
                height: Get.height * .12,
              ),
              Text(
                "انشاء حساب جديد",
                style: KTextStyle.of(context)
                    .twenty
                    .copyWith(color: KColors.blackColor),
              ),
              18.h,
              const FluxImage(
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

              KTextFormField(
                // controller: login.passController,
                labelText: "ادخل اسمك بالكامل",

                upperTitle: "الأسم",
                // obscureText: login.isVisible,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return Tr.get.name_validation;
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
              ),
              11.h,

              KTextFormField(
                // controller: login.passController,
                labelText: "ادخل العنوان الخاص بك",

                upperTitle: "العنوان",
                // obscureText: login.isVisible,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return Tr.get.address_validation;
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
              ),

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

              KButton(
                isLoading: false,
                title: 'انشاء حساب',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // login.login();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
