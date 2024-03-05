import 'package:bus_iraq2/data/repository/direct_trip/direct_trip_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/seats_model.dart';
import '../../data/model/sent_trip_search_model.dart';
import '../../shared/error/failures.dart';
import 'book_custom_trip_state.dart';

class BookCustomTripBloc extends Cubit<BookCustomTripState> {
  BookCustomTripBloc({required this.bookCustomTripRepoImp})
      : super(const BookCustomTripState.initial());

  static BookCustomTripBloc of(BuildContext context) =>
      BlocProvider.of<BookCustomTripBloc>(context);

  final DirectTripRepoImp bookCustomTripRepoImp;

  book() async {
    try {
      emit(const BookCustomTripState.loading());
      final result =
          await bookCustomTripRepoImp.book_custom_trip(json: jsonValues);
      result.fold(
        (l) {
          debugPrint(
              '================= BookCustomTrip Bloc : ${KFailure.toError(l)}');
          emit(BookCustomTripState.error(error: l));
        },
        (r) {
          debugPrint(
              '================= BookCustomTrip Bloc : ${r.toString()}  ');
          emit(const BookCustomTripState.success());
        },
      );
    } catch (e) {
      debugPrint(
          '================= BookCustomTrip Bloc (Catch): ${e.toString()} ');
      emit(const BookCustomTripState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  Map<String, dynamic> jsonValues = {};

  final TextEditingController passNumberController = TextEditingController();
  final TextEditingController responsibleNameController =
      TextEditingController();
  final TextEditingController responsiblePhoneController = TextEditingController();
  List<TextEditingController> namesControllerList = [];
  List<TextEditingController> phoneControllerList = [];
  List<String> gender = [];
  String dialCode = "+964";

  int length = 0;

  updateLength(int length) {
    this.length = length;
    emit(const BookCustomTripState.loading());
    emit(const BookCustomTripState.initial());
  }

  void addListValues({
    required SentTripSearchModel sentSearchModel,
  }) {
    jsonValues.clear();
    jsonValues.addAll(
      {
        "pickup": sentSearchModel.pickup,
        "destination": sentSearchModel.destination,
        "type": sentSearchModel.type,
        "go_date": sentSearchModel.goDate,
        "fleet_type": sentSearchModel.fleetType,
        if (sentSearchModel.backDate != null)
          "back_date": sentSearchModel.backDate,
        "passenger_numbers": passNumberController.text,
        "responsible_name": responsibleNameController.text,
        "responsible_phone": responsiblePhoneController.text,
        "address": "ttwdfdg",
        "government_id": "1",
        "city_id": "1",
      },
    );
    for (var i = 0; i < length; i++) {
      jsonValues.addAll(
        {
          "seats[$i][gender]": gender[i],
          "seats[$i][client_name]": namesControllerList[i].text,
          "seats[$i][client_phone]": phoneControllerList[i].text
        },
      );
    }
    debugPrint(jsonValues.toString());
  }
}


