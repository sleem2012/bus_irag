import 'package:bus_iraq2/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../shared/widgets/drop_down.dart';
import '../../../shared/widgets/selectable_container.dart';
import '../../../shared/widgets/text_field.dart';

class PassengerInfoCard extends StatefulWidget {
  const PassengerInfoCard({
    super.key,
    required this.seatName,
    required this.nameController,
    required this.phoneController,
    required this.genderChanged,
  });

  final String seatName;

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final ValueChanged<String> genderChanged;

  @override
  State<PassengerInfoCard> createState() => _PassengerInfoCardState();
}

class _PassengerInfoCardState extends State<PassengerInfoCard> {
  bool isError=false;

  @override
  Widget build(BuildContext context) {
    List<GenderModel> genderList = [
      GenderModel(name: "ذكر", id: "1"),
      GenderModel(name: "أنثي", id: "2"),
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: KHelper.of(context).shadowContainer.copyWith(border:Border.all(color: isError?KColors.redColor:Colors.transparent)),
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * .38,
                child: KDropdownBtn(
                    validator: (p0) {
                      if (p0==null) {
                        return "";
                      }
                      return null;
                    },
                    minHeight: Get.height * .038,
                    hintColor: KColors.mainColor,
                    btnDecoration: KHelper.of(context)
                        .textFieldDecoration
                        .copyWith(
                            border: Border.all(
                                color: KColors.vDividerColor, width: 2)),
                    title: "اختيار الجنس",
                    onChanged: (p0) {
                      widget.genderChanged(p0?.id ?? "-1");
                      debugPrint(p0?.id);
                    },
                    items: genderList
                        .map((e) => KHelper.of(context)
                            .itemView(itemText: e.name, value: e))
                        .toList()),
              ),
              10.h,
              KTextFormField(
                width: Get.width * .75,
                height: Get.height * .045,
                textFiledHieght: Get.height * .045,

                controller: widget.nameController,
                decoration: InputDecoration(
                  hintStyle: KTextStyle.of(context)
                      .ten
                      .copyWith(color: KColors.mainColor.withOpacity(.5)),
                  contentPadding: const EdgeInsets.only(right: 15),
                  hintText: 'اسم المسافر',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          BorderSide(color: KColors.mainColor.withOpacity(.5))),
                ),
                keyboardType: TextInputType.name,
                // validator: (p0) {
                //   if (p0!.isEmpty) {
                //     return "";
                //   }
                //   return null;
                // },
              ),
              10.h,
              KTextFormField(
                textFiledHieght: Get.height * .045,
                width: Get.width * .75,

                controller: widget.phoneController,
                decoration: InputDecoration(
                  hintStyle: KTextStyle.of(context)
                      .ten
                      .copyWith(color: KColors.mainColor.withOpacity(.5)),
                  contentPadding: const EdgeInsets.only(right: 15),
                  hintText: 'رقم الهاتف المحمول',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          BorderSide(color: KColors.mainColor.withOpacity(.5))),
                ),
                keyboardType: TextInputType.phone,
                // validator: (p0) {
                //   if (p0!.isEmpty) {
                //     return "";
                //   }
                //   return null;
                // },
              ),
            ],
          ),
        ),
        if (widget.seatName.isNotEmpty)
          Positioned(
            left: -Get.width * .04,
            top: Get.height * .07,
            // bottom:Get.height * .4 ,
            child: SelectableContainer(
              width: 38,
              isSelected: true,
              text: widget.seatName,
            ),
          )
      ],
    );
  }
}

class GenderModel {
  final String name;
  final String id;

  GenderModel({required this.name, required this.id});
}
