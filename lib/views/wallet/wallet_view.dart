import 'package:bus_iraq2/logic/get_wallet_amount/get_wallet_amount_bloc.dart';
import 'package:bus_iraq2/logic/get_wallet_amount/get_wallet_amount_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/flux_image.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../logic/get_wallet_amount/get_wallet_amount_state.dart';
import '../../shared/api_client/endpoints.dart';
import '../../shared/constants.dart';
import '../../shared/route/nav_helper.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/titled_container.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledContainer(
          title: "المحفظة",
        ),
        Expanded(
            child: Container(
          color: KColors.backgroundD,
          width: double.infinity,
          child: RefreshIndicator(
            onRefresh: () async {
              GetWalletAmountBloc.of(context).get();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Constant().isClient ? 130.h : 20.h,
                  Constant().isClient
                      ? const ClientWalletCard()
                      : Column(
                          children: [
                            const CustomWalletCard(
                                mainColor: KColors.purple,
                                keyText: 'الدائن',
                                valueText: 'دينار 2000',
                                image: 'assets/images/money_man.svg'),
                            10.h,
                            const CustomWalletCard(
                                mainColor: KColors.boldGreenColor,
                                keyText: 'المدين',
                                valueText: 'دينار 2000',
                                image: 'assets/images/money_bag.svg'),
                            10.h,
                            const CustomWalletCard(
                                mainColor: KColors.mainColor,
                                keyText: 'رصيد الديون',
                                valueText: 'دينار 2000',
                                image: 'assets/images/money_bag.svg'),
                            10.h,
                            const CustomWalletCard(
                                mainColor: Color(0xffAA59B1),
                                keyText: 'حد الأتمان',
                                valueText: 'دينار 2000',
                                image: 'assets/images/money_man.svg'),
                            10.h,
                            const CustomWalletCard(
                                mainColor: Color(0xffAFB159),
                                keyText: 'الدائن',
                                valueText: 'دينار 2000',
                                image: 'assets/images/svg_balance.svg'),
                          ],
                        ),
                  20.h,
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height * .2),
                    child: KButton(
                      title: "اضافة رصيد",
                      onPressed: () {
                        NavHelper.of(context).navigateAddMoney;
                      },
                      kFillColor: KColors.lightGreen,
                      iconPath: "assets/images/wallet.png",
                      textColor: KColors.greenColor,
                      borderColor: KColors.greenColor,
                      hieght: 74,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}

class ClientWalletCard extends StatelessWidget {
  const ClientWalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.mainColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الرصيد المتاح",
            style: KTextStyle.of(context).fifteen,
          ),
          BlocBuilder<GetWalletAmountBloc, GetWalletAmountState>(
            builder: (context, state) {
              final amount = state.whenOrNull(
                success: (model) => model,
              );
              return KRequestOverlay(
                isLoading: state is GetWalletAmountStateLoading,
                child: Text(
                  "$amount دينار",
                  style: KTextStyle.of(context).fifteen,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomWalletCard extends StatelessWidget {
  const CustomWalletCard(
      {super.key,
      required this.mainColor,
      required this.keyText,
      required this.valueText,
      required this.image});

  final Color mainColor;
  final String keyText, valueText, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mainColor.withOpacity(.18),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mainColor)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                keyText,
                style:
                    KTextStyle.of(context).fifteen.copyWith(color: mainColor),
              ),
              3.h,
              FluxImage(
                imageUrl: image,
                color: mainColor,
              ),
            ],
          ),
          Text(
            valueText,
            style: KTextStyle.of(context).fifteen.copyWith(color: mainColor),
          ),
        ],
      ),
    );
  }
}
