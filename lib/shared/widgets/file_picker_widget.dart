import 'dart:io';

import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../theme/helper.dart';
import '../theme/text_theme.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget(
      {Key? key,
      this.validator,
      required this.onSelect, required this.title})
      : super(key: key);

  final String? Function(File?)? validator;
  final void Function(File?) onSelect;
  final String title;


  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File? _file;

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc','jpg','png'],
    );
    if (result != null) {
      for (var f in result.files) {
        _file = File(f.path ?? "");
      }
      widget.onSelect(_file);
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: FormField<File?>(
        validator: widget.validator,
        builder: (formState) {
          return Container(
            decoration: formState.hasError
                ? KHelper.of(context).titledContainer.copyWith(border: Border.all(color: KColors.redColor))
                : KHelper.of(context).titledContainer,
            child: RawMaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              onPressed: () async {
                await pickFile();
                formState
                  ..didChange(_file)
                  ..validate();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.upload_file_rounded, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      (_file?.path.split('/').last ??
                          widget.title ??
                          ""),
                      style: (_file?.path != null
                              ? KTextStyle.of(context).ten.copyWith(color: KColors.accentColor)
                              : KTextStyle.of(context).hint)
                          .copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
