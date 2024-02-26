import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
  int index = 0;

  void navTaped(int page) {
    if (page != pageCtrl.page?.toInt()) {
      // pageCtrl.jumpToPage(page);
      index = page;

      pageCtrl.animateToPage(page,
          duration: const Duration(milliseconds: 450),
          curve: Curves.decelerate);
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
    "الرئيسية",
    "الحجوزات",
    "الحسابات",
    "الاشعارات",
    "الرحلات المباشرة"
  ];

  bool get showClientName => index == 0;
  bool get showClientImage=> index == 0||index == 4;
  bool get showNotification=> index == 0||index == 4;
  bool get showTitle=> index == 4;
}
