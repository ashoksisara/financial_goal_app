import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../provider/home_provider.dart';
import '../widgets/contribution_history.dart';
import '../widgets/goal_amount.dart';
import '../widgets/goal_progress.dart';
import '../widgets/saving_amount_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //start listening to changes from firestore
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.listenGoalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final goal = provider.goal;
    return Scaffold(
      body: goal != null
          ? Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          //goal title
                          Text(
                            goal.title ?? 'Goal',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          //circular progress bar
                          const GoalProgress(),
                          //goal amount and completion date
                          const GoalAmount().animate().fade(),
                          const SizedBox(height: 20),
                          //remaining amount & projection
                          const SavingAmountDetails().animate().fade(delay: 300.ms),
                        ],
                      ),
                    ),
                  ],
                ),
                //contribution list
                const ContributionHistory(),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
              color: AppColors.white,
            )),
    );
  }
}
