import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  final String? text;
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final double? width;

  const SelectableContainer({
    Key? key,
    this.text,
    this.isSelected = false,
    this.child,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.onSelected, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animatedWidget = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width??45,
      height: 50,
      margin: margin,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            isSelected ? KColors.mainColor : KColors.mainColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: child ??
            Text(text ?? '',
                style: isSelected
                    ? KTextStyle.of(context).ten
                    : KTextStyle.of(context)
                        .ten
                        .copyWith(color: KColors.mainColor.withOpacity(.4))),
      ),
    );
    if (onSelected == null) {
      return animatedWidget;
    }

    return GestureDetector(
      onTap: () => onSelected!(!isSelected),
      child: animatedWidget,
    );
  }
}
