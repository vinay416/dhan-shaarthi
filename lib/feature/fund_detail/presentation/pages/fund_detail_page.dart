import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_graph/fund_graph_bloc.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/pages/fund_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/enitiies/fund_details_entity.dart';
import '../bloc/fund_detail_bloc.dart';
import '../widgets/fund_buttons.dart';
import '../widgets/fund_invest_details.dart';
import '../widgets/fund_performace.dart';
import '../widgets/fund_segment_control.dart';
import '../widgets/fund_top_details.dart';
import '../widgets/graph_one_line.dart';
import '../widgets/graph_two_line.dart';
import 'fund_details_error_page.dart';

class FundDetailPage extends StatefulWidget {
  const FundDetailPage({super.key});

  @override
  State<FundDetailPage> createState() => _FundDetailPageState();
}

class _FundDetailPageState extends State<FundDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<FundDetailBloc>().add(InitFundDetail());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundDetailBloc, FundDetailState>(
      builder: (context, state) {
        if (state is FundDetailsLoading) {
          return FundDetailsShimmer();
        }
        if (state is FundDetailsLoaded) {
          return buildLoaded(state.fundDetails);
        }
        return FundDetailsErrorPage();
      },
    );
  }

  Widget buildLoaded(FundDetailsEntity details) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SizedBox.square(
              dimension: 35,
              child: Image.asset(kBookmarkIcon),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          buildScreen(details),
          Positioned(bottom: 0, child: SafeArea(child: FundButtons())),
        ],
      ),
    );
  }

  Widget buildScreen(FundDetailsEntity details) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FundTopDetails(fundName: details.fundNav.name),
            SizedBox(height: 24),
            FundInvestDetails(),
            SizedBox(height: 24),
            buildGraph(details),
            SizedBox(height: 12),
            FundSegmentControl(),
            SizedBox(height: 46),
            FundPerformace(performaceData: details.fundPerformance),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildGraph(FundDetailsEntity details) {
    return BlocBuilder<FundGraphBloc, FundGraphState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: Durations.long2,
          child:
              (state is NavGraph)
                  ? GraphOneLine(navDetails: details.fundNav)
                  : GraphTwoLine(fundInvestDetails: details.fundInvestment),
        );
      },
    );
  }
}
