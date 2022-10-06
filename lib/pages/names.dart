import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/controller/provider.dart';
import 'package:tic_tac_toe/pages/Game.dart';
import 'package:tic_tac_toe/widgets/button.dart';

import '../widgets/snack_bar.dart';
import '../widgets/text_field.dart';
class Names extends StatelessWidget {
    Names({Key? key}) : super(key: key);
  static String id='names';
  static TextEditingController userName=TextEditingController();
   static TextEditingController user=TextEditingController();
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final  secondPlayer= ModalRoute.of(context)!.settings.arguments ;

    return Scaffold(
      body: SafeArea( child:
      Form(
        key:formKey ,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter player Name", style: style,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
              ),
              CustomTextField(
                prefixIcon: const Icon(Icons.close, color: Colors.red, size: 30,) ,
                user: userName, label: " Enter 1'st player name",),
              secondPlayer=='pc'? customButton(context, 'pc'):

                  Column(
                   children: [
                     CustomTextField(
    prefixIcon: const Icon(Icons.circle_outlined, color: Colors.blue, size: 30,) ,
    user: user, label: " Enter 2'nd player name",),
                     customButton(context,'')
                   ],

               ),
            ],
          ),
        ),
      ) ),

    );
  }

  CustomButton customButton(BuildContext context,arguments) {
    return CustomButton(marginNum: MediaQuery.of(context).size.height*0.05, onTap:()=>onPressed(context,arguments) ,
          label:const Text("Start Game"), width: 150, height: 50, backgroundColor: Colors.red,);
  }
  void onPressed(context, arguments){
    if(formKey.currentState!.validate()) {
      // If the form is valid
      if (Names.userName.text!=Names.user.text) {
        Provider.of<MyProvider>(context,listen: false).recentPlayer=userName.text;
        Navigator.pushNamed(context, Game.id,arguments:arguments);
      }
      else{
        snackBar(context, const Text("fields can't have the same value "));
      }
    }
  }



  }


