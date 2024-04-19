import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/constants.dart';
import '../../../shared/error/failures.dart';
import '../../model/user_model.dart';

abstract class _AuthRepo {
  Future<Either<KFailure, UserModel>> login(
      {required String phone,
      required String password,
      required String countryCode});

  Future<Either<KFailure, UserModel>> register(
      {required String username,
        required String email,
        required String lastname,
        required String firstName,
        required String phone,
        required String password,
        required String address,
        required CountryCode countryCode});

// Future<Either<KFailure, Unit>> logout();
}

class AuthRepoImpl implements _AuthRepo {
  AuthRepoImpl();

  @override
  Future<Either<KFailure, UserModel>> login(
      {required String phone,
      required String password,
      required String countryCode}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(
      KEndPoints.login,
      data: {
        "mobile_code": countryCode,
        "mobile": phone,
        "password": password,
        "device_token": "561505158465",
        "device_type": Platform.isIOS ? "ios" : "android",
        "type": Constant().isClient ? "1" : "2"
      },
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, UserModel>> register(
      {required String username,
      required String email,
      required String lastname,
      required String firstName,
      required String phone,
      required String password,
      required String address,
      required CountryCode countryCode}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(
      KEndPoints.register,
      data: {
        "username": username,
        "country_code": countryCode.code,
        "mobile_code": countryCode.dialCode?.replaceAll("+", "") ?? '',
        "mobile": phone,
        "address[address]": address,
        "password": password,
        "password_confirmation": password,
        "firstname":firstName,
        "lastname":lastname,
        "email":email,
      },
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }
}
