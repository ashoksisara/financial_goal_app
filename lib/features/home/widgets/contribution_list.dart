import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../model/goal_model.dart';
import '../provider/home_provider.dart';

class ContributionList extends StatelessWidget {
  const ContributionList({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = context.watch<HomeProvider>().goal;
    final contributionList = [];
    contributionList.addAll(goal?.contributionList ?? []);
    contributionList
        .sort((a, b) => b.amount!.toInt().compareTo(a.amount!.toInt()));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...contributionList
            .map((e) => ContributionText(contribution: e))
            .toList()
      ].animate(interval: 400.ms).fade(duration: 300.ms),
    );
  }
}

class ContributionText extends StatelessWidget {
  final ContributionModel contribution;

  const ContributionText({super.key, required this.contribution});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: contribution.color),
            width: 8,
            height: 8,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contribution.title ?? 'title'),
              Text(contribution.contributionDate,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black.withOpacity(0.5))),
            ],
          ),
          const Spacer(),
          Text('\$${contribution.amount?.toInt()}')
        ],
      ),
    );
  }
}
