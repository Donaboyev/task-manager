import 'package:intl/intl.dart';

class BaseFunctions {
  static getCreatedDate(int createdDate) {
    DateTime parseDate = DateTime.fromMillisecondsSinceEpoch(createdDate);
    var newFormat = DateFormat('dd MMM yyyy, hh:mm a');
    return newFormat.format(parseDate);
  }
}
