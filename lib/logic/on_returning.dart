import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/controller/provider.dart';
import 'package:tic_tac_toe/pages/names.dart';
//returning from game page
class OnReturn extends StatelessWidget {
  const OnReturn({Key? key, required this.child}) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: ()async{

        Names.user.clear();
        Names.userName.clear();
        Provider.of<MyProvider>(context,listen: false).restartGame();
        return true ;
      },
    );
  }
}
