import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class FundPerfomanceControl extends StatefulWidget {
  const FundPerfomanceControl({super.key});

  @override
  State<FundPerfomanceControl> createState() => _FundPerfomanceControlState();
}

class _FundPerfomanceControlState extends State<FundPerfomanceControl> {
  int _currentSelection = 0;
  final Map<int, Widget> _children = {0: Text('1-Time'), 1: Text('Montly SIP')};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: k454545Color, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 114,
        child: MaterialSegmentedControl(
          horizontalPadding: EdgeInsets.all(3.6),
          children: _children,
          selectionIndex: _currentSelection,
          borderColor: Colors.transparent,
          selectedColor: kBlueColor,
          unselectedColor: Colors.transparent,
          unselectedTextStyle: semiBoldTextStyle.copyWith(
            color: k6D6D6DColor,
            fontSize: 10,
          ),
          selectedTextStyle: mediumTextStyle.copyWith(
            color: kWhiteColor,
            fontSize: 10,
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
