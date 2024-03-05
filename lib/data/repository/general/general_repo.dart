import 'package:bus_iraq2/data/model/country_codes.dart';
import 'package:bus_iraq2/data/model/fleet_type_model.dart';

import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';
import '../../model/banner_model.dart';
import '../../model/booking_locations.dart';

abstract class GeneralRepoAbs {
  Future<Either<KFailure, LocationsData>> get_locations();
  Future<Either<KFailure, CountryCodesModel>> get_country_codes();
  Future<Either<KFailure, BannerModel>> get_banners();
  Future<Either<KFailure, FleetTypeModel>> get_fleet({required String from,required String to,required String type});
}

class GeneralRepoImp implements GeneralRepoAbs {
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
  Future<Either<KFailure, CountryCodesModel>> get_country_codes() async{
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.getCountryCode,
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
          (l) => left(l),
          (r) => right(CountryCodesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, BannerModel>> get_banners() async{
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.getBanners,
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
          (l) => left(l),
          (r) => right(BannerModel.fromJson(r['data'])),
    );
  } @override
  Future<Either<KFailure, FleetTypeModel>> get_fleet({required String from,required String to,required String type}) async{
    Future<Response<dynamic>> func = Di.dioClient.post(
      KEndPoints.getFleets,
      data: {
        "pickup":from,
        "destination":to,
        "type":type,
      }
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
          (l) => left(l),
          (r) => right(FleetTypeModel.fromJson(r['data'])),
    );
  }
}
