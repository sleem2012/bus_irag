import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/error/failures.dart';
import '../../data/repo/manual_payment_repo.dart';
import 'post_manual_filds_state.dart';

class PostManualFildsBloc extends Cubit<PostManualFildsState> {
  PostManualFildsBloc({required this.postManualFildsRepoImp})
      : super(const PostManualFildsState.initial());

  static PostManualFildsBloc of(BuildContext context) =>
      BlocProvider.of<PostManualFildsBloc>(context);

  final ManualPaymentRepoImp postManualFildsRepoImp;

  post() async {
    try {
      emit(const PostManualFildsState.loading());
      final result =
          await postManualFildsRepoImp.post_manual_payment(json: json);
      result.fold(
        (l) {
          // json.clear();

          debugPrint(
              '================= PostManualFilds Bloc : ${KFailure.toError(l)}');
          emit(PostManualFildsState.error(error: l));
        },
        (r) {
          json.clear();

          debugPrint(
              '================= PostManualFilds Bloc : ${r.toString()}  ');
          emit(const PostManualFildsState.success());
        },
      );
    } catch (e) {
      debugPrint(
          '================= PostManualFilds Bloc (Catch): ${e.toString()} ');
      emit(const PostManualFildsState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  Map<String, dynamic> json = {};


  // TextEditingController amountController = TextEditingController();
  setGateway(int id){
    json['gateway_id'] = id;
  }
 setAmount(String amount){
    json['amount'] = amount;
  }

  addText(Map<String, dynamic> textJson) {


    json.addAll(textJson);
    // debugPrint('================ $json');
  }

  addFile(Map<String, dynamic> fileJson) {
    json.addAll(fileJson);
    // debugPrint('================ $json');
  }
}
