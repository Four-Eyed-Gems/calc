import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper extends ChangeNotifier {
  //var str1 = "priyesh";
  //var str2 = "shirley";

  var final_percentage;

  helper(String name, String partnerName) {
    final_percentage = (calculates(name) + calculates(partnerName)) / 2;

    notifyListeners();
  }

  calculates(name) {
    num totalAsciiValue = 0;
    for (var i = 0; i < name.length; i++) {
      totalAsciiValue += name.codeUnitAt(i);
    }

    if (totalAsciiValue.toString().length >= 2) {
      return int.parse(totalAsciiValue.toString().substring(0, 1));
    } else {
      return totalAsciiValue;
    }
  }
}

flutterToast(String str) {
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
