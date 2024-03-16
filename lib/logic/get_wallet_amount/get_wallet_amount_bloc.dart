import 'package:bus_iraq2/data/repository/wallet/wallet_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'get_wallet_amount_state.dart';

class GetWalletAmountBloc extends Cubit<GetWalletAmountState> {
  GetWalletAmountBloc({required this.walletRepoImp}) : super(const GetWalletAmountState.initial());

  static GetWalletAmountBloc of(BuildContext context) => BlocProvider.of<GetWalletAmountBloc>(context);


  final WalletRepoImp walletRepoImp;

  get() async {
    try {
      emit(const GetWalletAmountState.loading());
      final result = await walletRepoImp.get_wallet_amount();
      result.fold(
        (l) {
          debugPrint('================= GetWalletAmount Bloc : ${KFailure.toError(l)}');
          emit(GetWalletAmountState.error(error: l));
        },
        (r) {
          debugPrint('================= GetWalletAmount Bloc : ${r.toString()}  ');
          emit(GetWalletAmountState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= GetWalletAmount Bloc (Catch): ${e.toString()} ');
      emit(const GetWalletAmountState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
