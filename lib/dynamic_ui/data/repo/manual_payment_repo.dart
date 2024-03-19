import '../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/fields_model.dart';

abstract class ManualPaymentRepoAbs {
  Future<Either<KFailure, DynamicFieldsModel>> get_manual_payment();
  Future<Either<KFailure, Unit>> post_manual_payment({required Map<String,dynamic>json});
}

class ManualPaymentRepoImp implements ManualPaymentRepoAbs {
  @override
  Future<Either<KFailure, DynamicFieldsModel>> get_manual_payment() async {
    Future<Response<dynamic>> func =
        Di.dioClient.get(KEndPoints.getManualFields);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(DynamicFieldsModel.fromJson(r)),
    );
  }  @override
  Future<Either<KFailure, Unit>> post_manual_payment({required Map<String,dynamic>json}) async {
    Future<Response<dynamic>> func =
        Di.dioClient.postWithFiles(KEndPoints.postManualFields,data: json);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
