// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mvvmpattern/utils/routes/routesname.dart';
import 'package:mvvmpattern/view_modal/view_modal.dart';
import 'package:provider/provider.dart';
import '../res/components/custombutton.dart';
import '../res/components/customtextformfield.dart';

import '../utils/validation/validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> obsText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final authViewModal = Provider.of<AuthViewModal>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                validator: (value){
                 return FieldValidator.validateEmail(value.toString());
                },
                controller: _emailController,
                hint: 'Email',
                preIcon: const Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
              ),
              ValueListenableBuilder(
                builder: (context, value, child) => CustomTextFormField(
                  validator: (value){
                    return  FieldValidator.validatePassword(value.toString());
                  },
                  controller: _passwordController,
                  hint: 'Password',
                  preIcon: const Icon(Icons.lock),
                  textInputType: TextInputType.visiblePassword,
                  obsText: obsText.value,
                  character: '*',
                  sufixIcon: InkWell(
                      onTap: () {
                        obsText.value = !obsText.value;
                      },
                      child: Icon(obsText.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility)),
                ),
                valueListenable: obsText,
              ),
              CustomButton(
                loading: authViewModal.loading,
                width: width * .40,
                height: height * .07 ,
                title: 'Login',
                press: () {
                  if(_formKey.currentState!.validate()){
                    Map data = {
                      'email': 'eve.holt@reqres.in',
                      'password' : 'cityslicka'
                    };
                    authViewModal.loginApi(data,context);
                    
                  }
                  else{
                    print('Failed');
                  }
                },
              ),
              SizedBox(height: height*.05,),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.signupPage);
                  },
                  child: const Text("Don't have an account? Sign Up"))
            ],
          ),
        ));
  }
}
