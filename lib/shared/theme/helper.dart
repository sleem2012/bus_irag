import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../cache/locale_storage.dart';
import '../widgets/custom_button.dart';
import '../widgets/nav.dart';
import '../localization/trans.dart';
import '../multi_select_dialog/multi_helper.dart';
import '../widgets/map_picker/data/country_search_model/address_result.dart';
import '../widgets/map_picker/view/map.dart';
import 'colors.dart';

String get dummyNetLogo => 'https://forall.sa/assets/image/no-image.jpg';

String get dummyNetImg => 'https://forall.sa/assets/image/bg.jpg';

abstract class KHelper {
  static KHelperGetters of(BuildContext context) {
    return KHelperGetters.of(context);
  }

  /// Icons Data =================*
  static const IconData activity = Icons.show_chart_outlined;
  static const IconData dashBoard = Icons.dashboard;
  static const IconData list = Icons.list_outlined;
  static const IconData store = Icons.storefront_outlined;
  static const IconData add = Icons.add_outlined;
  static const IconData person = Icons.person_outlined;
  static const IconData check = Icons.check_circle_outlined;
  static const IconData cancel = Icons.cancel_outlined;
  static const IconData delete = Icons.delete_forever_rounded;
  static const IconData chats = Icons.chat_outlined;
  static const IconData moreHoriz = Icons.more_horiz_outlined;
  static const IconData notifications = Icons.notifications_none_outlined;
  static const IconData expand = Icons.keyboard_arrow_down_outlined;
  static const IconData jobs = Icons.add_business_outlined;
  static const IconData expandSided = Icons.keyboard_arrow_right_outlined;
  static const IconData phone = Icons.phone_android_outlined;
  static const IconData email = Icons.email_outlined;
  static const IconData location = Icons.location_pin;
  static const IconData branches = Icons.map_outlined;
  static const IconData payment = Icons.payment_outlined;
  static const IconData subscription = Icons.payments_outlined;
  static const IconData lang = Icons.language_outlined;
  static const IconData passworrd = Icons.key_outlined;
  static const IconData report = Icons.report_outlined;
  static const IconData theme = Icons.dark_mode_outlined;
  static const IconData terms = Icons.file_copy_outlined;
  static const IconData privacyPolicy = Icons.privacy_tip_outlined;
  static const IconData contract = Icons.file_copy_outlined;
  static const IconData help = Icons.help_outline;
  static const IconData visibility = Icons.visibility_outlined;
  static const IconData visibilityOff = Icons.visibility_off_outlined;
  static const IconData logout = Icons.exit_to_app_outlined;
  static const IconData home = Icons.home_outlined;
  static const IconData money = Icons.attach_money_outlined;
  static const IconData chat = Icons.message_outlined;
  static const IconData share = Icons.share_outlined;
  static const IconData search = Icons.search;
  static const IconData social = Icons.social_distance;
  static const IconData deactivate = Icons.person_remove_outlined;
  static const IconData refresh = Icons.refresh;

  /// Constants =================*
  static const double cornerRadius = 8.0;
  static const double hScaffoldPadding = 30.0;
  static const double iconSize = 20.0;
  static const double iconSize2 = 15.0;
  static double listPadding = 11;
  static const double btnRadius = 8.0;
  static double hPadding = 26;

  static double get height {
    return MediaQuery.of(Nav.navigator.currentContext!).size.height;
  }

  static double get width {
    return MediaQuery.of(Nav.navigator.currentContext!).size.width;
  }

  static Future<T?> showCustomDialog<T>(
      {required Widget child, EdgeInsets? padding}) {
    return showDialog<T>(
      context: Nav.navigator.currentContext!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: padding ?? EdgeInsets.zero,
          child: child,
        );
      },
    );
  }
  // bool isClient = KStorage.i.getRole=='client';


  static Future customAwosmeDialog<T>(
      {required String title, required Function() onApproveClick}) {
    return AwesomeDialog(
      context: Nav.navigator.currentContext!,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      body: Text(
        title,
        style: KTextStyle.of(Nav.navigator.currentContext!)
            .fifteen
            .copyWith(color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      btnOk: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: KButton(
          hieght: 42,
          title: "متابعه",
          onPressed: () {
            Get.back();
            onApproveClick();
          },
        ),
      ),
      btnOkOnPress: () {},
    ).show();
  }

  static Future<T?> showCustomBottomSheet<T>(Widget child,
      {bool? isScrollControlled,
      BuildContext? widgetContext,
      bool? isDismissible}) async {
    return showModalBottomSheet<T>(
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (widgetContext) => StatefulBuilder(
        builder: (context, setState) => DecoratedBox(
          decoration:
              KHelper.of(Nav.navigator.currentContext!).circledTopContainer,
          child: IntrinsicHeight(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: DecoratedBox(
                      decoration:
                          of(Nav.navigator.currentContext!).circledTopContainer,
                      child: const SizedBox(height: 8, width: 80)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    primary: true,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(widgetContext).viewInsets.bottom +
                                  20,
                          top: 30),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<T?> showCustomBottomSheetWTIntrinsic<T>(Widget child,
      {bool? isScrollControlled, BuildContext? widgetContext}) async {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (widgetContext) => DecoratedBox(
        decoration: of(Nav.navigator.currentContext!).circledTopContainer,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DecoratedBox(
                  decoration:
                      of(Nav.navigator.currentContext!).circledTopContainer,
                  child: const SizedBox(height: 8, width: 80)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(widgetContext).viewInsets.bottom + 20,
                    top: 30),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showSnackBar(String msg, {bool? isTop}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      '',
      '',
      snackPosition: isTop ?? false ? SnackPosition.TOP : SnackPosition.BOTTOM,
      barBlur: 10.0,
      backgroundColor: Colors.black.withOpacity(.6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      dismissDirection: DismissDirection.horizontal,
      colorText: Colors.white,
      messageText: Text(msg,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
    );
  }

  static String convertDateTimeToDate(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMEd(locale).format(dateTime);
  }
  static String apiDateFormatter(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static Future<AddressResult?> showMaps(BuildContext context,
      {Position? initLocation}) async {
    return await showGoogleMapLocationPicker(
      pinWidget: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      pinColor: Colors.blue,
      context: context,
      addressPlaceHolder: 'move_the_map',
      addressTitle: 'single_address',
      appBarTitle: Tr.get.choose_location,
      confirmButtonColor: KColors.mainColor,
      confirmButtonText: Tr.get.confirm_location,
      confirmButtonTextColor: Colors.white,
      country: "SA",
      apiKey: 'AIzaSyA4PY3RYKRShU07E-8rxSKnBMHY5UNUDjY',
      language: Tr.get.localeName,
      searchHint: Tr.get.search_for_location,
      initialLocation: LatLng(initLocation?.latitude ?? 33.0515261234,
          initLocation?.longitude ?? 31.1952702387),
    );
  }
}

class KHelperGetters {
  static KHelperGetters? _instance;

  KHelperGetters._internal() {
    _instance = this;
  }

  static KHelperGetters of(BuildContext context) {
    return _instance ?? KHelperGetters._internal();
  }

  BoxDecoration get shimmerBox {
    return BoxDecoration(
      color: KColors.elevatedBoxD.withOpacity(.2),
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
    );
  }

  BoxDecoration get circledTopContainer {
    return const BoxDecoration(
      color: KColors.whiteColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22), topRight: Radius.circular(22)),
    );
  }

  BoxDecoration get roundedContainer {
    return BoxDecoration(
      color: KColors.lightGreyColor,
      borderRadius: BorderRadius.circular(2),
    );
  }

  BoxDecoration get titledContainer {
    return BoxDecoration(
      color: KColors.whiteColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  BoxDecoration get shadowContainer {
    return BoxDecoration(
        color: KColors.whiteColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: KColors.blackColor.withOpacity(.2),
            blurRadius: 8,
          )
        ]);
  }

  BoxDecoration get dateContainer {
    return BoxDecoration(
        // color: KColors.lightGreyColor,

        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: KColors.lightBlueColor, width: 1));
  }

  Border get eBorder => Border.all(color: KColors.errorD, width: 1);

  BoxDecoration get msgBubble {
    return BoxDecoration(
      color: KColors.whiteColor,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        const BoxShadow(
            blurRadius: 2.0, offset: Offset(0, 2), color: KColors.shadowD),
      ],
    );
  }

  BoxDecoration get outLined {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: KColors.backgroundD, width: 1),
    );
  }

  BoxDecoration get textFieldDecoration {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
            color: const Color(0xff000000).withOpacity(.7), width: .2));
  }

  BoxDecoration get errorBorder {
    return BoxDecoration(
      color: KColors.errorD,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: KColors.errorD, width: 1),
    );
  }

  BoxDecoration get outlineCircle {
    return BoxDecoration(
      border: Border.all(color: KColors.accentColor, width: 1),
      shape: BoxShape.circle,
    );
  }

  BoxDecoration circle(Color color) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  BoxDecoration get badge {
    return const BoxDecoration(color: Colors.red, shape: BoxShape.circle);
  }

  DropdownMenuItem<T> dropdownItem<T>(
      {required String itemText, required T value}) {
    return DropdownMenuItem<T>(
      value: value,
      child: Center(
        child: Text(
          itemText,
          // style: KTextStyle.fifteen,
        ),
      ),
    );
  }

  MultiSelectorItem<T> itemView<T>(
      {required String itemText, required T value, Widget? icon}) {
    return MultiSelectorItem<T>(
      value: value,
      searchValue: itemText,
      icon: icon,
      child: Text(itemText,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            // color: Colors.white,
            fontSize: 13,
            fontFamily: 'URW-DIN-Arabic',
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

enum RoleType { client, agent }
class RoleTypeModel{
  String name;
  String id;
  RoleTypeModel({required this.name, required this.id});
}
List<RoleTypeModel>roleTypeList=[
  RoleTypeModel(name: 'client', id: '1'),
  RoleTypeModel(name: 'agent', id: '2'),
];
