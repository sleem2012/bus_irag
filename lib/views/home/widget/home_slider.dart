import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/flux_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key, required this.bannerImages});

  final List<String> bannerImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: kDebugMode ? false : true,
          pauseAutoPlayOnTouch: true,
          viewportFraction: 1,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeCenterPage: false,
          autoPlayInterval: const Duration(seconds: 5),
          aspectRatio: 2.1,
        ),
        items: bannerImages
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () async {
                    },
                    child: FluxImage(
                      useExtendedImage: true,
                      imageUrl: e,
                    ),
                  ),
                ))
            .toList());
  }
}
