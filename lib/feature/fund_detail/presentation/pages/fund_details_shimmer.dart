import 'package:dhan_saarthi/core/widgets/custom_app_bar.dart';
import 'package:dhan_saarthi/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class FundDetailsShimmer extends StatelessWidget {
  const FundDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(onPressed: null, icon: buildRect(size: Size.square(35))),
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.63),
            buildRect(size: Size(200, 70)),
            SizedBox(height: 24),
            buildRect(size: Size(double.infinity, 64)),
            SizedBox(height: 24),
            buildRect(size: Size(double.infinity, 307)),
            SizedBox(height: 46),
            buildRect(size: Size(double.infinity, 307)),
          ],
        ),
      ),
    );
  }

  ShimmerLoading buildRect({required Size size}) {
    return ShimmerLoading(
      boxShape: BoxShape.rectangle,
      size: size,
      borderRadius: BorderRadius.circular(5),
    );
  }
}
