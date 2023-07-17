import 'package:flutter/material.dart';
import 'package:mvvmpattern/utils/routes/routes.dart';
import 'package:mvvmpattern/utils/routes/routesname.dart';
import 'package:mvvmpattern/view_modal/user_view_model.dart';
import 'package:mvvmpattern/view_modal/view_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthViewModal(),),
      ChangeNotifierProvider(create: (context) => UserViewModel(),)
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM',
      theme: ThemeData(
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoutes,
    ),);
  }
}

