import 'dart:math';

import 'package:intl/intl.dart';

class RandomNumber {
  static String randomCardNumberGenerator() {
    return Random().nextInt(900000000).toString().replaceRange(0, 4, "xxxxx");
  }

  static String randomNumberGenerator() {
    var formatter = NumberFormat('###,###,000');
    var ran = Random().nextInt(900000000);
    return formatter.format(ran).toString();
  }
}
