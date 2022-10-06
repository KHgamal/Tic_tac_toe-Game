import 'dart:math';

import '../pages/names.dart';

class Play{
static List playerX=[];
static List playerO=[];

void playGame(int index , String activePlayer){
  if(activePlayer==Names.userName.text){
    playerX.add(index);
  }
  else{
    playerO.add(index);
  }
}
String checkWinner(){
  if (playerX.containsAll(0, 1, 2) ||
      playerX.containsAll(3, 4, 5) ||
      playerX.containsAll(6, 7, 8) ||
      playerX.containsAll(0, 3, 6) ||
      playerX.containsAll(1, 4, 7) ||
      playerX.containsAll(2, 5, 8) ||
      playerX.containsAll(0, 4, 8) ||
      playerX.containsAll(2, 4, 6))
    return 'X';
  else if (playerO.containsAll(0, 1, 2) ||
      playerO.containsAll(3, 4, 5) ||
      playerO.containsAll(6, 7, 8) ||
      playerO.containsAll(0, 3, 6) ||
      playerO.containsAll(1, 4, 7) ||
      playerO.containsAll(2, 5, 8) ||
      playerO.containsAll(0, 4, 8) ||
      playerO.containsAll(2, 4, 6))
   return 'O' ;
  else
   return'';
}
Future<void> autoPlay(activePlayer)async{
  List emptyCells=[];
  int index=0;
  for(var i=0; i<9;i++) {
    if (!Play.playerX.contains(i) && !Play.playerO.contains(i)) {
      emptyCells.add(i);
    }
  }
  // start - center
  if (playerO.containsAll(0, 1) && emptyCells.contains(2))
    index = 2;
  else if (playerO.containsAll(3, 4) && emptyCells.contains(5))
    index = 5;
  else if (playerO.containsAll(6, 7) && emptyCells.contains(8))
    index = 8;
  else if (playerO.containsAll(0, 3) && emptyCells.contains(6))
    index = 6;
  else if (playerO.containsAll(1, 4) && emptyCells.contains(7))
    index = 7;
  else if (playerO.containsAll(2, 5) && emptyCells.contains(8))
    index = 8;
  else if (playerO.containsAll(0, 4) && emptyCells.contains(8))
    index = 8;
  else if (playerO.containsAll(2, 4) && emptyCells.contains(6))
    index = 6;

  // start - end
  else if (playerO.containsAll(0, 2) && emptyCells.contains(1))
    index = 1;
  else if (playerO.containsAll(3, 5) && emptyCells.contains(4))
    index = 4;
  else if (playerO.containsAll(6, 8) && emptyCells.contains(7))
    index = 7;
  else if (playerO.containsAll(0, 6) && emptyCells.contains(3))
    index = 3;
  else if (playerO.containsAll(1, 7) && emptyCells.contains(4))
    index = 4;
  else if (playerO.containsAll(2, 8) && emptyCells.contains(5))
    index = 5;
  else if (playerO.containsAll(0, 8) && emptyCells.contains(4))
    index = 4;
  else if (playerO.containsAll(2, 6) && emptyCells.contains(4))
    index = 4;

// center - end
  else if (playerO.containsAll(1, 2) && emptyCells.contains(0))
    index = 0;
  else if (playerO.containsAll(4, 5) && emptyCells.contains(3))
    index = 3;
  else if (playerO.containsAll(7, 8) && emptyCells.contains(6))
    index = 6;
  else if (playerO.containsAll(3, 6) && emptyCells.contains(0))
    index = 0;
  else if (playerO.containsAll(4, 7) && emptyCells.contains(1))
    index = 1;
  else if (playerO.containsAll(5, 8) && emptyCells.contains(2))
    index = 2;
  else if (playerO.containsAll(4, 8) && emptyCells.contains(0))
    index = 0;
  else if (playerO.containsAll(4, 6) && emptyCells.contains(2))
    index = 2;

// start - center
  else if (playerX.containsAll(0, 1) && emptyCells.contains(2))
    index = 2;
  else if (playerX.containsAll(3, 4) && emptyCells.contains(5))
    index = 5;
  else if (playerX.containsAll(6, 7) && emptyCells.contains(8))
    index = 8;
  else if (playerX.containsAll(0, 3) && emptyCells.contains(6))
    index = 6;
  else if (playerX.containsAll(1, 4) && emptyCells.contains(7))
    index = 7;
  else if (playerX.containsAll(2, 5) && emptyCells.contains(8))
    index = 8;
  else if (playerX.containsAll(0, 4) && emptyCells.contains(8))
    index = 8;
  else if (playerX.containsAll(2, 4) && emptyCells.contains(6))
    index = 6;

// start - end
  else if (playerX.containsAll(0, 2) && emptyCells.contains(1))
    index = 1;
  else if (playerX.containsAll(3, 5) && emptyCells.contains(4))
    index = 4;
  else if (playerX.containsAll(6, 8) && emptyCells.contains(7))
    index = 7;
  else if (playerX.containsAll(0, 6) && emptyCells.contains(3))
    index = 3;
  else if (playerX.containsAll(1, 7) && emptyCells.contains(4))
    index = 4;
  else if (playerX.containsAll(2, 8) && emptyCells.contains(5))
    index = 5;
  else if (playerX.containsAll(0, 8) && emptyCells.contains(4))
    index = 4;
  else if (playerX.containsAll(2, 6) && emptyCells.contains(4))
    index = 4;

// center - end
  else if (playerX.containsAll(1, 2) && emptyCells.contains(0))index = 0;
  else if (playerX.containsAll(4, 5) && emptyCells.contains(3))
    index = 3;
  else if (playerX.containsAll(7, 8) && emptyCells.contains(6))
    index = 6;
  else if (playerX.containsAll(3, 6) && emptyCells.contains(0))
    index = 0;
  else if (playerX.containsAll(4, 7) && emptyCells.contains(1))
    index = 1;
  else if (playerX.containsAll(5, 8) && emptyCells.contains(2))
    index = 2;
  else if (playerX.containsAll(4, 8) && emptyCells.contains(0))
    index = 0;
  else if (playerX.containsAll(4, 6) && emptyCells.contains(2))
    index = 2;
  else {
    Random random = Random();
    index = random.nextInt(emptyCells.length);
  }
    playGame(index, activePlayer);
}
}
extension ContainsAll on List
{
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}