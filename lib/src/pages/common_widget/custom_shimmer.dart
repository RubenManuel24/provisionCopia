import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;
  final bool isRounded;
  final BorderRadius? borderRadius;
  final BoxShape shapeRectaguler;

  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.isRounded = false,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    this.shapeRectaguler = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey.shade400,
        highlightColor: highlightColor ?? Colors.grey.shade500,
        child: Container(
          decoration: BoxDecoration(
            shape: shapeRectaguler,
            color: Colors.grey,
            borderRadius: shapeRectaguler == BoxShape.circle
                ? null
                : borderRadius ?? BorderRadius.circular(isRounded ? height / 2 : 0),
          ),
        ),
      ),
    );
  }
}
