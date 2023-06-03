import 'package:flutter/material.dart';
import 'package:peaapp/module/result/narc/narc_result.dart';
import 'package:peaapp/module/result/sen/nen_result.dart';
import 'package:peaapp/module/result/soc/soc_result.dart';
import 'package:peaapp/shared/component/component.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Color(0xffffe9a0),
                ),
                child: MaterialButton(onPressed: (){
                  NavigateTo(context, NarcResultScreen());
                },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image(image: AssetImage(
                          'assets/images/nar.png'
                      ),
                        height: 100,
                        width: 80,
                      ),
                      Text(
                          'Narcissistic',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),
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
                  color:Color(0xfffed4d5),
                ),
                width: 150,
                child: MaterialButton(onPressed: (){
                  NavigateTo(context, SenResultScreen());
                },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image(image: AssetImage(
                          'assets/images/sen.png'
                      ),
                        height: 100,
                        width: 80,
                      ),
                      Text(
                          'Sensitive',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),
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
                child: MaterialButton(onPressed: (){
                  NavigateTo(context, SocResultScreen());
                },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image(image: AssetImage(
                          'assets/images/soc.png'
                      ),
                        height: 100,
                        width: 80,
                      ),
                      Text(
                          'Social',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

      ),
    );
  }
}
