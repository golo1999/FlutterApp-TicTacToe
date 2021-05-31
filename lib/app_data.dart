import 'dart:core';
import 'dart:math';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

const String appTitle = 'Tic Tac Toe';
const String firstPlayerTurnText = "First player's turn";
const String secondPlayerTurnText = "Second player's turn";
const String firstPlayerWinsText = 'First player wins!';
const String secondPlayerWinsText = 'Second player wins!';
const String gameTieText = 'Tie';
const String playAgainText = 'Play again';
const int minRandomNumber = 0;
const int maxRandomNumber = 1;
const int firstPlayerNumber = 1;
const int secondPlayerNumber = 2;
const Color primaryColor = Color(0xff00203F);
const Color secondaryColor = Color(0xffADEFD1);
const Color firstPlayerColor = Color(0xff008000);
const Color secondPlayerColor = Color(0xffff0000);

Color blockOneColor = secondaryColor;
Color blockTwoColor = secondaryColor;
Color blockThreeColor = secondaryColor;
Color blockFourColor = secondaryColor;
Color blockFiveColor = secondaryColor;
Color blockSixColor = secondaryColor;
Color blockSevenColor = secondaryColor;
Color blockEightColor = secondaryColor;
Color blockNineColor = secondaryColor;

bool firstPlayerTurn =
    // ignore: avoid_bool_literals_in_conditional_expressions
    generateRandomNumberBetween(minRandomNumber, maxRandomNumber) == 1
        ? true
        : false;
bool secondPlayerTurn = !firstPlayerTurn;
bool gameOver = false;

int numberOfFirstPlayerTappedBlocks = 0;
int numberOfSecondPlayerTappedBlocks = 0;
int numberOfFirstPlayerWins = 0;
int numberOfSecondPlayerWins = 0;

String topText = firstPlayerTurn ? firstPlayerTurnText : secondPlayerTurnText;
String scoreText = '$numberOfFirstPlayerWins : $numberOfSecondPlayerWins';

// list of blocks => setting every item to 0
List<int> blockList = List<int>.filled(9, 0, growable: false);

int generateRandomNumberBetween(int minNumber, int maxNumber) {
  final int randomNumber = Random().nextInt(maxNumber + 1) + minNumber;
  return randomNumber;
}

bool checkIfPlayerWon(int playerNumber) {
  if (blockList[0] == playerNumber &&
      blockList[1] == playerNumber &&
      blockList[2] == playerNumber) {
    return true;
  } else if (blockList[3] == playerNumber &&
      blockList[4] == playerNumber &&
      blockList[5] == playerNumber) {
    return true;
  } else if (blockList[6] == playerNumber &&
      blockList[7] == playerNumber &&
      blockList[8] == playerNumber) {
    return true;
  } else if (blockList[0] == playerNumber &&
      blockList[3] == playerNumber &&
      blockList[6] == playerNumber) {
    return true;
  } else if (blockList[1] == playerNumber &&
      blockList[4] == playerNumber &&
      blockList[7] == playerNumber) {
    return true;
  } else if (blockList[2] == playerNumber &&
      blockList[5] == playerNumber &&
      blockList[8] == playerNumber) {
    return true;
  } else if (blockList[0] == playerNumber &&
      blockList[4] == playerNumber &&
      blockList[8] == playerNumber) {
    return true;
  } else if (blockList[2] == playerNumber &&
      blockList[4] == playerNumber &&
      blockList[6] == playerNumber) {
    return true;
  }

  return false;
}

void restartGame() {
  // resetting all blocks from the list to 0
  for (int position = 0; position < blockList.length; ++position) {
    blockList[position] = 0;
  }

  firstPlayerTurn =
      // ignore: avoid_bool_literals_in_conditional_expressions
      generateRandomNumberBetween(minRandomNumber, maxRandomNumber) ==
              firstPlayerNumber
          ? true
          : false;

  secondPlayerTurn = !firstPlayerTurn;
  gameOver = false;

  topText = firstPlayerTurn ? firstPlayerTurnText : secondPlayerTurnText;

  numberOfFirstPlayerTappedBlocks = 0;
  numberOfSecondPlayerTappedBlocks = 0;
}

void showMessage(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
  );
}
