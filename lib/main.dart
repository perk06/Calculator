import 'package:calculator/CustomStack.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculatorBody());

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String num1 = "";

  final List<String> contentOfButton = [
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "C",
    "0",
    ".",
    "/",
    "AC",
    "=",
  ];

  String num2 = "";

  String op = "";

  int num, temp;

  String calc = "";

  double result = 0;

  CustomStack object = CustomStack();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator - beta"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      result.toString(),
                      style: TextStyle(
                        fontSize: 45.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      object.getCurrentString(),
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 300.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                        children: List.generate(
                            4, (index) => _buildButton(index, 0))),
                  ),
                  Expanded(
                    child: Row(
                      children:
                          List.generate(4, (index) => _buildButton(index, 4)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children:
                          List.generate(4, (index) => _buildButton(index, 8)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children:
                          List.generate(4, (index) => _buildButton(index, 12)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _buildButton(16, 0),
                        _buildButton(17, 0)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildButton(int index, int count) {
    String text = contentOfButton[index + count];
    return Expanded(
      child: SizedBox.expand(
        child: OutlineButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 25.0),
          ),
          onPressed: () {
            setState(() {
              if (text == "C") {
                object.num1 = "";
                result = object.pop();
              } else if (text == "AC") {
                result = object.clear();
              } else if (text == "=") {
                result = object.equalToFunction();
              } else {
                result = object.push(text);
              }
            });
          },
        ),
      ),
    );
  }
}
