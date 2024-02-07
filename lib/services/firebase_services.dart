import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static const String goalCollection = 'goals';
  static const String goalDocId = 'goal1';

  CollectionReference goals =
      FirebaseFirestore.instance.collection(goalCollection);

  Stream<DocumentSnapshot> getGoalStream() {
    return goals.doc(goalDocId).snapshots();
  }
}
