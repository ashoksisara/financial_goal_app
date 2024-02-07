import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../provider/home_provider.dart';

class GoalProgress extends StatelessWidget {
  const GoalProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = context.watch<HomeProvider>().goal;
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          customWidths: CustomSliderWidths(
              trackWidth: 6, progressBarWidth: 6),
          customColors: CustomSliderColors(
              trackColor: AppColors.white.withOpacity(0.5),
              progressBarColor: AppColors.white,
              hideShadow: true),
          startAngle: 120,
          angleRange: 300,
          size: 200.0,
          animDurationMultiplier: 3,
          animationEnabled: true),
      min: 0,
      max: (goal?.goalAmount ?? 1).toDouble(),
      initialValue: (goal?.contributionAmount ?? 0).toDouble(),
      innerWidget: (percentage) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 90, color: AppColors.white),
          //contribution amount
          Text(
            '\$${goal?.contributionAmount}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.white,fontWeight: FontWeight.bold),
          ),
          Text(
            AppStrings.youSaved,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
