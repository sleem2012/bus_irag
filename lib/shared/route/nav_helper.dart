import 'package:flutter/material.dart';

import '../../logic/main_view/main_view_bloc.dart';

class NavHelper{
  static BuildContext? _context;
  static NavHelper? _instance;
  static NavHelper of(BuildContext context) {
    _context = context;
    return _instance ?? NavHelper._internal();
  }
  NavHelper._internal() {
    _instance = this;
  }

  void get goHome=>MainViewBloc.of(_context!).navTaped(0);
  void get navigateToNotification=>MainViewBloc.of(_context!).navTaped(3);
  void get navigateToDirectReservation=>MainViewBloc.of(_context!).navTaped(4);
  void get navigateToAvailableTrips=>MainViewBloc.of(_context!).navTaped(5);

}