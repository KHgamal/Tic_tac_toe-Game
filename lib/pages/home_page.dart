import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/names.dart';
import 'package:tic_tac_toe/widgets/button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
static String id='MyHomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child:SingleChildScrollView(
              child: Center(
                child: MediaQuery.of(context).orientation==Orientation.portrait? 
                Column(
                  children : [
                    //Text
                    firstBloc(context),
                    // 2 players button
                    secondBloc(context)
                  ]
                )
                    :
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       firstBloc(context),
                       secondBloc(context)
                     ],
                   )
              ),
            )
      ),
    );
  }

  Padding firstBloc(context) {
    return Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.15),
                    child: RichText(
                      text: const  TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.indigo,
                        ),
                        children:  [
                        TextSpan(text: '  T', style: TextStyle( color: Colors.red)),
                        TextSpan(text: 'ic \n T '),
                        TextSpan(text: 'a',style: TextStyle( color: Colors.red)),
                        TextSpan(text: ' c \n T o '),
                        TextSpan(text: 'e',style: TextStyle( color: Colors.red)),
                        ]
                      ),
                        ),
                  );
  }

  Column secondBloc(BuildContext context) {
    return Column(
                    children: [
                      customButton(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.person),
                          Text('vs'),
                          Icon(Icons.person),
                        ],
                      ),context,''),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.07,
                      ),
                      // single Player button
                      customButton(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.person),
                          Text('vs'),
                          Icon(Icons.computer),
                        ],
                      ), context,'pc')
                    ],
                  );
  } customButton(label,context,arguments){
   return CustomButton(
        backgroundColor: Colors.indigo,
        width: 180,
        height: 50,
        marginNum:0,
        onTap: ()=>Navigator.pushNamed(context, Names.id,arguments: arguments),
        label:label);
  }
}
