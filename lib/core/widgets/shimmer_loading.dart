import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    required this.boxShape,
    required this.size,
    this.borderRadius,
  });
  final BoxShape boxShape;
  final Size size;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: k262626Color,
      highlightColor: k454545Color,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        shape: boxShape,
        borderRadius: borderRadius,
        color: kBlackColor,
      ),
    );
  }
}
