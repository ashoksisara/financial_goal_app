import 'package:financial_goal_app/utils/date_formatter.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class GoalModel {
  num? goalAmount;
  num? contributionAmount;
  String? title;
  DateTime? completionDate;
  List<ContributionModel>? contributionList;

  GoalModel(
      {this.title,
      this.contributionList,
      this.completionDate,
      this.contributionAmount,
      this.goalAmount});

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    int i = -1;
    return GoalModel(
        title: json['title'],
        completionDate:
            DateFormatter.dateTimeFromTimeStamp(json['completionDate']),
        contributionAmount: json['contributionAmount'],
        contributionList: List.from(json['contributionList'].map((x) {
          i++;
          return ContributionModel.fromJson(x, i);
        })),
        goalAmount: json['goalAmount']);
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "completionDate": completionDate,
        "contributionList": contributionList,
        "goalAmount": goalAmount,
        "contributionAmount": contributionAmount,
      };

  String get completionDateString =>
      DateFormatter.monthYear(completionDate ?? DateTime.now());

  num get neededSavings => (goalAmount ?? 0) - (contributionAmount ?? 0);

  num _neededSavingsMonthly() {
    return ((goalAmount ?? 0) - (contributionAmount ?? 0)) ~/
        DateFormatter.getTotalMonthRemaining(completionDate ?? DateTime.now());
  }

  num get neededSavingsMonthly => _neededSavingsMonthly();
}

class ContributionModel {
  String? title;
  num? amount;
  Color? color;
  DateTime? dateTime;

  ContributionModel({this.title, this.color, this.amount, this.dateTime});

  factory ContributionModel.fromJson(Map<String, dynamic> json, int index) =>
      ContributionModel(
          title: json['title'],
          dateTime: DateFormatter.dateTimeFromTimeStamp(json['date']),
          amount: json['amount'],
          color: AppColors.contributionColorList[
              index % AppColors.contributionColorList.length]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
        "date": dateTime,
      };

  String get contributionDate =>
      DateFormatter.dayDateMonth(dateTime ?? DateTime.now());
}
