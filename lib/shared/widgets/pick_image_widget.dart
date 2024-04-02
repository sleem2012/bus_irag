import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../enums.dart';
import '../extensions.dart';
import '../theme/colors.dart';
import '../theme/helper.dart';
import '../theme/text_theme.dart';
import 'image_widget.dart';

class PickProImageWidget extends StatefulWidget {
  const PickProImageWidget({
    Key? key,
    required this.onSelect,
    this.initialImg,
    this.maxWidth,
    this.maxHeight,
    this.radius,
    this.isAvatar = false,
    this.validator,
    this.aspRat = const [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
    this.hint,
    this.decoration,required this.title,
  }) : super(key: key);

  final String? initialImg;
  final String title;
  final Function(File? file) onSelect;
  final double? maxWidth;
  final double? maxHeight;
  final double? radius;
  final bool isAvatar;
  final String? hint;
  final BoxDecoration? decoration;
  final List<CropAspectRatioPreset> aspRat;

  final String? Function(File?)? validator;

  @override
  State<PickProImageWidget> createState() => _PickProImageWidgetState();
}

class _PickProImageWidgetState extends State<PickProImageWidget> {
  File? file;

  GeneralState state = GeneralState.initial;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = BorderRadius.circular(20);
    return FormField<File?>(
      validator: widget.validator,
      builder: (formState) {
        return Container(
          // height: widget.radius ?? 70,
          // width: widget.radius ?? 70,
          decoration: formState.hasError
              ? KHelper.of(context).titledContainer.copyWith(border: Border.all(color: KColors.redColor))
              : KHelper.of(context).titledContainer,
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            elevation: 0,
            onPressed: () => pick(formState, widget.aspRat),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: (state == GeneralState.initial && widget.initialImg != null)
                  ? KImageWidget(imageUrl: widget.initialImg!, fit: BoxFit.cover)
                  : (state == GeneralState.success && file != null)
                      ? Image.file(file!, fit: BoxFit.cover)
                      : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.upload_file_rounded, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      (file?.path.split('/').last ??
                          widget.title ??
                          ""),
                      style: (file?.path != null
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
          ),
        );
      },
    );
  }

  void pick(FormFieldState<File?> formState, List<CropAspectRatioPreset> aspRat) async {
    setState(() => state = GeneralState.loading);
    try {
      file = await ImageHelper.i.pickImage();
      if (file != null) {
        final cropped = await ImageHelper.i.cropImage(image: file, aspRat: aspRat);
        file = cropped;
        widget.onSelect(cropped);
        formState
          ..didChange(cropped)
          ..validate();
      }
      setState(() => state = GeneralState.success);
    } catch (e) {
      setState(() => state = GeneralState.error);
    }
  }
}

class ImageHelper {
  final ImagePicker imagePicker = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();

  static ImageHelper? _instance;
  ImageHelper._internal() {
    _instance = this;
  }
  static ImageHelper get i {
    return _instance ?? ImageHelper._internal();
  }

  Future<File?> pickImage({double? maxHeight, double? maxWidth}) async {
    File? image;
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    } catch (e) {
      return null;
    }
    return image;
  }

  Future<List<File>> pickMultiImage({double? maxHeight, double? maxWidth}) async {
    List<File> images = [];

    try {
      final pickedFile = await imagePicker.pickMultiImage(maxHeight: maxHeight, maxWidth: maxWidth);
      for (var img in pickedFile) {
        images.add(File(img.path));
      }
    } catch (e) {
      return images;
    }
    return images;
  }

  Future<File?> cropImage({required File? image, bool isAvatar = false, required List<CropAspectRatioPreset> aspRat}) async {
    if (image != null) {
      final img = await imageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: isAvatar ? CropStyle.circle : CropStyle.rectangle,
        aspectRatioPresets: aspRat,
        compressQuality: 100,
      );
      image = File(img!.path);
    }
    return image;
  }
}
