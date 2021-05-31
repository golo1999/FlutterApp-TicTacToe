import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app_data.dart';
import 'button_restart_widget.dart';
import 'game_block_widget.dart';

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

typedef RestartButtonCallback = Function(Function);

// solution for the problem of passing back data from child to its parent
// https://flutteragency.com/send-data-from-child-widget-to-its-parent/
