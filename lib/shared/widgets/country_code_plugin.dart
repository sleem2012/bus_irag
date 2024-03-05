import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_theme.dart';

class CountryCodeWidget extends StatelessWidget {
  final void Function(CountryCode?)? onChanged, onInit;

  const CountryCodeWidget({Key? key, this.onChanged, this.onInit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlag: false,
      // barrierColor: KColors.redColor,
      hideMainText: false,

      // textStyle: KTextStyle.of(context).hint.copyWith(color: KColors.blackColor),
      padding: EdgeInsets.zero,
      // alignLeft: true,
      dialogTextStyle: KTextStyle.of(context).hint,
      initialSelection: 'IQ',
      favorite: const [
        'IQ'
      ],
      backgroundColor: KColors.blackColor,
      showFlagDialog: true,
      showCountryOnly: true,
      showFlagMain: false,
      closeIcon: const Icon(Icons.close, color: KColors.redColor),
      dialogBackgroundColor: KColors.backgroundD,
      comparator: (a, b) => b.name!.compareTo(a.name!),
      onInit: onInit,
    );
  }
}
