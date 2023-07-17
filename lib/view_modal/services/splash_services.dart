import 'dart:html';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmpattern/view_modal/user_view_model.dart';

import '../../modal/usermodel.dart';
import '../../utils/routes/routesname.dart';

class SplashServices{
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async{
      if(value.token.toString() == 'null' || value.token.toString() == ''){
      await  Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.loginPage);
      }else{
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.homePage);
      }

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}