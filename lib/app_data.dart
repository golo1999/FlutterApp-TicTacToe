import 'dart:math';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

const String appTitle = 'Tic Tac Toe';
const String firstPlayerTurnText = "First player's turn";
const String secondPlayerTurnText = "Second player's turn";
const String firstPlayerWinsText = 'First player wins!';
const String secondPlayerWinsText = 'Second player wins!';
const String gameTieText = "Tie";
const String playAgainText = "Play again";
const int minRandomNumber = 0;
const int maxRandomNumber = 1;
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
String scoreText = "$numberOfFirstPlayerWins : $numberOfSecondPlayerWins";

int generateRandomNumberBetween(int minNumber, int maxNumber) {
  int randomNumber = Random().nextInt(maxNumber + 1) + minNumber;
  return randomNumber;
}

bool checkIfPlayerWon(Color color) {
  if (blockOneColor == color &&
      blockTwoColor == color &&
      blockThreeColor == color) {
    return true;
  } else if (blockFourColor == color &&
      blockFiveColor == color &&
      blockSixColor == color) {
    return true;
  } else if (blockSevenColor == color &&
      blockEightColor == color &&
      blockNineColor == color) {
    return true;
  } else if (blockOneColor == color &&
      blockFourColor == color &&
      blockSevenColor == color) {
    return true;
  } else if (blockTwoColor == color &&
      blockFiveColor == color &&
      blockEightColor == color) {
    return true;
  } else if (blockThreeColor == color &&
      blockSixColor == color &&
      blockNineColor == color) {
    return true;
  } else if (blockOneColor == color &&
      blockFiveColor == color &&
      blockNineColor == color) {
    return true;
  } else if (blockThreeColor == color &&
      blockFiveColor == color &&
      blockSevenColor == color) {
    return true;
  }

  return false;
}

void restartGame() {
  blockOneColor = secondaryColor;
  blockTwoColor = secondaryColor;
  blockThreeColor = secondaryColor;
  blockFourColor = secondaryColor;
  blockFiveColor = secondaryColor;
  blockSixColor = secondaryColor;
  blockSevenColor = secondaryColor;
  blockEightColor = secondaryColor;
  blockNineColor = secondaryColor;

  firstPlayerTurn =
      generateRandomNumberBetween(minRandomNumber, maxRandomNumber) == 1
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
  );
}
