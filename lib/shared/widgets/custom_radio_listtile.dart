import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/helper.dart';
import '../theme/text_theme.dart';
import 'flux_image.dart';

class CustomRadioListTile extends StatefulWidget {
  const CustomRadioListTile({super.key, required this.valueChanged});

  final ValueChanged<int> valueChanged;

  @override
  State<CustomRadioListTile> createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          4,
              (index) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: KHelper
                      .of(context)
                      .roundedContainer
                      .copyWith(
                      color: KColors.whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: RadioListTile.adaptive(
                    value: true,
                    groupValue: selected == index,
                    activeColor: KColors.mainColor,
                    onChanged: (value) {
                      setState(() {
                        selected = index;
                      });
                      widget.valueChanged(index);
                    },
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    title: Text('باي ابل',
                        style: KTextStyle
                            .of(context)
                            .ten
                            .copyWith(color: KColors.blackColor, fontSize: 12),
                        textAlign: TextAlign.center),
                    secondary: const FluxImage(
                      imageUrl: 'assets/images/apple-pay.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )),
    );
  }
}
