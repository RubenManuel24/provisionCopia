import 'package:flutter/material.dart';

import 'custom_shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  double height;
  double width;
   CustomShimmerList({
    super.key,
     this.width = double.infinity,
     this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      height: height,
      width: width,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
