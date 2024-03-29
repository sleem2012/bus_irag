import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';
import '../../model/account_history_model.dart';
import '../../model/wallet_amount_model.dart';

abstract class WalletRepoAbs {
  Future<Either<KFailure, WalletAmountModel>> get_wallet_amount();

  Future<Either<KFailure, AccountData>> get_account_history();
}

class WalletRepoImp implements WalletRepoAbs {
  @override
  Future<Either<KFailure, WalletAmountModel>> get_wallet_amount() async {
    Future<Response<dynamic>> func =
        Di.dioClient.get(KEndPoints.getWalletAmount);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(WalletAmountModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AccountData>> get_account_history() async {
    Future<Response<dynamic>> func =
        Di.dioClient.get(KEndPoints.getAccountHistory);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(AccountData.fromJson(r['data'])),
    );
  }
}
