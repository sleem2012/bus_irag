import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import '../multi_select_dialog/index.dart';
import '../theme/helper.dart';
import '../theme/text_theme.dart';

class KDropdownBtn<T> extends StatelessWidget {
  final String title;
  final T? value;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;
  final List<MultiSelectorItem<T>> items;
  final SelectorViewType? type;
  final String? error;
  final BoxDecoration? btnDecoration;
  final bool? showArrow;
  final bool? showAz;
  final bool isLoading;
  final Color? hintColor;
  final Widget? suffixIcon;
  final double? minHeight;

  const KDropdownBtn({
    Key? key,
    required this.title,
    this.value,
    required this.onChanged,
    required this.items,
    this.validator,
    this.type,
    this.error,
    this.showArrow,
    this.btnDecoration,
    this.showAz,
    this.isLoading = false,  this.hintColor, this.suffixIcon, this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelector.single<T>(
      items: items,
      title: title,
      minHeight: minHeight,
      onChanged: onChanged,
      validator: validator,
      type: SelectorViewType.sheet,
      suffixIcon: suffixIcon,


      showArrow: showArrow,
      value: value,
      popupDecoration: KHelper.of(context).msgBubble,
      btnDecoration: btnDecoration ??  KHelper.of(context).textFieldDecoration.copyWith(),
      error: error,
      hintStyle: KTextStyle.of(context).hint.copyWith(fontSize: 10,color: hintColor??KColors.blackColor),
      showAz: showAz,
    );
  }
}

class KDropdownBtnMulti<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final String? Function(List<T>? values)? validator;
  final List<MultiSelectorItem<T>> items;
  final Function(List<T> values) onChanged;
  final SelectorViewType? type;
  final String? error;
  final bool? showArrow;
  final BoxDecoration? btnDecoration;

  const KDropdownBtnMulti({
    Key? key,
    required this.hint,
    this.value,
    required this.onChanged,
    required this.items,
    this.validator,
    this.type,
    this.error,
    this.showArrow,
    this.btnDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelector.multi<T>(
      items: items,
      title: hint,
      onChanged: onChanged,
      validator: validator,
      type: SelectorViewType.sheet,
      showArrow: showArrow,
      popupDecoration: KHelper.of(context).msgBubble,
      btnDecoration: btnDecoration ?? KHelper.of(context).textFieldDecoration,
      hintStyle: KTextStyle.of(context).hint,
      error: error,
    );
  }
}
