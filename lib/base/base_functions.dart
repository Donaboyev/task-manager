import 'package:intl/intl.dart';

class BaseFunctions {
  static getCreatedDate(int createdDate) {
    DateTime parseDate = DateTime.fromMillisecondsSinceEpoch(createdDate);
    return DateFormat('dd MMM yyyy, hh:mm a').format(parseDate);
  }
}
