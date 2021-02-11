import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String l = "One", r = "One";
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void updateDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  String showNumber(int num) {
    switch (num) {
      case 1:
        return "One";
        break;
      case 2:
        return "Two";
        break;
      case 3:
        return "Three";
        break;
      case 4:
        return "Four";
        break;
      case 5:
        return "Five";
        break;
      case 6:
        return "Six";
        break;
      default:
        return "One";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                updateDice();
                l = showNumber(leftDiceNumber);
                r = showNumber(rightDiceNumber);
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                updateDice();
                l = showNumber(leftDiceNumber);
                r = showNumber(rightDiceNumber);
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: Text("$l",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.amberAccent,
                )),
          ),
          Expanded(
            child: Text(
              "$r",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.lightGreenAccent,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
