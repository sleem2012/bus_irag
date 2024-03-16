import 'package:bus_iraq2/data/repository/wallet/wallet_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'account_history_state.dart';

class AccountHistoryBloc extends Cubit<AccountHistoryState> {
  AccountHistoryBloc({required this.accountHistoryRepoImp}) : super(const AccountHistoryState.initial());

  static AccountHistoryBloc of(BuildContext context) => BlocProvider.of<AccountHistoryBloc>(context);


  final WalletRepoImp accountHistoryRepoImp;

  get() async {
    try {
      emit(const AccountHistoryState.loading());
      final result = await accountHistoryRepoImp.get_account_history();
      result.fold(
        (l) {
          debugPrint('================= AccountHistory Bloc : ${KFailure.toError(l)}');
          emit(AccountHistoryState.error(error: l));
        },
        (r) {
          debugPrint('================= AccountHistory Bloc : ${r.toString()}  ');
          emit(AccountHistoryState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= AccountHistory Bloc (Catch): ${e.toString()} ');
      emit(const AccountHistoryState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
