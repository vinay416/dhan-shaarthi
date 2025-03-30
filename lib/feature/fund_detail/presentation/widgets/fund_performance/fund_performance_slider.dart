import 'package:dhan_saarthi/core/format_currency.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FundPerformanceSlider extends StatefulWidget {
  const FundPerformanceSlider({super.key});

  @override
  State<FundPerformanceSlider> createState() => _FundPerformanceSliderState();
}

class _FundPerformanceSliderState extends State<FundPerformanceSlider> {
  late double sliderValue;
  // ignore: non_constant_identifier_names
  final double MIN_VALUE = 100000;
  // ignore: non_constant_identifier_names
  final double MAX_VALUE = 1000000;

  @override
  void initState() {
    sliderValue = MIN_VALUE;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: Slider(
            padding: EdgeInsets.symmetric(horizontal: 10),
            min: MIN_VALUE,
            max: MAX_VALUE,
            value: sliderValue,
            onChanged: (value) {
              sliderValue = value;
              setState(() {});
            },
            thumbColor: kBlueColor,
            activeColor: kWhiteColor,
            inactiveColor: kBlueColor.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSliderText(sliderValue),
              buildSliderText(MAX_VALUE),
            ],
          ),
        ),
      ],
    );
  }

  Text buildSliderText(double value) {
    return Text(
      FormatCurrency.convertToLacs(value, intval: true),
      style: lightTextStyle.copyWith(fontSize: 12),
    );
  }
}
