import 'package:bus_iraq2/di.dart';
import 'package:bus_iraq2/logic/book_custom_trip/book_custom_trip_bloc.dart';
import 'package:bus_iraq2/logic/book_custom_trip/book_custom_trip_bloc.dart';
import 'package:bus_iraq2/logic/trip_search/trip_search_bloc.dart';
import 'package:bus_iraq2/shared/constants.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/route/nav_helper.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/custom_button.dart';
import 'package:bus_iraq2/shared/widgets/text_field.dart';
import 'package:bus_iraq2/views/auth/widget/phone_form.dart';
import 'package:bus_iraq2/views/reservation/widget/passenger_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../logic/book_custom_trip/book_custom_trip_state.dart';
import '../../logic/get_ticket/get_ticket_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/drop_down.dart';
import '../../shared/widgets/selectable_container.dart';
import '../../shared/widgets/titled_container.dart';

class CustomTripForm extends StatefulWidget {
  const CustomTripForm({super.key});

  @override
  State<CustomTripForm> createState() => _CustomTripFormState();
}

class _CustomTripFormState extends State<CustomTripForm> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Column(
      children: [
        const TitledContainer(
          title: "معلومات الرحلة المخصصة",
        ),
        BlocProvider(
          create: (context) => Di.bookCustomTrip,
          child: BlocConsumer<BookCustomTripBloc, BookCustomTripState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  KHelper.customAwosmeDialog(
                    title: "تم الحجز بنجاح",
                    onApproveClick: () {
                      GetTicketBloc.of(context).get();
                      NavHelper.of(context).navToReservationHistory;
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              final book = BookCustomTripBloc.of(context);
              final decksNumber = TripSearchBloc.of(context).numberDecks;
              debugPrint(decksNumber.toString());
              final _numberInputFormatter = FilteringTextInputFormatter.allow(
                  RegExp('^[1-$decksNumber]\$'));

              return Expanded(
                child: Container(
                    color: KColors.backgroundD,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.h,
                            KTextFormField(
                              labelText: "زعيم الرحلة",
                              controller: book.responsibleNameController,
                              suffixIcon: const Icon(Icons.person_2_outlined),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                            10.h,
                            PhoneFormField(
                              labelText: "رقم الهاتف",
                              showUpperTitle: false,
                              controller: book.responsiblePhoneController,
                              onDialChanged: (c) {
                                book.dialCode =
                                    c?.dialCode?.replaceAll("+", "") ?? '';
                              },
                            ),
                            if (!Constant().isClient) ...[
                              10.h,
                              KTextFormField(
                                labelText: "اقرب نقطة دالة",
                                controller: book.nearPointController,
                                suffixIcon: const Icon(Icons.location_on),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.field_required;
                                  }
                                  return null;
                                },
                              ),
                              10.h,
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       flex: 2,
                              //       child: KDropdownBtn(
                              //         // validator: (values) {
                              //         //   if (values == null) {
                              //         //     return "الحقل مطلوب";
                              //         //   } else {
                              //         //     return null;
                              //         //   }
                              //         // },
                              //         title: "المحافظة",
                              //         onChanged: (p0) {
                              //           // searchBloc.setPickupDirection(
                              //           //     p0?.id.toString() ?? '');
                              //         },
                              //         items: [],
                              //         hintColor: KColors.mainColor,
                              //       ),
                              //     ),
                              //     const Spacer(
                              //       flex: 1,
                              //     ),
                              //     Expanded(
                              //       flex: 2,
                              //       child: KDropdownBtn(
                              //         // validator: (values) {
                              //         //   if (values == null) {
                              //         //     return "الحقل مطلوب";
                              //         //   } else {
                              //         //     return null;
                              //         //   }
                              //         // },
                              //         title: "المدينه",
                              //         onChanged: (p0) {
                              //           // searchBloc.setPickupDirection(
                              //           //     p0?.id.toString() ?? '');
                              //         },
                              //         items: const [],
                              //         hintColor: KColors.mainColor,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                            10.h,
                            KTextFormField(
                              labelText: "عدد الركاب",
                              keyboardType: TextInputType.number,
                              controller: book.passNumberController,
                              width: Get.width * .5,
                              formatter: [_numberInputFormatter],
                              onChanged: (String p0) {
                                book.namesControllerList.clear();
                                book.phoneControllerList.clear();
                                book.gender.clear();

                                int value = int.tryParse(p0) ?? 0;
                                book.updateLength(value);

                                for (int i = 0; i < value; i++) {
                                  book.namesControllerList
                                      .add(TextEditingController());
                                  book.phoneControllerList
                                      .add(TextEditingController());
                                  book.gender.add('');
                                }
                                debugPrint(
                                    book.namesControllerList.length.toString());
                              },
                              suffixIcon:
                                  const Icon(FontAwesomeIcons.personWalking),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                            16.h,
                            Text(
                              "معلومات الراكب",
                              style: KTextStyle.of(context)
                                  .ten
                                  .copyWith(color: KColors.mainColor),
                            ),
                            18.h,
                            ...List.generate(
                              book.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: PassengerInfoCard(
                                  phoneController:
                                      book.phoneControllerList[index],
                                  seatName: '',
                                  nameController:
                                      book.namesControllerList[index],
                                  genderChanged: (String value) {
                                    book.gender[index] = value;
                                  },
                                ),
                              ),
                            ),
                            20.h,
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: Center(
                                child: KButton(
                                  isLoading:
                                      state is BookCustomTripStateLoading,
                                  width: Get.width * .6,
                                  hieght: Get.height * .05,
                                  title: "احجز الأن",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      book.addListValues(
                                        sentSearchModel:
                                            TripSearchBloc.of(context)
                                                .sentModel,
                                      );
                                      book.book();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
