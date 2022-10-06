import 'package:flutter/material.dart';

import '../logic/play.dart';
import '../pages/names.dart';

class MyProvider extends ChangeNotifier {

  String recentPlayer=Names.userName.text;
  //A player wins but the squares are not all filled
  bool gameOver=false;
  // the squares are all filled no matter there is a winner or it's a draw
  int square=0;
  String result='';
  Play play=Play();

  void restartGame() {
    Play.playerX=[];
    Play.playerO=[];
    recentPlayer=Names.userName.text;
    gameOver=false;
    square=0;
    result='';
notifyListeners();
  }

  void onTap(int index,secondPlayer) async{
    if ((!Play.playerX.contains(index))&&
        (!Play.playerO.contains(index))) {
      play.playGame(index, recentPlayer);
      updateState(secondPlayer);
      if (secondPlayer == 'pc' && !gameOver && square != 9) {
        await play.autoPlay(recentPlayer);
        updateState(secondPlayer);
      }
    }
    notifyListeners();
  }

  void updateState(secondPlayer){
     if(recentPlayer==Names.userName.text){
        recentPlayer= Names.user.text;
      }
     else{
       recentPlayer= Names.userName.text;
     }
    square++;
    String winnerPlayer = play.checkWinner();
    if (winnerPlayer != '') {
      gameOver = true;
      result = winnerPlayer;
    } else if (!gameOver && square == 9) {
      result = 'It\'s Draw!';
    }
  }
}