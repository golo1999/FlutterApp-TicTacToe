import 'package:flutter/cupertino.dart';

import 'app_data.dart';
import 'main.dart';

class GameBlock extends StatefulWidget {
  const GameBlock({Key key, this.index, this.topTextCallback})
      : super(key: key);

  final int index;
  final TopTextCallback topTextCallback;

  @override
  _GameBlockState createState() => _GameBlockState();
}

class _GameBlockState extends State<GameBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            // checking if the block wasn't clicked before
            // and the game is not over
            if (blockList[widget.index] == 0 && !gameOver) {
              // setting item's value in the list based on players' turn
              firstPlayerTurn
                  ? blockList[widget.index] = firstPlayerNumber
                  : blockList[widget.index] = secondPlayerNumber;

              // incrementing the number of selected blocks for the player
              firstPlayerTurn
                  ? ++numberOfFirstPlayerTappedBlocks
                  : ++numberOfSecondPlayerTappedBlocks;

              // checking if any player won
              final bool firstPlayerWon = checkIfPlayerWon(firstPlayerNumber);
              final bool secondPlayerWon = checkIfPlayerWon(secondPlayerNumber);

              if (firstPlayerWon || secondPlayerWon) {
                gameOver = true;

                topText =
                    firstPlayerWon ? firstPlayerWinsText : secondPlayerWinsText;

                firstPlayerWon
                    ? ++numberOfFirstPlayerWins
                    : ++numberOfSecondPlayerWins;

                scoreText = '$numberOfFirstPlayerWins :'
                    ' $numberOfSecondPlayerWins';

                showMessage(scoreText);
              }
              // if nobody won but all the blocks are clicked => it's a tie
              else if (numberOfFirstPlayerTappedBlocks == 5 ||
                  numberOfSecondPlayerTappedBlocks == 5) {
                topText = gameTieText;
                gameOver = true;
              }
              // if the game is still on
              else {
                // inverting players' turns
                secondPlayerTurn = firstPlayerTurn;
                firstPlayerTurn = !firstPlayerTurn;

                // setting the top text with next player's turn
                topText = firstPlayerTurn
                    ? firstPlayerTurnText
                    : secondPlayerTurnText;
              }

              // sending the top text back to the parent widget
              // after every player's turn
              widget.topTextCallback(topText);
            }
          },
        );
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: blockList[widget.index] == 0
              ? secondaryColor
              : (blockList[widget.index] == 1
                  ? firstPlayerColor
                  : secondPlayerColor),
          border: Border.all(
            color: primaryColor,
            width: 5,
          ),
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
      ),
    );
  }
}
