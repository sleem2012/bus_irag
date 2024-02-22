import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bus_iraq2/shared/custom_header.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/main_view/main_view_bloc.dart';
import '../../shared/theme/colors.dart';
import '../reservation/available_trips.dart';
import '../reservation/direct_reservation.dart';

class MainNavPages extends StatelessWidget {
  const MainNavPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewBloc(),
      child: BlocBuilder<MainViewBloc, MainViewState>(
        builder: (context, state) {
          final mainBloc = MainViewBloc.of(context);
          return Scaffold(
            backgroundColor: KColors.mainColor,
            extendBody: true,
            appBar: CustomHeader(
              showClientImage: mainBloc.showClientImage,
              showClientName: mainBloc.showClientName,
              showNotification: mainBloc.showNotification,
              showTitle: mainBloc.showTitle,
            ),
            body: PageView(
              controller: MainViewBloc.of(context).pageCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const HomeView(),
                Container(),
                Container(),
                Container(),
                const DirectReservation(), //direct reserve
                const AvailableTrips(),
              ],
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              tabBuilder: (int index, bool isActive) {
                return Column(
                  children: [
                    Expanded(
                      child: ImageIcon(
                        AssetImage(MainViewBloc.of(context).navItems[index]),
                        size: 24,
                        color: isActive
                            ? KColors.mainColor
                            : KColors.unselectedColor,
                      ),
                    ),
                    Text(
                      MainViewBloc.of(context).label[index],
                      style: KTextStyle.of(context).ten.copyWith(
                          color: isActive
                              ? KColors.mainColor
                              : KColors.unselectedColor),
                    )
                  ],
                );
              },
              activeIndex: state.index,
              shadow: const Shadow(color: KColors.shadowD, blurRadius: 10),
              backgroundColor: KColors.whiteColor,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: MainViewBloc.of(context).navTaped,
              itemCount: 4,
            ),
          );
        },
      ),
    );
  }
}
