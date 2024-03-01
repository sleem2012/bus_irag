import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/banner/banner_bloc.dart';
import '../../../logic/banner/banner_state.dart';
import '../../../shared/widgets/flux_image.dart';
import '../../../shared/widgets/shimmer_box.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        final bannerImages = state.whenOrNull(
          success: (model) => model.data,
        );
        return state.when(
            initial: () => const SizedBox(),
            loading: () => const ShimmerBox(
                  width: double.infinity,
                  height: 140,
                ),
            success: (model) {
              return CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: kDebugMode ? false : true,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: .8,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeCenterPage: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    aspectRatio: 2.1,
                  ),
                  items: bannerImages
                      ?.map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () async {},
                              child: FluxImage(
                                useExtendedImage: true,
                                imageUrl: e.image ?? '',
                              ),
                            ),
                          ))
                      .toList());
            },
            error: (e) => const SizedBox());
      },
    );
  }
}
