
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/login/cubit/state.dart';
import 'package:peaapp/shared/component/contasnt.dart';


class PeaLoginCubit extends Cubit<PeaLoginStates>{
  PeaLoginCubit() : super(PeaLoginInitialState());
  static PeaLoginCubit get(context) =>BlocProvider.of(context);
  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(PeaLoginLoadingState());
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
  ).then((value) {
    print(value.user.email);
    print(value.user.uid);
    uId = value.user.uid;
    emit(PeaLoginSuccessState(value.user.uid));
  }).catchError((error){
    emit(PeaLoginErrorState(error.toString()));
  });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword =!isPassword;
    suffix =isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
