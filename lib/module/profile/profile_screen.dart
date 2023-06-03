
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/module/books/books.dart';
import 'package:peaapp/module/result/my_result.dart';
import 'package:peaapp/shared/component/component.dart';

import 'edit_profile_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit, PeaStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = PeaCubit.get(context).userModel;
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 30
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                  Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          '${userModel.image ?? 'https://as2.ftcdn.net/v2/jpg/00/64/67/27/1000_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg'}',
                        ),
                      )
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10),
                        width: double.infinity,
                        height: 80,
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyDivider(),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${userModel.name }',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10),
                        width: double.infinity,
                        height: 80,
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyDivider(),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${userModel.email}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 10),
                        width: double.infinity,
                        height: 80,
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyDivider(),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${userModel.phone}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(16),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                   NavigateTo(context, ResultScreen());
                                },
                                child: Text(
                                  'Test Result',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(16),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                   NavigateTo(context, EditProfileScreen());
                                },
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(16),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                  NavigateTo(context, SuggestedBooks());
                                },
                                child: Text(
                                  'Suggested Books',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(16),
                                color: Colors.blue,
                              ),

                              child: MaterialButton(
                                onPressed: (){
                                  PeaCubit.get(context).signOut(context);
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
