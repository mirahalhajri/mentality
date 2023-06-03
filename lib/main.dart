import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/home_layout_screen.dart';
import 'package:peaapp/login/login_screen.dart';
import 'package:peaapp/shared/bloc_observer.dart';
import 'package:peaapp/shared/component/contasnt.dart';
import 'package:peaapp/shared/network/local/cach_helper.dart';
import 'package:peaapp/splash.dart';
import 'package:peaapp/splash_screen.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/state.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((event) {
    print('success');
  }).onError((error){
    print('error');
  });
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');

  if(uId != null){
    print(uId);
    print('------------------------');
    widget = HomeLayoutScreen();
  }else{
    print(uId);
    print('========================');
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({@required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=>PeaCubit()..getUserData()..getNarcResult()..getAllUsers()
        ..getSenResult()..getSocResult(),
        child: BlocConsumer<PeaCubit, PeaStates>(
          listener: (context, state){},
          builder: (context, state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                colorScheme: ColorScheme.fromSwatch(
                    backgroundColor: Colors.indigo
                  // Color(0xff009E8F),
                ),
                iconTheme: IconThemeData(
                    color: Colors.blue
                ),

                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.blue
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  color: Colors.white,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor:Color(0xfffed4d5),
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                ),


              ),
              home: startWidget,
            );
          },
        )
    );
  }
}

