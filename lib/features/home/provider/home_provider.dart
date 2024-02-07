import 'package:flutter/material.dart';

import '../../../services/firebase_services.dart';
import '../model/goal_model.dart';

class HomeProvider extends ChangeNotifier {
  GoalModel? goal;

  //Real-time data retrieval from CLoud Firestore
  void listenGoalData() {
    FirebaseServices().getGoalStream().listen((event) {
      goal = GoalModel.fromJson(event.data() as Map<String, dynamic>);
      notifyListeners(); //update when
    }, onError: (e) {
      debugPrint('Error fetching data from cloud Firestore');
    });
  }
}
