import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmpattern/modal/usermodel.dart';
import 'package:mvvmpattern/repository/auth_repository.dart';
import 'package:mvvmpattern/utils/routes/routesname.dart';
import 'package:mvvmpattern/utils/utils.dart';
import 'package:mvvmpattern/view_modal/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModal with ChangeNotifier{
  final _myrepo = AuthRepository();
  bool _loginloading = false;
  bool _signinLoading = false;
  bool get signinLoading => _signinLoading;
  bool get loading => _loginloading;

  setLoading(bool value){
    _loginloading = value;
    notifyListeners();
  }
  signInLoading(bool value){
    _signinLoading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data,BuildContext context) async{
    setLoading(true);
    _myrepo.loginApi(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString()
      ));
     Utils.errorMessageFlush('Login Successfully'.toString(), context);
     Navigator.pushNamed(context, RoutesName.homePage);
     if(kDebugMode){
       print(value.toString());
     }
    }).onError((error, stackTrace){
      setLoading(false);
         if (kDebugMode) {
           Utils.errorMessageFlush(error.toString(), context,);
           print(error.toString());
         }
    });

  }
  Future<void> registerApi(dynamic data,BuildContext context) async{
    signInLoading(true);
    _myrepo.registerApi(data).then((value){
      signInLoading(false);
      Navigator.pushNamed(context, RoutesName.homePage);
      Utils.errorMessageFlush('Register Successfully'.toString(), context);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      signInLoading(false);
      if (kDebugMode) {
        Utils.errorMessageFlush(error.toString(), context,);
        print(error.toString());
      }
    });

  }
}