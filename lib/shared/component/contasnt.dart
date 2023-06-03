
import 'package:flutter/material.dart';
import 'package:peaapp/login/login_screen.dart';
import 'package:peaapp/shared/network/local/cach_helper.dart';


import 'component.dart';

void SignOut(BuildContext context){
  CacheHelper.removeData(key: 'uId').then((value) {
    NavigateAndFinish(context, LoginScreen());
  });
}

String uId = '';