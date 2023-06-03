import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/model/user_model.dart';
import 'package:peaapp/shared/component/component.dart';

import 'chat_screen.dart';


class MessagesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit, PeaStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition:PeaCubit.get(context).users.length >0 ,
          builder: (context) =>Container(
            child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder:(context, index)=> buildCommentItem(context, PeaCubit.get(context).users[index]),
                separatorBuilder: (context, index)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyDivider(),
                ),
                itemCount:PeaCubit.get(context).users.length,
            ),
          ),
          fallback:(context) =>Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}
Widget buildCommentItem(context, UserModel model) =>InkWell(
  onTap: (){
    NavigateTo(context, ChatScreen(model));
  },
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsetsDirectional.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${model.name}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(

            width: 15,

          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              '${model.image}'
            ),
          ),
        ],
      ),
    ),
  ),
);
