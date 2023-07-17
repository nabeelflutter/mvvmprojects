import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
class Utils{
  static toastMesssage(String message){
    Fluttertoast.showToast(msg: message,
    gravity: ToastGravity.BOTTOM,

    );
  }
  static void errorMessageFlush(String message , BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
    duration: const Duration(seconds: 2),
        message: message,
      titleColor: Colors.green  ,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(10),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      borderRadius: BorderRadius.circular(10),
      icon: const Icon(Icons.error,color: Colors.green,),
      flushbarPosition: FlushbarPosition.TOP,
      positionOffset: 20,
    )..show(context));
  }
  static snakbar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}