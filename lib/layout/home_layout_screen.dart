import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';



class HomeLayoutScreen extends StatelessWidget {
  int currentState =0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit,PeaStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit =PeaCubit.get(context);
        return  Scaffold(
           backgroundColor: Colors.white,

          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  cubit.screens[cubit.currentIndex],
                ],
              ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),
                label: 'Notification',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.message_outlined),
                label: 'Messages',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person_pin),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
