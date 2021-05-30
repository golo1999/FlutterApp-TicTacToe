import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app_data.dart';

void main() {
  runApp(MaterialApp(
    home: TicTacToe(),
    debugShowCheckedModeBanner: false,
  ));
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    MediaQueryData _data = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            appTitle,
            style: TextStyle(color: secondaryColor),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockOneColor != firstPlayerColor &&
                                blockOneColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockOneColor = firstPlayerColor
                                  : blockOneColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            color: blockOneColor,
                            border: Border.all(
                              color: primaryColor,
                              width: 5,
                            )),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockTwoColor != firstPlayerColor &&
                                blockTwoColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockTwoColor = firstPlayerColor
                                  : blockTwoColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockTwoColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockThreeColor != firstPlayerColor &&
                                blockThreeColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockThreeColor = firstPlayerColor
                                  : blockThreeColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockThreeColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockFourColor != firstPlayerColor &&
                                blockFourColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockFourColor = firstPlayerColor
                                  : blockFourColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockFourColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockFiveColor != firstPlayerColor &&
                                blockFiveColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockFiveColor = firstPlayerColor
                                  : blockFiveColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockFiveColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockSixColor != firstPlayerColor &&
                                blockSixColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockSixColor = firstPlayerColor
                                  : blockSixColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockSixColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockSevenColor != firstPlayerColor &&
                                blockSevenColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockSevenColor = firstPlayerColor
                                  : blockSevenColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockSevenColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockEightColor != firstPlayerColor &&
                                blockEightColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockEightColor = firstPlayerColor
                                  : blockEightColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockEightColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (blockNineColor != firstPlayerColor &&
                                blockNineColor != secondPlayerColor &&
                                !gameOver) {
                              firstPlayerTurn
                                  ? blockNineColor = firstPlayerColor
                                  : blockNineColor = secondPlayerColor;

                              firstPlayerTurn
                                  ? ++numberOfFirstPlayerTappedBlocks
                                  : ++numberOfSecondPlayerTappedBlocks;

                              // checking if any player won

                              bool firstPlayerWon =
                                  checkIfPlayerWon(firstPlayerColor);
                              bool secondPlayerWon =
                                  checkIfPlayerWon(secondPlayerColor);

                              if (firstPlayerWon || secondPlayerWon) {
                                topText = firstPlayerWon
                                    ? firstPlayerWinsText
                                    : secondPlayerWinsText;
                                gameOver = true;

                                firstPlayerWon
                                    ? ++numberOfFirstPlayerWins
                                    : ++numberOfSecondPlayerWins;

                                scoreText = "$numberOfFirstPlayerWins :"
                                    " $numberOfSecondPlayerWins";

                                showMessage(scoreText);
                              } else if (numberOfFirstPlayerTappedBlocks == 5 ||
                                  numberOfSecondPlayerTappedBlocks == 5) {
                                topText = gameTieText;
                                gameOver = true;
                              } else {
                                secondPlayerTurn = firstPlayerTurn;
                                firstPlayerTurn = !firstPlayerTurn;

                                topText = firstPlayerTurn
                                    ? firstPlayerTurnText
                                    : secondPlayerTurnText;
                              }
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: blockNineColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 5,
                          ),
                        ),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (gameOver)
                OutlinedButton(
                  onPressed: () {
                    setState(
                      () {
                        restartGame();
                      },
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(_data.size.longestSide * 0.01),
                    child: Text(
                      playAgainText,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: _data.size.longestSide * 0.025,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
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
