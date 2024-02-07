import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../provider/home_provider.dart';

class SavingAmountDetails extends StatelessWidget {
  const SavingAmountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = context.watch<HomeProvider>().goal;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primeLight,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //need more savings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SavingText(title: AppStrings.needMoreSavings),
              SavingText(title: '\$${goal?.neededSavings ?? 0}')
            ],
          ),
          //monthly saving projection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SavingText(title: AppStrings.monthlySavingProjection),
              SavingText(title: '\$${goal?.neededSavingsMonthly ?? 0}'),
            ],
          )
        ],
      ),
    );
  }
}

class SavingText extends StatelessWidget {
  final String title;

  const SavingText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white));
  }
}
