import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You have a result score less than or equal to 8';
    } else if (resultScore <= 12) {
      resultText = 'less than or equal to 12';
    } else if (resultScore <= 16) {
      resultText = '16 or less';
    } else {
      resultText = 'else';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(child: Text('Restart Quiz'), textColor: Colors.blue, onPressed: resetHandler,)
      ],
    )
    );
  }
}
