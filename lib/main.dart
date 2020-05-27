import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          title: Text('Dicee'),
        ),
        backgroundColor: Colors.deepPurple,
        body: Dicee(),
      ),
    ),
  );
}

class Dicee extends StatefulWidget {
  @override
  _DiceeState createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  var leftDiceeNumber = 3;
  var rightDiceeNumber = 5;

  void generateRandomDice() {
    setState(() {
      leftDiceeNumber = Random().nextInt(6) + 1;
      rightDiceeNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0, right: 8.0),
              child: FlatButton(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset('assets/images/dice$leftDiceeNumber.png'),
                onPressed: () {
                  generateRandomDice();
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8.0, right: 16.0),
              child: FlatButton(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset('assets/images/dice$rightDiceeNumber.png'),
                onPressed: () {
                  generateRandomDice();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
