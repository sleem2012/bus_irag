import 'package:bus_iraq2/logic/get_ticket/get_ticket_bloc.dart';
import 'package:bus_iraq2/logic/get_ticket/get_ticket_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:bus_iraq2/shared/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/model/get_ticket_model.dart';
import '../../logic/get_ticket/get_ticket_state.dart';
import '../../shared/api_client/endpoints.dart';
import '../../shared/small_button.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/widgets/titled_container.dart';

class ReservationHistory extends StatelessWidget {
  const ReservationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "سجل الحجوزات",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: BlocBuilder<GetTicketBloc, GetTicketState>(
            builder: (context, state) {
              final tickets = state.whenOrNull(
                success: (model) => model.innerData,
              );
              return KRequestOverlay(
                isLoading: state is GetTicketStateLoading,
                loadingWidget: const ShimmerList(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    GetTicketBloc.of(context).get();
                  },
                  child: ListView.separated(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                          bottom: Get.height * .2),
                      itemBuilder: (context, index) => ReservationHistoryCard(
                            ticket: tickets?[index] ?? TicketInnerData(),
                          ),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: tickets?.length ?? 0),
                ),
              );
            },
          ),
        ))
      ],
    );
  }
}

class ReservationHistoryCard extends StatelessWidget {
  const ReservationHistoryCard({super.key, required this.ticket});

  final TicketInnerData ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: KHelper.of(context).titledContainer.copyWith(
          border: Border.all(color: KColors.blackColor.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "رقم الحجز:" '  ',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.blackColor)),
                    TextSpan(
                      text: ticket.pnrNumber,
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: KColors.mainColor),
                    ),
                  ],
                ),
              ),
              SmallButton(
                title: "سحب التذكرة",
                textColor: KColors.mainColor,
                kFillColor: KColors.mainColor.withOpacity(.2),
                hieght: Get.height * .035,
                width: Get.width * .25,
                iconPath: "assets/images/ticket.png",
                onPressed: () {},
              )
            ],
          ),
          18.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "اسم الراكب:" '  ',
                        style: KTextStyle.of(context)
                            .ten
                            .copyWith(color: KColors.blackColor)),
                    TextSpan(
                      text: ticket.user,
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: KColors.mainColor),
                    ),
                  ],
                ),
              ),
              SmallButton(
                title: "الغاء الحجز",
                textColor: KColors.boldRedColor,
                kFillColor: KColors.redColor.withOpacity(.13),
                hieght: Get.height * .035,
                width: Get.width * .25,
                iconPath: "assets/images/cancel_reserve.png",
                onPressed: () {},
              )
            ],
          ),
          10.h,
          Divider(
            color: KColors.blackColor.withOpacity(.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NameWithIcon(
                iconPath: "assets/images/money_bag.png",
                keyText: "مبلغ الحجز",
                valueText: "${double.parse(ticket.subTotal ?? '0')} دينار",
              ),
              (!isClient)
                  ? const NameWithIcon(
                      iconPath: "assets/images/money_bag.png",
                      keyText: "مبلغ التسديد",
                      valueText: "200 دينار",
                    )
                  : const Spacer(),
              if (!isClient)
                const NameWithIcon(
                  iconPath: "assets/images/commision.png",
                  keyText: "عمولة الوكيل",
                  valueText: "50 دينار",
                ),
            ],
          )
        ],
      ),
    );
  }
}

class NameWithIcon extends StatelessWidget {
  const NameWithIcon(
      {super.key,
      required this.iconPath,
      required this.keyText,
      required this.valueText});

  final String iconPath;
  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FluxImage(imageUrl: iconPath),
        5.w,
        Column(
          children: [
            Text(
              keyText,
              style:
                  KTextStyle.of(context).ten.copyWith(color: KColors.mainColor),
            ),
            2.h,
            Text(
              valueText,
              style: KTextStyle.of(context)
                  .seven
                  .copyWith(color: KColors.blackColor.withOpacity(.42)),
            ),
          ],
        )
      ],
    );
  }
}
