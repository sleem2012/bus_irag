import 'package:bus_iraq2/data/model/seats_model.dart';
import 'package:bus_iraq2/data/model/sent_trip_search_model.dart';
import 'package:bus_iraq2/data/repository/direct_trip/direct_trip_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/search_trip_model.dart';
import '../../shared/error/failures.dart';
import 'book_direct_trip_state.dart';

class BookDirectTripBloc extends Cubit<BookDirectTripState> {
  BookDirectTripBloc({required this.bookDirectTripRepoImp})
      : super(const BookDirectTripState.initial());

  static BookDirectTripBloc of(BuildContext context) =>
      BlocProvider.of<BookDirectTripBloc>(context);

  final DirectTripRepoImp bookDirectTripRepoImp;

  book() async {
    try {
      emit(const BookDirectTripState.loading());
      final result = await bookDirectTripRepoImp.book_trip(json: jsonValues);
      result.fold(
        (l) {
          debugPrint(
              '================= BookDirectTrip Bloc : ${KFailure.toError(l)}');
          emit(BookDirectTripState.error(error: l));
        },
        (r) {
          debugPrint(
              '================= BookDirectTrip Bloc : ${r.toString()}  ');
          emit(const BookDirectTripState.success());
        },
      );
    } catch (e) {
      debugPrint(
          '================= BookDirectTrip Bloc (Catch): ${e.toString()} ');
      emit(const BookDirectTripState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  Map<String, dynamic> jsonValues = {};

  List<TextEditingController> namesControllerList=[];
  List<TextEditingController> phoneControllerList=[];
  List<String> gender=[];

  void addListValues(
      {required List<Seats> listed,
      required SentTripSearchModel sentSearchModel,
      required int tripId}) {
    jsonValues.clear();
    jsonValues.addAll({
      "trip_id": tripId,
      "type": sentSearchModel.type,
      "go_date": sentSearchModel.goDate,
      if (sentSearchModel.backDate != null)
        "back_date": sentSearchModel.backDate,
    });
    for (var i = 0; i < listed.length; i++) {
      jsonValues.addAll(
        {
          "seats[$i][id]": listed[i].id,
          "seats[$i][name]": listed[i].name,
          "seats[$i][gender]": gender[i],
          "seats[$i][client_name]": namesControllerList[i].text,
          "seats[$i][client_phone]": phoneControllerList[i].text
        },
      );
    }
    debugPrint(jsonValues.toString());
  }
}
