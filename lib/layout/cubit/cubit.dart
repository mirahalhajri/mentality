import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/login/login_screen.dart';
import 'package:peaapp/model/chat_model.dart';
import 'package:peaapp/model/narc_model.dart';
import 'package:peaapp/model/sen_model.dart';
import 'package:peaapp/model/soc_model.dart';
import 'package:peaapp/model/user_model.dart';
import 'package:peaapp/module/messages/messages_screen.dart';
import 'package:peaapp/module/notification/notification_screen.dart';
import 'package:peaapp/module/profile/profile_screen.dart';
import 'package:peaapp/shared/component/component.dart';
import 'package:peaapp/shared/component/contasnt.dart';
import 'package:peaapp/shared/network/local/cach_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../module/home/home_screen.dart';




class PeaCubit extends Cubit<PeaStates> {
  PeaCubit() : super(PeaInitialState());

  static PeaCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget>screens = [
    HomeScreen(),
    NotificationScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];
  void openEmailURL()  {
    final Uri emailurl =Uri(
      scheme: 'mailto',
      path: 'issaqsandi@gmail.com',
      queryParameters: {
        'subject': '',
      },
    );
    emit(OpenEmailLoadingState());

    if(  canLaunch(emailurl.toString()) != null){
      launch(emailurl.toString());
      emit(OpenedEmailSuccess());
    }else{
      print('Could not launch $emailurl');
      emit(OpenedEmailError());
    }
  }

  void createNarcissisticScore({
    @required int score,
    @required String dateTime,

  }){
    emit(CreateNarcissisticScoreLoading());
    NarcModel model = NarcModel(
      uId: userModel.uId,
      score: score,
      dateTime: dateTime,

    );
    FirebaseFirestore.instance
    .collection('Scores')
    .doc(uId)
    .collection('Narcissistic')
    .add(model.toMap())
    .then((value) {
        emit(CreateNarcissisticScoreSuccess());
      })
          .catchError((error){

        emit(CreateNarcissisticScoreError());
      });

  }

  List<NarcModel> narcResult =[];

  void getNarcResult() {
    emit(GetNarcResultLoading());
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(uId)
        .collection('Narcissistic')
        .snapshots()
        .listen((event) {
      narcResult =[];
      event.docs.forEach((element) {
        narcResult.add(NarcModel.fromJson(element.data()));
        emit(GetNarcResultSuccess());
      });
    });
  }

  void createSocialScore({
    @required int score,
    @required String dateTime,

  }){
    emit(CreateSocialScoreLoading());
    SocModel model = SocModel(
      uId: userModel.uId,
      score: score,
      dateTime: dateTime,

    );
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(uId)
        .collection('Social')
        .add(model.toMap())
        .then((value) {
      emit(CreateSocialScoreSuccess());
    })
        .catchError((error){

      emit(CreateSocialScoreError());
    });

  }

  List<SocModel> socResult =[];
  void getSocResult() {
    emit(GetSenResultLoading());
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(uId)
        .collection('Social')
        .snapshots()
        .listen((event) {
      socResult =[];
      event.docs.forEach((element) {
        socResult.add(SocModel.fromJson(element.data()));
        emit(GetSenResultSuccess());
      });
    });
  }

  void createSensitiveScore({
    @required int score,
    @required String dateTime,

  }){
    emit(CreateSensitiveScoreLoading());
    SenModel model = SenModel(
      uId: userModel.uId,
      score: score,
      dateTime: dateTime,

    );
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(uId)
        .collection('Sensitive')
        .add(model.toMap())
        .then((value) {
      emit(CreateSensitiveScoreSuccess());
    })
        .catchError((error){

      emit(CreateSensitiveScoreError());
    });

  }

  List<SenModel> senResult =[];
  void getSenResult() {
    emit(GetSenResultLoading());
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(uId)
        .collection('Sensitive')
        .snapshots()
        .listen((event) {
      senResult =[];
      event.docs.forEach((element) {
        senResult.add(SenModel.fromJson(element.data()));
        emit(GetSenResultSuccess());
      });
    });
  }

  void signOut(context) {
    emit(SignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) async {
      CacheHelper.removeData(key: 'uId');
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) async {
          if (element.id == userModel.uId)
            element.reference.update({'uId': userModel.uId});
        });
      });
      NavigateAndFinish(context, LoginScreen());
      emit(SignOutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignOutErrorState());
    });
  }

  void changeBottomNav(int index) {
    currentIndex = index;
    if(index ==0){
      getUserData();
    }
    if(index ==2){
      getAllUsers();
    }
    if(index ==3){
      getUserData();
    }
    emit(ChangeBottomNavState());
  }


  UserModel userModel;
  void getUserData(){
    emit(GetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          userModel = UserModel.fromJson(value.data());
          emit(GetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetUserErrorState(error.toString()));
    }
        );
  }

  File profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(PeaProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(PeaProfileImagePickedErrorState());
    }
  }


  void uploadProfileImage({
    @required String name,
    @required String email,
    @required String phone,
  }){
    emit(PeaUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(HaragUploadProfileImageSuccessState());
        print(value);
        updateUserData(name: name, email: email, phone: phone,
            image: value
        );

      }).catchError((error){
        emit(PeaUploadProfileImageErrorState());
      });
    })
        .catchError((error){
      emit(PeaUploadProfileImageErrorState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
    String image,
  }){
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: userModel.uId,
      image:image?? userModel.image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    })
        .catchError((error){
      print(error.toString());
      emit(PeaUserUpdateErrorState());
    });
  }

  List<UserModel> users =[];

  void getAllUsers(){
    if(users.length ==0)
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['uId'] != userModel.uId)
            users.add(UserModel.fromJson(element.data()));
        });
        emit(GetAllUsersSuccessState());
      })
          .catchError((error){
        emit(GetAllUsersErrorState(error.toString()));
        print(error.toString());
      });
  }

  void sendMessage({
    @required String receiverId,
    @required String dataTime,
    @required String text,
  }){
    ChatModel model = ChatModel(
        receiverId: receiverId,
        senderId: userModel.uId,
        dateTime: dataTime,
        text: text
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    })
        .catchError((error){
      emit(SendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    })
        .catchError((error){
      emit(SendMessageErrorState());
    });

  }

  List<ChatModel > messages=[];

  void getMessages({
    @required String receiverId,
  }){
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages=[];
      event.docs.forEach((element) {
        messages.add(ChatModel.fromJson(element.data()));
      });
    });
  }

}
