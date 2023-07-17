import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/usermodel.dart';
class UserViewModel extends ChangeNotifier{

  Future<bool> saveUser(UserModel user) async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   sp.setString('token',user.token.toString());
   notifyListeners();
    return true;
  }
  Future<UserModel> getUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
     String? token = sp.getString('token');
    return UserModel(token: token.toString() );
  }
  Future<bool> remove() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
     sp.remove('token');
     return true;
  }
}