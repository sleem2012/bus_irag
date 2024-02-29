import 'package:bus_iraq2/data/repository/general/general_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'country_codes_state.dart';

class CountryCodesBloc extends Cubit<CountryCodesState> {
  CountryCodesBloc({required this.countryCodesRepoImp}) : super(const CountryCodesState.initial());

  static CountryCodesBloc of(BuildContext context) => BlocProvider.of<CountryCodesBloc>(context);


  final GeneralRepoImp countryCodesRepoImp;

  get() async {
    try {
      emit(const CountryCodesState.loading());
      final result = await countryCodesRepoImp.get_country_codes();
      result.fold(
        (l) {
          debugPrint('================= CountryCodes Bloc : ${KFailure.toError(l)}');
          emit(CountryCodesState.error(error: l));
        },
        (r) {
          debugPrint('================= CountryCodes Bloc : ${r.toString()}  ');
          emit(CountryCodesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= CountryCodes Bloc (Catch): ${e.toString()} ');
      emit(const CountryCodesState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
