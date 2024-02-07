import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference goals = FirebaseFirestore.instance.collection('goals');

  Stream<DocumentSnapshot> getGoalStream(String goalId) {
    return goals.doc(goalId).snapshots();
  }
}
