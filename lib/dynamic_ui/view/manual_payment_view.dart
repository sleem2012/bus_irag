import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/dynamic_ui/logic/get_manual_fields/get_manual_fields_state.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/drop_down.dart';
import '../../shared/widgets/text_field.dart';
import '../../shared/widgets/titled_container.dart';
import '../data/model/fields_model.dart';
import '../logic/get_manual_fields/get_manual_fields_bloc.dart';

class ManualPaymentView extends StatelessWidget {
  const ManualPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "بوابة دفع اليدويه",
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => Di.getManualFields..get(),
            child: BlocConsumer<GetManualFieldsBloc, GetManualFieldsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final model = state.whenOrNull(
                  success: (model) => model.data,
                );
                final bloc = GetManualFieldsBloc.of(context);
                return Container(
                  color: KColors.backgroundD,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        30.h,
                        KDropdownBtn<DynamicFieldsData>(
                            // minHeight: Get.height * .038,
                            hintColor: KColors.mainColor.withOpacity(.40),
                            btnDecoration:
                                KHelper.of(context).circledTopContainer,
                            title: "طريقة السحب المفضلة",
                            onChanged: (DynamicFieldsData? p0) {
                              bloc.selectParameters(p0?.parameters);
                              // p0?.parameters?.forEach(
                              //   (key, value) {
                              //     debugPrint("$Key" "${value.type}");
                              //   },
                              // );
                            },
                            items: model
                                    ?.map((e) => KHelper.of(context).itemView(
                                        itemText: e.name ?? '', value: e))
                                    .toList() ??
                                []),
                        40.h,
                        ...?bloc.selectedParameters?.entries.map((e) {
                          final type = e.value.type;
                          return type?.when(
                                textField: () =>  KTextFormField(
                                  // width: Get.width * .75,
                                  // textFiledHieght: Get.height * .045,
                                  // controller: nameController,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.person_outline,
                                      color: KColors.mainColor,
                                    ),
                                    fillColor: KColors.whiteColor,
                                    filled: true,
                                    hintStyle: KTextStyle.of(context).ten.copyWith(
                                        color: KColors.mainColor.withOpacity(.5)),
                                    contentPadding: const EdgeInsets.only(right: 15),
                                    hintText: e.value.fieldLevel,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(.5)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: KColors.mainColor.withOpacity(.5))),
                                  ),

                                  keyboardType: TextInputType.name,
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return Tr.get.field_required;
                                    }
                                    return null;
                                  },
                                ),
                                checkbox: () => const SizedBox(),
                                dateTimePiker: () => const SizedBox(),
                                dropDownButton: () => const SizedBox(),
                                fileInput: () =>  Text(e.value.fieldLevel??''),
                                imageInput: () => const SizedBox(),
                                radioButton: () => const SizedBox(),
                              ) ??
                              const SizedBox();
                        }),
                        20.h,
                        KTextFormField(
                          // width: Get.width * .75,
                          // textFiledHieght: Get.height * .045,
                          // controller: nameController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.phone_android,
                              color: KColors.mainColor,
                            ),
                            fillColor: KColors.whiteColor,
                            filled: true,
                            hintStyle: KTextStyle.of(context).ten.copyWith(
                                color: KColors.mainColor.withOpacity(.5)),
                            contentPadding: const EdgeInsets.only(right: 15),
                            hintText: 'رقم الهاتف:',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: KColors.mainColor.withOpacity(.5))),
                          ),

                          keyboardType: TextInputType.phone,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                        20.h,
                        KTextFormField(
                          // width: Get.width * .75,
                          // textFiledHieght: Get.height * .045,
                          // controller: nameController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.credit_card,
                              color: KColors.mainColor,
                            ),
                            fillColor: KColors.whiteColor,
                            filled: true,
                            hintStyle: KTextStyle.of(context).ten.copyWith(
                                color: KColors.mainColor.withOpacity(.5)),
                            contentPadding: const EdgeInsets.only(right: 15),
                            hintText: 'رقم البطاقة:',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: KColors.mainColor.withOpacity(.5))),
                          ),

                          keyboardType: TextInputType.number,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                        60.h,
                        Padding(
                          padding: EdgeInsets.only(bottom: Get.height * .2),
                          child: KButton(
                            title: "تأكيد",
                            onPressed: () {},
                            kFillColor: KColors.mainColor,
                            textColor: KColors.whiteColor,
                            hieght: 55,
                            // bordrerRadius: 34,
                            width: Get.width * .7,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
