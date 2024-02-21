import 'package:flutter/material.dart';

import '../theme/theme_data.dart';

class KIconButton extends StatelessWidget {
  const KIconButton(
      {Key? key,
      this.onPressed,
      required this.child,
      this.radius,
      this.isLoading = false,
      this.backgroundColor})
      : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final double? radius;
  final bool? isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius ?? 30,
      height: radius ?? 30,
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? Colors.white,

        child: isLoading!
            ? const SizedBox(
                height: 15,
                width: 15,
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator())),
              )
            : SizedBox(
                height: 16,
                width: 16,
                child: RawMaterialButton(
                  onPressed: onPressed,
                  shape: const StadiumBorder(),
                  child: Theme(
                      data: KThemeData.of(context).themeData, child: child),
                ),
              ),
      ),
    );
  }
}
