import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/controller/provider.dart';
import 'package:provider/provider.dart';

import '../logic/on_returning.dart';
import '../logic/play.dart';

class Game extends StatelessWidget {
const Game({Key? key}) : super(key: key);

static String id = 'game';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    final secondPlayer= ModalRoute.of(context)!.settings.arguments ;
    return OnReturn(
      child: Scaffold(
        body: SafeArea(
          child: MediaQuery.of(context).orientation==Orientation.portrait ?Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: firstBloc(context, provider),),
              gameShape(context, provider, secondPlayer,2),
              Expanded(child: secondBloc(context, provider),)
            ],
          ): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    firstBloc(context, provider),
                    secondBloc(context, provider),
                  ],
                ),
              ),
              gameShape(context, provider, secondPlayer,1),
            ],
          )
        ),
      ),
    );
  }

  Padding secondBloc(BuildContext context, MyProvider provider,) {
    return Padding(
              padding:  EdgeInsets.symmetric(
               vertical: MediaQuery.of(context).size.height*0.05),
              child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    provider.result !='' ?      Row(
                children: [
                  Text(
                    " ${provider.result}",
                    style: xStyle,
                  ),
                  provider.result !="It's Draw!"? const Text(
                    " is the winner",
                    style: textStyle,
                  ) : const SizedBox(),
                ],
              ):  const SizedBox(),

                    IconButton(
    iconSize:50,
                      icon: const CircleAvatar(

                        child: Icon(Icons.restart_alt),
                      ),
                      onPressed: ()=>Provider.of<MyProvider>(context,listen: false).restartGame(),
                    )
                  ]),
            );
  }

  Expanded gameShape(BuildContext context, MyProvider provider, Object? secondPlayer,flex) {
    return Expanded(
      flex: flex,
      child: Container(
       // padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05) ,
        margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.05) ,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius:const BorderRadius.all(Radius.circular(20))
        ),
        child: Center(
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 3,
            children: List.generate(
              9,
              (index) => InkWell(
                onTap:provider.gameOver ? null :
                 ()=>Provider.of<MyProvider>(context,listen: false).onTap(index,secondPlayer),
                child: Container(
                  decoration: BoxDecoration(
                    border: index == 0 ||
                            index == 1 ||
                            index == 3 ||
                            index == 4
                        ? const Border(
                            right:
                                BorderSide(width: 2, color: customColor),
                            bottom:
                                BorderSide(width: 2, color: customColor),
                          )
                        : index == 2 || index == 5
                            ? const Border(
                                bottom: BorderSide(
                                    width: 2, color: customColor),
                              )
                            : index != 8
                                ? const Border(
                                    right: BorderSide(
                                        width: 2, color: customColor),
                                  )
                                : null,
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    Play.playerX.contains(index)
                        ? 'X'
                        : Play.playerO.contains(index)
                            ? 'O'
                            : '',
                    style: Play.playerX.contains(index) ? xStyle : oStyle,
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column firstBloc(BuildContext context, MyProvider provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                  height:MediaQuery.of(context).size.height*0.07,
            ),
            (provider.gameOver==true || provider.square==9) ?
                 Text("Game over ",style: oStyle,):RichText(
                   text: TextSpan(
                  style: textStyle,
                 children: [
                   const TextSpan(text: "It's "),
                   TextSpan(text:provider.recentPlayer,style: xStyle),
                   const TextSpan(text:" turn" )
                 ]
            ),
            ),
               ],
             );
  }

}
