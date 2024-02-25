import 'package:flutter/material.dart';

import '../../logic/main_view/main_view_bloc.dart';

class NavHelper {
  static BuildContext? _context;
  static NavHelper? _instance;

  static NavHelper of(BuildContext context) {
    _context = context;
    return _instance ?? NavHelper._internal();
  }

  NavHelper._internal() {
    _instance = this;
  }

  void get goHome => MainViewBloc.of(_context!).navTaped(0);

  void get navToReservationHistory => MainViewBloc.of(_context!).navTaped(1);

  void get navigateToNotification => MainViewBloc.of(_context!).navTaped(3);

  void get navigateToDirectReservation =>
      MainViewBloc.of(_context!).navTaped(4);

  void get navigateToAvailableTrips => MainViewBloc.of(_context!).navTaped(5);

  void get navigateToPassengerInfo => MainViewBloc.of(_context!).navTaped(6);

  void get navigateToCustomReservation =>
      MainViewBloc.of(_context!).navTaped(7);

  void get navigateToCustomTripForm => MainViewBloc.of(_context!).navTaped(8);

  void get navigateToWallet => MainViewBloc.of(_context!).navTaped(9);
  void get navigateAddMoney => MainViewBloc.of(_context!).navTaped(10);
}
