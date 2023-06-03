import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/model/narc_model.dart';
import 'package:peaapp/shared/component/component.dart';



class NarcResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit, PeaStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                      condition: PeaCubit.get(context).narcResult.length >0,
                      builder:(context)=>  SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index)=>buildEventItem (context, PeaCubit.get(context).narcResult[index]),
                                separatorBuilder:(context, index)=> MyDivider(),
                                itemCount: PeaCubit.get(context).narcResult.length
                            ),
                          ],
                        ),
                      ) ,
                      fallback: (context)=>  Center(
                        child: Text('No Result Yet !',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ) ;

  }

  Widget buildEventItem (context, NarcModel model)=> Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${model.score}' ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${model.dateTime}' ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    ],
  );
}
