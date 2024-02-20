import 'package:flutter/material.dart';
import '../../logic/theme/theme_cubit.dart';
import '../localization/trans.dart';
import '../theme/helper.dart';
import 'drop_down.dart';

class LangDropDown extends StatelessWidget {
  final double? size;

  const LangDropDown({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> languages = ['ar', "en"];
    return KDropdownBtn(

        title: Tr.get.localeName,
        onChanged: (p0) {
          ThemeBloc.of(context).updateLocale(p0);
        },
        items: languages
            .map((e) => KHelper.of(context).itemView(itemText: e, value: e))
            .toList());

  }
}
