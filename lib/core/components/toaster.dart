import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster {

  // Toaster Error with Background Color Material Red
  static error(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 7,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        webBgColor: "#FF1744",
        webShowClose: true,
        fontSize: 16.0,
        webPosition: 'left');
  }

  // Toaster Norma with Background Color Material Black
  static normal(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.BOTTOM,
        webShowClose: true,
        fontSize: 16.0,
        webPosition: 'left'
    );
  }
}
