import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../model/user_model.dart';

abstract class _AuthRepo {
  Future<Either<KFailure, UserModel>> login(
      {required String userName, required String password});

// Future<Either<KFailure, Unit>> logout();
}

class AuthRepoImpl implements _AuthRepo {
  AuthRepoImpl();

  @override
  Future<Either<KFailure, UserModel>> login(
      {required String userName, required String password}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(
      KEndPoints.login,
      data: {
        "mobile_code": "93",
        "mobile": "0155577888",
        "password": "Aa123456@",
        "device_token": "561505158465",
        "device_type": "ios"
      },
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }

// @override
// Future<Either<KFailure, Unit>> logout() async {
//   Future<Response<dynamic>> func = Di.dioClient
//       .post(KEndPoints.logout, data: {"TOKEN": KStorage.i.getToken});
//   final result = await ApiClientHelper.responseOrFailure(func: func);
//   return result.fold(
//     (l) => left(l),
//     (r) => right(unit),
//   );
// }
}
