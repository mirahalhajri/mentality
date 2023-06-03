import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/model/user_model.dart';
import 'package:peaapp/register/cubit/state.dart';


class PeaRegisterCubit extends Cubit<PeaRegisterStates>{
  PeaRegisterCubit() : super(PeaRegisterInitialState());
  static PeaRegisterCubit get(context) =>BlocProvider.of(context);
  void userStudentRegister({
    @required String email,
    @required String name,
    @required String phone,
    @required String password,
  }) {
    emit(PeaRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreate(email: email,
          uId: value.user.uid,
          name: name,
          phone: phone,
          password: password,

      );

    }).catchError((error){
      print(error.toString());
      emit(PeaRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String phone,
    @required String uId,
    @required String password,
}){
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      image: 'https://firebasestorage.googleapis.com/v0/b/pea-app-d41db.appspot.com/o/users%2Fimage_picker414033463680009230.jpg?alt=media&token=71c8dc0a-fc86-45e7-83c3-9e7878c1f051 ',
      uId: uId,
      password:password ,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()).then((value) {
          emit(PeaCreateUserSuccessState(model.uId));
    }).catchError((error){
      print(error.toString());
      emit(PeaCreateUserErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordRegisterVisibility(){
    isPassword =!isPassword;
    suffix =isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordPeaRegisterVisibilityState());
  }



  void confirmPasswordRegisterVisibility(){
    isPassword =!isPassword;
    suffix =isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ConfirmPasswordPeaRegisterVisibilityState());
  }
}
