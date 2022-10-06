import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/controller/provider.dart';
import 'package:tic_tac_toe/pages/Game.dart';
import 'package:tic_tac_toe/pages/home_page.dart';
import 'package:tic_tac_toe/pages/names.dart';


void main()=> runApp(
DevicePreview(
  enabled: false,
  builder: (context) {
    return     ChangeNotifierProvider(

      create: (_)=>MyProvider(),

      child:const TicTacToe() ,);
  }
),
    );

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
              theme: ThemeData(
                  scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
              debugShowCheckedModeBanner: false,
              home: MyHomePage(),
              routes: {
                Game.id: (_) => Game(),
                MyHomePage.id: (_) => const MyHomePage(),
                Names.id: (_) => Names(),

        }
    );
  }
}




