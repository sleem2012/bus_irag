import 'package:bus_iraq2/data/model/get_ticket_model.dart';

import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../di.dart';



abstract class TicketRepoAbs {
  Future<Either<KFailure, TicketData>> get_ticket_history();
}

class TicketRepoImp implements TicketRepoAbs {

  @override
  Future<Either<KFailure, TicketData>> get_ticket_history() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.getTicketHistory);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(TicketData.fromJson(r['data'])),
    );
  }

}
