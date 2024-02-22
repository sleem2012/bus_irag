import 'package:flutter/material.dart';

import '../localization/trans.dart';
import '../theme/colors.dart';
import 'custom_button.dart';
import 'nav.dart';

class SaveOrCancelButton extends StatelessWidget {
  const SaveOrCancelButton({super.key, required this.onPressed});
  final dynamic Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KButton(
            title: Tr.get.save,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextButton(
            child: Text(Tr.get.cancel, style: const TextStyle(color: KColors.accentColor)),
            onPressed: () {
              Nav.back();
            },
          ),
        ),
      ],
    );
  }
}
