import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/register/register_bloc.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/views/auth/login/login_view.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../logic/register/register_state.dart';
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
      body: BlocProvider(
        create: (context) => Di.register,
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            state.whenOrNull(success: (model) {
              KHelper.customAwosmeDialog(
                title: "تم انشاء الحساب بنجاح",
                onApproveClick: () {
                  Get.offAll(() => const LoginView());
                },
              );
            },);

          },
          builder: (context, state) {
            final register = RegisterBloc.of(context);
            return SingleChildScrollView(
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
                            color: KColors.blackColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    11.h,
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "الرجاء ادخال البيانات المطلوبة",
                          style: KTextStyle.of(context).ten.copyWith(
                              color: KColors.mainColor.withOpacity(.5)),
                        )),
                    11.h,

                    KTextFormField(
                      labelText: "ادخل اسمك بالكامل",
                      controller: register.userNameController,
                      upperTitle: "الأسم",
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
                      controller: register.addressController,
                      labelText: "ادخل العنوان الخاص بك",

                      upperTitle: "العنوان",
                      // obscureText: login.isVisible,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return Tr.get.address_validation;
                        }
                        return null;
                      },
                    ),

                    11.h,
                    PhoneFormField(
                      controller: register.phoneController,
                      onDialChanged: (c) {
                        register.countryCode = c ?? CountryCode();
                      },
                    ),
                    SizedBox(height: KHelper.listPadding),
                    KTextFormField(
                      controller: register.passController,
                      labelText: "ادخل الرمز الخاص بتسجيل  الدخول",

                      upperTitle: "الرقم السري",
                      obscureText: register.isVisible,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return Tr.get.pass_validation;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,

                      suffixIcon: IconButton(
                        icon: register.isVisible
                            ? Icon(Icons.visibility_off_outlined,
                                color: KColors.blackColor.withOpacity(.4))
                            : Icon(Icons.visibility_outlined,
                                color: KColors.blackColor.withOpacity(.4)),
                        // icon: Icon(Icons.visibility_outlined,

                        onPressed: () {
                          register.togglePassV();
                        },
                      ),
                    ),
                    38.h,

                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: KButton(
                        isLoading: state is RegisterStateLoading,
                        title: 'انشاء حساب',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            register.register();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
