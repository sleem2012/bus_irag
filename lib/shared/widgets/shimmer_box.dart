import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/helper.dart';
import 'package:get/get.dart';

class ShimmerBox extends StatelessWidget {
  final double? height, width;

  const ShimmerBox({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: KHelper.of(context).shimmerBox,
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ShimmerBox(
              width: Get.width,
              height: Get.height * .2,
            ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
        separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
        itemCount: 6);
  }
}
