import 'package:bus_iraq2/data/repository/general/general_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'banner_state.dart';

class BannerBloc extends Cubit<BannerState> {
  BannerBloc({required this.bannerRepoImp}) : super(const BannerState.initial());

  static BannerBloc of(BuildContext context) => BlocProvider.of<BannerBloc>(context);


  final GeneralRepoImp bannerRepoImp;

  get() async {
    try {
      emit(const BannerState.loading());
      final result = await bannerRepoImp.get_banners();
      result.fold(
        (l) {
          debugPrint('================= Banner Bloc : ${KFailure.toError(l)}');
          emit(BannerState.error(error: l));
        },
        (r) {
          debugPrint('================= Banner Bloc : ${r.toString()}  ');
          emit(BannerState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Banner Bloc (Catch): ${e.toString()} ');
      emit(const BannerState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
