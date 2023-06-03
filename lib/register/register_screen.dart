import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/home_layout_screen.dart';
import 'package:peaapp/login/cubit/cubit.dart';
import 'package:peaapp/login/login_screen.dart';
import 'package:peaapp/register/cubit/cubit.dart';
import 'package:peaapp/register/cubit/state.dart';
import 'package:peaapp/shared/component/component.dart';
import 'package:peaapp/shared/component/contasnt.dart';
import 'package:peaapp/shared/network/local/cach_helper.dart';


class RegisterScreen extends StatelessWidget {
  FocusNode myFocusNode = new FocusNode();
  var _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (BuildContext context)=> PeaRegisterCubit(),
      child: BlocConsumer<PeaRegisterCubit, PeaRegisterStates>(
        listener: (context, state){
          if(state is PeaCreateUserSuccessState){

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
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Register',
                style: TextStyle(fontSize: 40),
              ),
              leading:IconButton(onPressed: (){
                Navigator.pop(context, LoginScreen());
              },
                icon: Icon(Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const  Image(image: AssetImage("assets/images/men.png",),
                          height: 180,
                          width: 180,
                        ),
                        TextFormField(
                          textDirection: TextDirection.rtl,
                          cursorColor: Color(0xfffbd7d7),
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Enter Your Name';
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            labelText: 'Enter Your Name',
                            prefixIcon: Icon(Icons.drive_file_rename_outline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: Color(0xfffbd7d7),
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
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          textDirection: TextDirection.rtl,
                          cursorColor: Color(0xfffbd7d7),
                          controller: phoneController,
                          keyboardType: TextInputType.name,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Enter Your Phone Number';
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(

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
                          obscureText:PeaRegisterCubit.get(context).isPassword,

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
                                PeaRegisterCubit.get(context).changePasswordRegisterVisibility();
                              },
                              icon: Icon(PeaRegisterCubit.get(context).suffix),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        ConditionalBuilder(
                          condition: state is! PeaRegisterLoadingState,
                          builder: (context) =>
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  child: defaultButton(
                                    radius: 16,
                                    function: ()  async {
                                      if(_formKey.currentState.validate() ){
                                        PeaRegisterCubit.get(context).userStudentRegister(
                                          email: emailController.text,
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    text: 'Register',
                                    isUppercase: true,
                                    backgroundColor: Colors.teal,
                                  ),
                                ),
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
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
