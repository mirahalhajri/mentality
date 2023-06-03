import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/home_layout_screen.dart';
import 'package:peaapp/login/cubit/state.dart';
import 'package:peaapp/register/register_screen.dart';
import 'package:peaapp/shared/component/component.dart';
import 'package:peaapp/shared/component/contasnt.dart';
import 'package:peaapp/shared/network/local/cach_helper.dart';

import 'cubit/cubit.dart';


class LoginScreen extends StatelessWidget {
  FocusNode myFocusNode = new FocusNode();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return  BlocProvider(
      create: (BuildContext context)=> PeaLoginCubit(),
      child: BlocConsumer<PeaLoginCubit, PeaLoginStates>(
        listener: (context, state){
          if(state is PeaLoginErrorState){
            ShowToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is PeaLoginSuccessState){
            PeaCubit.get(context).getUserData();
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId)
                .then((value) {
                  uId= state.uId;
              NavigateAndFinish(context, HomeLayoutScreen());
            });
          }
          },
        builder: (context, state){
          return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Login',style: TextStyle(fontSize: 40),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const  Image(image: AssetImage("assets/images/men.png",),
                        height: 180,
                        width: 180,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          // ignore: missing_return
                          validator: (String value) {

                            if (value.isEmpty)
                              return 'Please Inter Your Email';
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            labelText: 'Email Address',
                            prefixIcon: Icon(Icons.email_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(

                          cursorColor: Color(0xfffbd7d7),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Enter Your Password';
                          },
                          onFieldSubmitted: (value) {
                            if(_formKey.currentState.validate()){
                              PeaLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          obscureText:PeaLoginCubit.get(context).isPassword,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            labelText: 'Password',

                            prefixIcon: Icon(Icons.lock_outline,
                              // color: Color(0xff009E8F),
                            ),

                            suffixIcon: IconButton(
                              onPressed: (){
                                PeaLoginCubit.get(context).changePasswordVisibility();
                              },
                              icon: Icon(PeaLoginCubit.get(context).suffix),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50,
                            left: 50
                        ),
                        child:  ConditionalBuilder(
                          condition: state is! PeaLoginLoadingState,
                          builder: (context) =>
                              defaultButton(
                                radius: 16,
                                function: ()  async {
                                  if(_formKey.currentState.validate() ){
                                    PeaLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'Login',
                                isUppercase: true,
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t Have An Account ?',
                            style: TextStyle(
                              fontSize: 25,

                            ),

                          ),
                          MaterialButton(onPressed: (){
                            NavigateTo(context, RegisterScreen());
                          },
                            child: Text(
                                'Register Now',
                              style: TextStyle(
                                  color: Colors.blue,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
