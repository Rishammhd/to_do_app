import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {
  static void showmessage({
    String message = "done",
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundcolor = Colors.purple,
    var fontsize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundcolor,
      textColor: Colors.white,
      fontSize: fontsize,
    );
  }
}
