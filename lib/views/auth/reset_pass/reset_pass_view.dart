import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/widgets/text_field.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: KColors.mainColor,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * .15,
            ),
            Center(
              child: Text(
                'كلمة المرور الجديدة',
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
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: Column(
                      children: [
                        55.h,
                        KTextFormField(
                          // controller: login.passController,
                          labelText: "ادخل كلمة المرور الجديدة",

                          upperTitle: "كلمة المرور",
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
                        14.h,
                        KTextFormField(
                          // controller: login.passController,
                          labelText: "ادخل تأكيد كلمة المرور الجديدة",

                          upperTitle: "تأكيد كلمة المرور",
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
                        92.h,
                        KButton(
                          title: "تغيير كلمة المرور",
                          onPressed: () {

                          },
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
