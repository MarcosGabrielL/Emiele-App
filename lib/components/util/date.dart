import 'package:intl/intl.dart';

class DataUtil {
  String formattedTime = DataUtil.getFormattedTime();

  static String getFormattedTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('h:mm a').format(now);
    return formattedTime;
  }
}

