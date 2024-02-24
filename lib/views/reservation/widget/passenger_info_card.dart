import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/widgets/drop_down.dart';
import '../../../shared/widgets/selectable_container.dart';
import '../../../shared/widgets/text_field.dart';

class PassengerInfoCard extends StatelessWidget {
  const PassengerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: KHelper.of(context).shadowContainer,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * .5,
                child: KDropdownBtn(
                    hintColor: KColors.mainColor,
                    btnDecoration: KHelper.of(context)
                        .textFieldDecoration
                        .copyWith(
                            border: Border.all(
                                color: KColors.vDividerColor, width: 2)),
                    title: "اختيار الجنس",
                    onChanged: (p0) {},
                    items: []),
              ),
              KTextFormField(
                labelText: "اسم المسافر",
                width: Get.width * .73,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return Tr.get.field_required;
                  }
                  return null;
                },
              ),
              KTextFormField(
                labelText: "رقم الهاتف المحمول",
                width: Get.width * .73,
                keyboardType: TextInputType.phone,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return Tr.get.field_required;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: -Get.width * .04,
          top: Get.height * .1,
          // bottom:Get.height * .4 ,
          child: const SelectableContainer(
            width: 38,
            isSelected: true,
            text: "A1",
          ),
        )
      ],
    );
  }
}
