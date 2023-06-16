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

  List quotes = [];
  getQuotes(){
    quotes = [];
    quotes.add("Love is not about how many days, months, or years you've been together. It's all about how much you love each other every day.");
    quotes.add("To love and be loved is to feel the sun from both sides.");
    quotes.add("The greatest happiness of life is the conviction that we are loved; loved for ourselves, or rather, loved in spite of ourselves.");
    quotes.add("Love is not finding someone to live with; it's finding someone you can't live without.");
    quotes.add("Love is composed of a single soul inhabiting two bodies.");
    quotes.add("Being deeply loved by someone gives you strength while loving someone deeply gives you courage.");
    quotes.add("In all the world, there is no heart for me like yours. In all the world, there is no love for you like mine.");
    quotes.add("Love is the answer, and you know that for sure; Love is a flower, you've got to let it grow.");
    quotes.add("Love is like the wind, you can't see it but you can feel it.");

    notifyListeners();
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
