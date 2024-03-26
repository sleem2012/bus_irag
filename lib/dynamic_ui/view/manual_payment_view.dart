import 'dart:io';

import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/dynamic_ui/logic/get_manual_fields/get_manual_fields_state.dart';
import 'package:bus_iraq2/dynamic_ui/logic/post_manual_filds/post_manual_filds_state.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart' hide MultipartFile;

import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/drop_down.dart';
import '../../shared/widgets/file_picker_widget.dart';
import '../../shared/widgets/flux_image.dart';
import '../../shared/widgets/text_field.dart';
import '../../shared/widgets/titled_container.dart';
import '../data/model/fields_model.dart';
import '../logic/get_manual_fields/get_manual_fields_bloc.dart';
import '../logic/post_manual_filds/post_manual_filds_bloc.dart';

class ManualPaymentView extends StatelessWidget {
  const ManualPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Column(
      children: [
        const TitledContainer(
          title: "بوابة دفع اليدويه",
        ),
        Expanded(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => Di.getManualFields..get(),
              ),
              BlocProvider(
                create: (context) => Di.postManualFields,
              ),
            ],
            child: BlocConsumer<PostManualFildsBloc, PostManualFildsState>(
              listener: (context, postState) {
                postState.whenOrNull(
                  success: () {
                    KHelper.customAwosmeDialog(
                      title: "تم ارسال طلبك",
                      onApproveClick: () {
                        Get.back();
                      },
                    );
                  },
                );
              },
              builder: (context, postState) {
                final postBloc = PostManualFildsBloc.of(context);
                return BlocBuilder<GetManualFieldsBloc, GetManualFieldsState>(
                  builder: (context, state) {
                    final model = GetManualFieldsBloc.of(context).model?.data;
                    final getBloc = GetManualFieldsBloc.of(context);
                    return Container(
                      color: KColors.backgroundD,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              30.h,
                              KTextFormField(
                                labelText: 'المبلغ',
                                keyboardType: TextInputType.number,
                                onChanged: (p0) {
                                  postBloc.setAmount(p0);
                                },
                                suffixIcon: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const FluxImage(
                                      imageUrl: 'assets/images/iqd.png',
                                    ),
                                    Text(
                                      'دينار',
                                      style: KTextStyle.of(context)
                                          .fifteen
                                          .copyWith(color: KColors.mainColor),
                                    )
                                  ],
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.field_required;
                                  }
                                  return null;
                                },
                              ),
                              20.h,
                              KDropdownBtn<DynamicFieldsData>(
                                  // minHeight: Get.height * .038,
                                  hintColor: KColors.mainColor.withOpacity(.40),
                                  btnDecoration:
                                      KHelper.of(context).circledTopContainer,
                                  title: "طريقة السحب المفضلة",
                                  onChanged: (DynamicFieldsData? p0) {
                                    getBloc.selectParameters(
                                        p0 ?? DynamicFieldsData());
                                    postBloc.setGateway(p0?.id ?? -1);
                                  },
                                  validator: (p0) {
                                    if (p0 == null) {
                                      return Tr.get.field_required;
                                    }
                                    return null;
                                  },
                                  items: model
                                          ?.map((e) => KHelper.of(context)
                                              .itemView(
                                                  itemText: e.name ?? '',
                                                  value: e))
                                          .toList() ??
                                      []),
                              20.h,
                              HtmlWidget(
                                getBloc.selectedData?.description ?? '',
                                textStyle: KTextStyle.of(context)
                                    .ten
                                    .copyWith(color: KColors.mainColor),
                              ),
                              40.h,
                              ...?getBloc.selectedParameters?.entries.map((e) {
                                final type = e.value.type;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: type?.when(
                                        textField: () => KTextFormField(
                                          // width: Get.width * .75,
                                          // textFiledHieght: Get.height * .045,
                                          // controller: nameController,
                                          onChanged: (p0) {
                                            postBloc.addText(
                                                {"${e.value.fieldName}": p0});
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.person_outline,
                                              color: KColors.mainColor,
                                            ),
                                            fillColor: KColors.whiteColor,
                                            filled: true,
                                            hintStyle: KTextStyle.of(context)
                                                .ten
                                                .copyWith(
                                                    color: KColors.mainColor
                                                        .withOpacity(.5)),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    right: 15),
                                            hintText: e.value.fieldLevel,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(.5)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: KColors.mainColor
                                                        .withOpacity(.5))),
                                          ),

                                          keyboardType: TextInputType.name,
                                          validator: (p0) {
                                            if (p0!.isEmpty &&
                                                e.value.validation ==
                                                    'required') {
                                              return Tr.get.field_required;
                                            }
                                            return null;
                                          },
                                        ),
                                        checkbox: () => const SizedBox(),
                                        dateTimePiker: () => const SizedBox(),
                                        dropDownButton: () => const SizedBox(),
                                        fileInput: () => FilePickerWidget(
                                          onSelect: (File? s) async {
                                            final file =
                                                MultipartFile.fromFileSync(
                                                    s?.path ?? '',
                                                    filename: s?.path
                                                        .split('/')
                                                        .last);
                                            postBloc.addFile({
                                              "${e.value.fieldName}": "$file"
                                            });
                                          },
                                          title: e.value.fieldLevel ?? '',
                                          validator: (p0) {
                                            if (p0 == null &&
                                                e.value.validation ==
                                                    'required') {
                                              return Tr.get.field_required;
                                            }
                                            return null;
                                          },
                                        ),
                                        imageInput: () => const SizedBox(),
                                        radioButton: () => const SizedBox(),
                                      ) ??
                                      const SizedBox(),
                                );
                              }),
                              40.h,
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: Get.height * .2),
                                child: KButton(
                                  title: "تأكيد",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      debugPrint(postBloc.json.toString());

                                      postBloc.post();
                                    }
                                  },
                                  isLoading:
                                      postState is PostManualFildsStateLoading,
                                  kFillColor: KColors.mainColor,
                                  textColor: KColors.whiteColor,
                                  hieght: 55,
                                  width: Get.width * .7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
