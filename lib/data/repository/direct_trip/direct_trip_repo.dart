import 'package:bus_iraq2/data/model/sent_trip_search_model.dart';

import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';
import '../../model/booking_locations.dart';
import '../../model/search_trip_model.dart';
import '../../model/seats_model.dart';

abstract class DirectTripRepoAbs {
  Future<Either<KFailure, SeatsData>> get_seats();

  Future<Either<KFailure, LocationsData>> get_locations();

  Future<Either<KFailure, SearchData>> search_trip(
      {required SentTripSearchModel model});
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

  @override
  Future<Either<KFailure, LocationsData>> get_locations() async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.getLocations,
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(LocationsData.fromJson(r['data'])),
    );
  }

  @override
  Future<Either<KFailure, SearchData>> search_trip(
      {required SentTripSearchModel model}) async {
    Future<Response<dynamic>> func =
        Di.dioClient.post(KEndPoints.directSearch, data: model.toJson());

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SearchData.fromJson(r['data'])),
    );
  }
}
