import 'dart:async';

import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/localization/trans.dart';
import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../shared/theme/text_theme.dart';
import '../reset_pass/reset_pass_view.dart';


class ForgetPassView extends StatefulWidget {
  const ForgetPassView({super.key});

  @override
  State<ForgetPassView> createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  int index = 1;

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
                'استرجاع كلمة المرور',
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
                  child: index == 1
                      ? ForgetStep1(
                          onPress: () {
                              index ++;
                              setState(() {});

                          },
                          controller: TextEditingController(),
                        )
                      : ForgetStep2(
                          onPress: () {
                            Get.offAll(()=>const ResetPassView());
                          },
                          controller: TextEditingController(),
                          resendTimer: 60,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ForgetStep1 extends StatelessWidget {
  const ForgetStep1(
      {super.key, required this.controller, required this.onPress});

  final TextEditingController controller;
  final dynamic Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        111.h,
        KTextFormField(
          labelText: Tr.get.phone_number,
        ),
        200.h,
        KButton(
          title: "ارسال الرمز",
          onPressed: onPress,
        )
      ],
    );
  }
}

class ForgetStep2 extends StatefulWidget {
  ForgetStep2(
      {super.key,
      required this.controller,
      required this.onPress,
      required this.resendTimer});

  final TextEditingController controller;
  final dynamic Function() onPress;
  int resendTimer;

  @override
  State<ForgetStep2> createState() => _ForgetStep2State();
}

class _ForgetStep2State extends State<ForgetStep2> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.resendTimer > 0) {
          widget.resendTimer--;
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.h,
        Text(
          "تم ارسال رمز التحقق الي رقم",
          style: KTextStyle.of(context).fifteen.copyWith(
                color: KColors.mainColor,
              ),
        ),
        41.h,
        KButton(
          title: "+964-123548974",
          onPressed: () {},
          width: Get.width * .64,
          hieght: 45,
        ),
        29.h,
        Pinput(
          keyboardType: TextInputType.number,
          controller: widget.controller,
          closeKeyboardWhenCompleted: true,
          length: 4,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          errorText: "الرمز غير صحيح",
          onCompleted: (value) {},
        ),
        29.h,
        Text(
          "يمكنك طلب كود جديد بعد",
          style: KTextStyle.of(context)
              .fifteen
              .copyWith(color: KColors.mainColor, fontSize: 13),
        ),
        16.h,
        InkWell(
          onTap: () {
            if (widget.resendTimer <= 0) {
              // VerifyOtpBloc.of(context)
              //     .resend(cartModel: catModel);
              widget.resendTimer = 60; // Reset the timer value

              _startTimer(); //
              // Add your resend logic here
            }
          },
          child: Text(
              widget.resendTimer > 0
                  ? widget.resendTimer.toString()
                  : "اعادة الارسال",
              style: KTextStyle.of(context)
                  .fifteen
                  .copyWith(color: KColors.greenColor)),
        ),
        65.h,
        KButton(
          title: "تأكيد الرمز",
          onPressed: widget.onPress,
        )
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
