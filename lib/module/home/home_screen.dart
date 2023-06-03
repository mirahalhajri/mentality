import 'package:flutter/material.dart';
import 'package:peaapp/module/narcissistic/narcissisticMain.dart';
import 'package:peaapp/module/personality/personality.dart';
import 'package:peaapp/module/sensitive/sensitiveMain.dart';
import 'package:peaapp/module/social/socialMain.dart';
import 'package:peaapp/shared/component/component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text('Choose theme',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: Color(0xffffe9a0),
            ),
            child: MaterialButton(
              onPressed: () {
                NavigateTo(context, NarcissisticMain());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage('assets/images/nar.png'),
                    height: 100,
                    width: 80,
                  ),
                  Text('Narcissistic',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: Color(0xfffed4d5),
            ),
            width: 150,
            child: MaterialButton(
              onPressed: () {
                NavigateTo(context, SensitiveMain());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage('assets/images/sen.png'),
                    height: 100,
                    width: 80,
                  ),
                  Text('Sensitive',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: Color(0xffffe9a0),
            ),
            width: 150,
            child: MaterialButton(
              onPressed: () {
                NavigateTo(context, SocialMain());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage('assets/images/soc.png'),
                    height: 100,
                    width: 80,
                  ),
                  Text('Social',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: Color(0xfffed4d5),
            ),
            child: MaterialButton(
              onPressed: () {
                NavigateTo(context, NowPersonality());
              },
              child: Text(
                'Now The Personality',
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
