import 'package:bus_iraq2/dynamic_ui/data/repo/manual_payment_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/error/failures.dart';
import '../../data/model/fields_model.dart';
import 'get_manual_fields_state.dart';

class GetManualFieldsBloc extends Cubit<GetManualFieldsState> {
  GetManualFieldsBloc({required this.getManualFieldsRepoImp})
      : super(const GetManualFieldsState.initial());

  static GetManualFieldsBloc of(BuildContext context) =>
      BlocProvider.of<GetManualFieldsBloc>(context);

  final ManualPaymentRepoImp getManualFieldsRepoImp;
   DynamicFieldsModel? model;

  get() async {
    try {
      emit(const GetManualFieldsState.loading());
      final result = await getManualFieldsRepoImp.get_manual_payment();
      result.fold(
        (l) {
          debugPrint(
              '================= GetManualFields Bloc : ${KFailure.toError(l)}');
          emit(GetManualFieldsState.error(error: l));
        },
        (r) {
          model=r;
          debugPrint(
              '================= GetManualFields Bloc : ${r.toString()}  ');
          emit(GetManualFieldsState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint(
          '================= GetManualFields Bloc (Catch): ${e.toString()} ');
      emit(const GetManualFieldsState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  Map<String, Parameter>? selectedParameters;
  DynamicFieldsData? selectedData;

  void selectParameters(DynamicFieldsData selected) {
    selectedParameters = selected.parameters;
    selectedData=selected;
    // emit(const GetManualFieldsState.loading());
    emit(GetManualFieldsState.update(key: UniqueKey()));
    // emit(const GetManualFieldsState.success());
  }
}
