import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper extends ChangeNotifier {
  //var str1 = "priyesh";
  //var str2 = "shirley";

  var finalPercentage = 0.0;

  helper(String name, String partnerName) {
    finalPercentage = (getPercentage(name) + getPercentage(partnerName)) / 2;

    notifyListeners();
  }

  getPercentage(name) {
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
