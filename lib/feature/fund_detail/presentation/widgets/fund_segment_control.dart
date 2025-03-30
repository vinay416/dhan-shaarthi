import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class FundSegmentControl extends StatefulWidget {
  const FundSegmentControl({super.key});

  @override
  State<FundSegmentControl> createState() => _FundSegmentControlState();
}

class _FundSegmentControlState extends State<FundSegmentControl> {
  int _currentSelection = 5;
  final Map<int, Widget> _children = {
    0: Text('1M'),
    1: Text('3M'),
    2: Text('6M'),
    3: Text('1Y'),
    4: Text('3Y'),
    5: Text('MAX'),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: k454545Color, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(4),
      child: SizedBox(
        width: double.infinity,
        child: MaterialSegmentedControl(
          horizontalPadding: EdgeInsets.all(0),
          children: _children,
          selectionIndex: _currentSelection,
          borderColor: Colors.transparent,
          selectedColor: kBlueColor,
          unselectedColor: kBlackColor,
          unselectedTextStyle: semiBoldTextStyle.copyWith(
            color: k6D6D6DColor,
            fontSize: 12,
          ),
          selectedTextStyle: mediumTextStyle.copyWith(
            color: kWhiteColor,
            fontSize: 12,
          ),
          borderWidth: 0.5,
          borderRadius: 8.0,
          onSegmentTapped: (index) {
            setState(() {
              _currentSelection = index;
            });
          },
        ),
      ),
    );
  }
}
