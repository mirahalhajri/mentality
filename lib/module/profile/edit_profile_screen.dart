import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peaapp/layout/cubit/cubit.dart';
import 'package:peaapp/layout/cubit/state.dart';


class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeaCubit, PeaStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = PeaCubit.get(context).userModel;
        var profileImage =  PeaCubit.get(context).profileImage;
        nameController.text = userModel.name;
        emailController.text = userModel.email;
        phoneController.text = userModel.phone;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    if(
                    state is PeaUserUpdateLoadingState
                    )
                      LinearProgressIndicator(),
                    CircleAvatar(
                      radius: 76,
                      backgroundImage:profileImage == null ? NetworkImage('${userModel.image}')
                          : FileImage(profileImage),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        PeaCubit.get(context).getProfileImage();
                      },
                      child: Text(
                        'Upload Image ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:25
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if(PeaCubit.get(context).profileImage !=null)
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(16),
                              color: Colors.blue,
                            ),
                            child: TextButton(onPressed: (){
                              PeaCubit.get(context).uploadProfileImage(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text
                              );
                            },
                                child: Text(
                                  'Update Image',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // LinearProgressIndicator(),
                        ],
                      ),
                    if(PeaCubit.get(context).profileImage !=null)
                      SizedBox(
                        height: 10,
                      ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Enter Your Name';
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.drive_file_rename_outline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Enter Your Email Address';
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.name,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Enter Your Phone Number';
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(16),
                        color: Colors.blue,
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          PeaCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
