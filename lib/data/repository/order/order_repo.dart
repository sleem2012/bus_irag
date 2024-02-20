// import '../../../shared/api_client/dio_client_helper.dart';
// import '../../../shared/api_client/endpoints.dart';
// import '../../../shared/error/failures.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../../di.dart';
// import '../../model/order_model.dart';
// import '../../model/reject_reasons_model.dart';
//
// abstract class OrderRepoAbs {
//   Future<Either<KFailure, OrderModel>> get_order(
//       {required int page_count, required int page});
//
//   Future<Either<KFailure, OrderList>> get_order_by_id({required int id});
//
//   Future<Either<KFailure, RejectReasonsModel>> get_reject_reasons();
//
//   Future<Either<KFailure, Unit>> update_order_status(
//       Map<String, dynamic> values);
// }
//
// class OrderRepoImp implements OrderRepoAbs {
//   @override
//   Future<Either<KFailure, OrderModel>> get_order(
//       {required int page_count, required int page}) async {
//     Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.order, data: {
//       "FilterModel": {
//         "PageFilter": {
//           "PageIndex": page,
//           "PageSize": page_count
//           //   "SearchKeyword": "<string>"
//         }
//         // "SearchKeyword": "<string>"
//       },
//
//       "StatusIDs": [5, 6, 7],
//
// //   "excelFlage": false
//     });
//     final result = await ApiClientHelper.responseOrFailure(func: func);
//     return result.fold(
//       (l) => left(l),
//       (r) => right(OrderModel.fromJson(r)),
//     );
//   }
//
//   @override
//   Future<Either<KFailure, RejectReasonsModel>> get_reject_reasons() async {
//     Future<Response<dynamic>> func = Di.dioClient.get(
//       KEndPoints.reject_reasons,
//     );
//     final result = await ApiClientHelper.responseOrFailure(func: func);
//     return result.fold(
//       (l) => left(l),
//       (r) => right(RejectReasonsModel.fromJson(r)),
//     );
//   }
//
//   @override
//   Future<Either<KFailure, Unit>> update_order_status(
//       Map<String, dynamic> values) async {
//     Future<Response<dynamic>> func =
//         Di.dioClient.post(KEndPoints.update_order, data: values);
//     final result = await ApiClientHelper.responseOrFailure(func: func);
//     return result.fold(
//       (l) => left(l),
//       (r) => right(unit),
//     );
//   }
//
//   @override
//   Future<Either<KFailure, OrderList>> get_order_by_id({required int id}) async{
//
//     Future<Response<dynamic>> func = Di.dioClient.get(
//       KEndPoints.order_by_id,
//       params: {
//         "orderId":id
//       }
//     );
//     final result = await ApiClientHelper.responseOrFailure(func: func);
//     return result.fold(
//           (l) => left(l),
//           (r) => right(OrderList.fromJson(r['Value'])),
//     );
//
//   }
// }
