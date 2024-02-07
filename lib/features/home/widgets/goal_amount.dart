import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_strings.dart';
import '../provider/home_provider.dart';

class GoalAmount extends StatelessWidget {
  const GoalAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = context.watch<HomeProvider>().goal;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.goal,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              //completion date
              Text(
                'by ${goal?.completionDateString}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white.withOpacity(0.5), fontSize: 12),
              )
            ],
          ),
          //goal amount
          Text(
            '\$${goal?.goalAmount ?? 1}',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
