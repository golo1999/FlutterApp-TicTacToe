import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'main.dart';

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
