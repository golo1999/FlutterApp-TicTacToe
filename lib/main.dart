import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app_data.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TicTacToe(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key key}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData _data = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            appTitle,
            style: TextStyle(color: secondaryColor),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: _data.size.longestSide * 0.025,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Container(
                width: _data.size.shortestSide * 0.6,
                height: _data.size.shortestSide * 0.6,
                margin: EdgeInsets.all(_data.size.longestSide * 0.025),
                child: GridView.builder(
                  itemCount: blockList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GameBlock(
                      index: index,
                      topTextCallback: (String returnedTopText) => setState(
                        () {
                          topText = returnedTopText;
                        },
                      ),
                    );
                  },
                ),
              ),
              if (gameOver)
                RestartButton(
                  data: _data,
                  restartButtonCallback: (Function function) => setState(
                    () {
                      function();
                    },
                  ),
                ),
            ],
          ),
        ),
        backgroundColor: secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

typedef TopTextCallback = void Function(String text);

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

typedef RestartButtonCallback = Function(Function);

class RestartButton extends StatefulWidget {
  const RestartButton({Key key, this.data, this.restartButtonCallback})
      : super(key: key);

  final RestartButtonCallback restartButtonCallback;
  final MediaQueryData data;

  @override
  _RestartButtonState createState() => _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() => widget.restartButtonCallback(restartGame));
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.data.size.longestSide * 0.01),
        child: Text(
          playAgainText,
          style: TextStyle(
            color: primaryColor,
            fontSize: widget.data.size.longestSide * 0.025,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

// solution for the problem of passing back data from child to its parent
// https://flutteragency.com/send-data-from-child-widget-to-its-parent/
