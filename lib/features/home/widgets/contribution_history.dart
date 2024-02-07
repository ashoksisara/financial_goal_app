import 'package:flutter/material.dart';

import '../../../constants/app_strings.dart';
import 'contribution_list.dart';
import 'contribution_progress.dart';

class ContributionHistory extends StatelessWidget {
  const ContributionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.transparent),
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        expand: true,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.white),
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(40),
              children: [
                Text(
                  AppStrings.contributions,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                //linear progress of contribution item
                const ContributionProgress(),
                const SizedBox(height: 20),
                //contribution list with amount and date
                const ContributionList()
              ],
            ),
          );
        },
      ),
    );
  }
}
