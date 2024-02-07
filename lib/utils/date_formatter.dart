import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static DateTime dateTimeFromTimeStamp(Timestamp timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(
        timestamp.millisecondsSinceEpoch);
  }

  // Fri, 10 Sep 2024
  static String dayDateMonth(DateTime dateTime) {
    return DateFormat('E, dd MMM yyyy').format(dateTime);
  }

  //jan 2030
  static String monthYear(DateTime dateTime) {
    return DateFormat('MMM yyyy').format(dateTime);
  }

  //get total month difference
  static num getTotalMonthDifference(DateTime completionDate) {
    //current time
    final now = DateTime.now();
    //first get month difference from year than from months
    int totalMonths = (completionDate.year - now.year) * 12 +
        (completionDate.month - now.month);
    return totalMonths;
  }
}
