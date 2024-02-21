import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/localization/trans.dart';

@immutable
class MainViewState {
  final int index;

  const MainViewState({required this.index});
}

class MainViewBloc extends Cubit<MainViewState> {
  MainViewBloc() : super(const MainViewState(index: 0));

  static MainViewBloc of(BuildContext context) {
    return BlocProvider.of<MainViewBloc>(context);
  }

  PageController pageCtrl = PageController();

  void navTaped(int page) {
    if (page != pageCtrl.page?.toInt()) {
      pageCtrl.jumpToPage(page);
      // pageCtrl.animateToPage(page, duration: const Duration(milliseconds: 450), curve: Curves.easeOutCubic);
    }
    emit(MainViewState(index: page));
  }

  List<String> navItems = [
    "assets/images/home.png",
    "assets/images/reservation.png",
    "assets/images/accounts.png",
    "assets/images/notification.png"
  ];
  List<String> label = [
    Tr.get.home,
    "الحجوزات",
    "الحسابات",
    "الاشعارات"
  ];
}
