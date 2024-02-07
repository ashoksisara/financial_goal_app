import 'package:flutter/material.dart';

import '../../../services/firebase_services.dart';
import '../model/goal_model.dart';

class HomeProvider extends ChangeNotifier {
  GoalModel? goal;

  void listenGoalData() {
    FirebaseServices().getGoalStream('goal1').listen((event) {
      debugPrint('goal stream data => ${event.data()}');
      goal = GoalModel.fromJson(event.data() as Map<String, dynamic>);
      debugPrint('goal toJson => ${goal!.toJson()}');
      notifyListeners();
    });
  }
}
