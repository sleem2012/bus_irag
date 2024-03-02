import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../model/user_model.dart';

abstract class _AuthRepo {
  Future<Either<KFailure, UserModel>> login(
      {required String phone, required String password});

// Future<Either<KFailure, Unit>> logout();
}

class AuthRepoImpl implements _AuthRepo {
  AuthRepoImpl();

  @override
  Future<Either<KFailure, UserModel>> login(
      {required String phone, required String password}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(
      KEndPoints.login,
      data: {
        "mobile_code": "93",
        "mobile": phone,
        "password": password,
        "device_token": "561505158465",
        "device_type": Platform.isIOS ? "ios" : "android",
        "type": isClient ? "1" : "2"
      },
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }


}
