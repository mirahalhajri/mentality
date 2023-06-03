import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';
import 'package:peaapp/model/chat_model.dart';
import 'package:peaapp/model/user_model.dart';


class ChatScreen extends StatelessWidget {
  UserModel model;
  ChatScreen(
      this.model
      );
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      PeaCubit.get(context).getMessages(receiverId: model.uId);
      return BlocConsumer<PeaCubit, PeaStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(
                  'Messages'
              ),
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context , index){
                          var message = PeaCubit.get(context).messages[index];
                          if(PeaCubit.get(context).userModel.uId == message.senderId)
                          return  buildMyMessageItem(message);
                        return  buildMessageItem(message);
                        },
                        separatorBuilder: (context, index)=>SizedBox(
                          height: 5,
                        ),
                        itemCount: PeaCubit.get(context).messages.length,
                    ),
                  ),

                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child:
                            TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Write Your Messages Here ...',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            color: Color(0xff004080),
                            child: MaterialButton(
                              onPressed: (){
                                PeaCubit.get(context).sendMessage(
                                  receiverId: model.uId,
                                  dataTime: DateTime.now().toString(),
                                  text: messageController.text,
                                );
                              },
                              minWidth: 1,
                              child: Icon(
                                Icons.send,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    },

    );
  }
}

Widget buildMyMessageItem(ChatModel model)=> Align(
  alignment: AlignmentDirectional.centerStart,
  child: Container(
    decoration: BoxDecoration(
      color: Color(0xff004080),
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(10),
        topStart: Radius.circular(10),
        bottomEnd: Radius.circular(10),
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    child: Column(
      children: [
        Text(
          model.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ],
    ),
  ),
);
Widget buildMessageItem(ChatModel model)=>  Align(
  alignment: AlignmentDirectional.centerEnd,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(10),
        topStart: Radius.circular(10),
        bottomStart: Radius.circular(10),
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    child: Text(
      model.text,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20
      ),
    ),
  ),
);
