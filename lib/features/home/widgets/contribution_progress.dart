import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../provider/home_provider.dart';

class ContributionProgress extends StatelessWidget {
  const ContributionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = context.watch<HomeProvider>().goal;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final totalContribution = goal?.contributionAmount ?? 0;
    final contributionList = [];
    contributionList.addAll(goal?.contributionList ?? []);
    contributionList
        .sort((a, b) => a.amount!.toInt().compareTo(b.amount!.toInt()));

    int i = -1;
    return Stack(
      children: <Widget>[
        if (contributionList.isNotEmpty)
          ...contributionList.map((e) {
            final expectedWidth = (e.amount ?? 1) / totalContribution;
            i++;
            return ProgressWidget(
                color: e.color ?? AppColors.grey,
                width: i == 0 ? width : width * (1 - expectedWidth));
          }).toList()
      ],
    );
  }
}

class ProgressWidget extends StatelessWidget {
  final Color color;
  final double width;

  const ProgressWidget({super.key, required this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 10,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
