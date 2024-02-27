import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/theme/helper.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:bus_iraq2/shared/widgets/date_picker.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatefulWidget {
  const DateContainer({
    super.key,
    this.firstTextColor,
    this.secondTextColor,
    this.firstContainerColor,
    required this.title, required this.onPressed,
  });

  final Color? firstTextColor, secondTextColor, firstContainerColor;
  final String title;
  final ValueChanged<String> onPressed;

  @override
  State<DateContainer> createState() => _DateContainerState();
}

String? selectedDate = KHelper.apiDateFormatter(DateTime.now());

class _DateContainerState extends State<DateContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await SfDatePicker.showDateTimePickerHG(
          context,
          type: KDateTimePickerType.dateGregorian,
          start: DateTime.now(),
          initial: DateTime.now(),
          end: DateTime(2030),
        );
        if (date == null) return;
        dateController.text = date;
        setState(() {});
        selectedDate = date;
        widget.onPressed(date);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: KHelper.of(context).dateContainer,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: widget.firstContainerColor ?? KColors.mainColor,
                  child: Text(widget.title,
                      style: KTextStyle.of(context)
                          .ten
                          .copyWith(color: widget.firstTextColor)),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: KColors.whiteColor,
                  child: Text(selectedDate ?? '',
                      style: KTextStyle.of(context).ten.copyWith(
                          color: widget.secondTextColor ?? KColors.mainColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
