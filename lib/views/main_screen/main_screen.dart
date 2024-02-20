import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/main_view/main_view_bloc.dart';
import '../../shared/appbar.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';

class MainNavPages extends StatelessWidget {
  const MainNavPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewBloc(),
      child: BlocBuilder<MainViewBloc, MainViewState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: KAppBar(
                title: MainViewBloc.of(context).label[state.index],
                isMainScreen: true),
            body: PageView(
              controller: MainViewBloc.of(context).pageCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: [ Container()],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: KColors.accentColor,
              onPressed: () {
              },
              child: const Icon(
                KHelper.refresh,
              ),


            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              height: 60,
              icons: MainViewBloc.of(context).navItems,
              activeIndex: state.index,
              shadow: Shadow(color: KColors.shadowD, blurRadius: 10),
              backgroundColor: KColors.backgroundD,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: MainViewBloc.of(context).navTaped,
              activeColor: KColors.mainColor,
              inactiveColor: KColors.accentColor,
            ),
          );
        },
      ),
    );
  }
}
