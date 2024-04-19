import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/widgets/country_code_plugin.dart';

class PhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(CountryCode?) onDialChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon, prefixIcon;
  final String? hintText, errorText, labelText, upperTitle;
  final bool autofocus, enabled, expanded, showUpperTitle;
  final double? kWidth, height;
  final int? maxLines;
  final bool obscureText;
  final String? initVal;
  final TextStyle? style;
  final List<TextInputFormatter>? formatter;
  final void Function()? onTap;
  final Color? kFillColor;

  const PhoneFormField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.onTap,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.autofocus = false,
    this.prefixIcon,
    this.enabled = true,
    this.kWidth,
    this.height,
    this.maxLines,
    this.formatter,
    this.expanded = false,
    this.initVal,
    this.style,
    this.kFillColor,
    this.labelText,
    this.upperTitle,
    this.showUpperTitle = true, required this.onDialChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: kWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showUpperTitle) ...[
            Text(
              "ادخل رقم الهاتف",
              style: KTextStyle.of(context)
                  .ten
                  .copyWith(color: KColors.blackColor),
            ),
            11.h,
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  inputFormatters: formatter,
                  keyboardAppearance: Theme.of(context).brightness,
                  keyboardType: TextInputType.phone,
                  controller: controller,
                  autofocus: autofocus,
                  enabled: enabled,
                  onTap: onTap,
                  expands: expanded,
                  initialValue: controller == null ? initVal : null,
                  cursorColor: KColors.cursorD,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return Tr.get.phone_number_validation;
                    }
                    return null;
                  },
                  onChanged: onChanged,
                  obscureText: obscureText,
                  style: style ??
                      KTextStyle.of(context)
                          .fifteen
                          .copyWith(color: Colors.black),
                  maxLines: maxLines ?? (obscureText ? 1 : null),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    // filled: true,
                    fillColor: kFillColor ?? KColors.textFieldD,
                    hintStyle: KTextStyle.of(context).hint,
                    hintText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    errorStyle: KTextStyle.of(context).error,
                    labelStyle: KTextStyle.of(context).hint,
                    errorText: errorText,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    isDense: false,
                    labelText: labelText ?? "ادخل رقم هاتفك المحمول",
                  ),
                ),
              ),
              11.w,
              Expanded(
                flex: 1,
                child: Container(
                  height: Get.height*.057,
                    decoration: KHelper.of(context).textFieldDecoration,
                    child:  CountryCodeWidget(onChanged: onDialChanged,)),
              )

            ],
          ),
        ],
      ),
    );
  }
}
