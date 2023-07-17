

import 'package:flutter/material.dart';
import 'package:mvvmpattern/utils/routes/routesname.dart';
import 'package:mvvmpattern/view/home_page.dart';
import 'package:mvvmpattern/view/login_page.dart';
import 'package:mvvmpattern/view/saplash_view.dart';
import 'package:mvvmpattern/view/signup_page.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.homePage : return MaterialPageRoute(builder: (context) => const HomePage(),);
      case RoutesName.loginPage : return MaterialPageRoute(builder: (context) =>  const LoginPage(),);
      case RoutesName.signupPage : return MaterialPageRoute(builder: (context) => const SignUpPage(),);
      case RoutesName.splash : return MaterialPageRoute(builder: (context) => const SplashView(),);
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('No route define'),),),);
    }
  }
}