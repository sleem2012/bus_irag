import 'package:bus_iraq2/logic/account_history/account_history_bloc.dart';
import 'package:bus_iraq2/logic/account_history/account_history_bloc.dart';
import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/widgets/loading/loading_overlay.dart';
import 'package:bus_iraq2/shared/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/model/account_history_model.dart';
import '../../logic/account_history/account_history_state.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import 'accounts_history_view.dart';

class ClientAccountsList extends StatelessWidget {
  const ClientAccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountHistoryBloc, AccountHistoryState>(
      builder: (context, state) {
        final history = state.whenOrNull(
          success: (model) => model.innerData,
        );
        return KRequestOverlay(
          isLoading: state is AccountHistoryStateLoading,
          loadingWidget: const ShimmerList(),
          child: RefreshIndicator(
            onRefresh: () async {
              await AccountHistoryBloc.of(context).get();
            },
            child:((history??[]).isNotEmpty)? ListView.separated(
                padding: EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: Get.height * .2),
                itemBuilder: (context, index) => ClientAccountsHistoryCard(
                      history: history?[index] ?? InnerAccountData(),
                    ),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: history?.length ?? 0):Center(child: Text("لا توجد حسابات حاليا",style: KTextStyle.of(context).fifteen.copyWith(color: KColors.mainColor)),),
          ),
        );
      },
    );
  }
}

class ClientAccountsHistoryCard extends StatelessWidget {
  const ClientAccountsHistoryCard({super.key, required this.history});

  final InnerAccountData history;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: KHelper.of(context).titledContainer.copyWith(
          border: Border.all(color: KColors.blackColor.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRichWithIcon(
            keyText: 'تاريخ:',
            valueText: KHelper.convertDateTimeToDate(
                context, DateTime.parse(history.createdAt ?? '')),
            imagePath: 'assets/images/calender_icon.png',
          ),
          14.h,
          TextRichWithIcon(
            keyText: 'مسار:',
            valueText: history.route ?? '',
            imagePath: 'assets/images/bus-ticket-icon 1.png',
          ),
          14.h,
          Row(
            children: [
              if(history.passengerNumbers!=null)
           ...[   Expanded(
                  flex: 2,
                  child: TextRichWithIcon(
                    keyText: 'عدد:',
                    valueText: '${history.passengerNumbers ?? ''} ركاب',
                    imagePath: 'assets/images/two_persons.png',
                  )),
              const Spacer(flex: 1),],
              Expanded(
                flex: 2,
                child: TextRichWithIcon(
                  keyText: 'السعر:',
                  valueText: '${history.amount ?? ''} دينار ',
                  imagePath: 'assets/images/money_bag.png',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
