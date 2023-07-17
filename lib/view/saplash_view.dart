// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../view_modal/services/splash_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Splash Page',style: Theme.of(context).textTheme.headline5,),)
    );
  }
}
