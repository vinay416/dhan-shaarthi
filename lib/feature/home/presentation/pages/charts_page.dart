import 'package:dhan_saarthi/feature/fund_detail/presentation/pages/fund_detail_page.dart';
import 'package:flutter/material.dart';

import '../widgets/home_tab_bar.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: FundDetailPage()),
        SizedBox(height: KHomeTabHeight),
      ],
    );
  }
}
