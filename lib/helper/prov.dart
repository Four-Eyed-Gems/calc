import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper extends ChangeNotifier{


  //var str1 = "priyesh";
  //var str2 = "arpita";
  var totalYourAsciiValue = 0;
  var totalPartnerAsciiValue = 0;

  var final_percentage;

  helper(String str1,String str2){

    for (var i = 0; i < str1.length; i++) {
      var asciiValue = str1.codeUnitAt(i);
        totalYourAsciiValue += asciiValue;
    }

    for (var i = 0; i < str2.length; i++) {
      var asciiValue = str2.codeUnitAt(i);
      totalPartnerAsciiValue += asciiValue;
    }
    var yourname_percentage = calculates(totalYourAsciiValue);
    var partnername_percentage = calculates(totalPartnerAsciiValue);

    final_percentage = (yourname_percentage + partnername_percentage) / 2;
    print(final_percentage);

    notifyListeners();
  }
  calculates(total){
    var final_percentage;
    if(total.toString().length >= 3){
      var number = total.toString().substring(0, 2);
      if(number.length > 19){
        if(number.length > 98){
          final_percentage = 89;
        } else {
          final_percentage = number.length;
        }
      } else {
        var number = total.toString().substring(1, 3);
        if(number.length > 19){
          if(number.length > 98){
            final_percentage = 89;
          } else {
            final_percentage = number.length;
          }
        } else {
          if(number.length < 20){
            if(number.length < 5){
             // number = number.length + 10;
            }
            final_percentage = number.length * 4;
          } else if(number.length > 20 && number.length < 30){
            final_percentage = number.length * 3;
          } else if(number.length > 30 && number.length < 40){
            final_percentage = number.length * 2;
          } else if(number.length > 40 && number.length < 50){
            final_percentage = number.length + (0.5 * number.length);
          } else {
            final_percentage = number.length;
          }
          if(final_percentage > 98)
            final_percentage = 89;
        }}
      return final_percentage;
    } else if(total.toString().length < 3){
      var number = total;
      if(number.length > 19){
        if(number.length > 98){
          final_percentage = 89;
        } else {
          if(number.length < 20){
            if(number.length < 5){
              number.length = number.length + 10;
            }

            final_percentage = number.length * 4;
          } else if(number.length > 20 && number.length < 30){
            final_percentage = number.length * 3;
          } else if(number.length > 30 && number.length < 40){
            final_percentage = number.length * 2;
          } else if(number.length > 40 && number.length < 50){
            final_percentage = number.length + (0.5 * number.length);
          } else {
            final_percentage = number.length;
          }
          if(final_percentage > 98)
            final_percentage = 89;
        }
      }
      return final_percentage;
    } else {
      var number = total;
      if(number.length < 20){
        if(number.length < 5){
          number.length = number.length + 10;
        }
        final_percentage = number.length * 4;
      } else if(number.length > 20 && number.length < 30){
        final_percentage = number.length * 3;
      } else if(number.length > 30 && number.length < 40){
        final_percentage = number.length * 2;
      } else if(number.length > 40 && number.length < 50){
        final_percentage = number.length + (0.5 * number.length);
      } else {
        final_percentage = number.length;
      }
      if(final_percentage > 98)
        final_percentage = 89;

      return final_percentage;
    }
  }

}

flutterToast(String str){
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}