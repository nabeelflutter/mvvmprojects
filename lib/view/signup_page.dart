import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/custombutton.dart';
import '../res/components/customtextformfield.dart';
import '../utils/routes/routesname.dart';
import '../utils/validation/validation.dart';
import '../view_modal/view_modal.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> obsText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
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
                preIcon: Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
              ),
              ValueListenableBuilder(
                builder: (context, value, child) => CustomTextFormField(
                  validator: (value){
                    return  FieldValidator.validatePassword(value.toString());
                  },
                  controller: _passwordController,
                  hint: 'Password',
                  preIcon: Icon(Icons.lock),
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
                height: height * .07,
                title: 'Sign Up',
                press: () {
                  if(_formKey.currentState!.validate()){
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password' : _passwordController.text.toString()
                    };
                    authViewModal.registerApi(data,context);
                    print('Api hit');
                  }
                  else{
                    print('Failed');
                  }
                },
              ),
              SizedBox(height: height*.05,),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.loginPage);
                  },
                  child: Text("Already have an account? Sign In"))
            ],
          ),
        ));
  }
}

