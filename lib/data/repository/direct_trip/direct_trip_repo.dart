import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';
import '../../model/seats_model.dart';

abstract class DirectTripRepoAbs {
  Future<Either<KFailure, SeatsData>> get_seats();
}

class DirectTripRepoImp implements DirectTripRepoAbs {
  @override
  Future<Either<KFailure, SeatsData>> get_seats() async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.getSeats,
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SeatsData.fromJson(r['data'])),
    );
  }
}
