import 'package:calculator/calcbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evalute(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                    textStyle:
                        TextStyle(fontSize: 24, color: Color(0xFF545F61))),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 48, color: Colors.white)),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillcolor: 0xFF6C807F,
                  textsize: 20,
                  callBack: allClear,
                ),
                CalcButton(
                  text: 'C',
                  callBack: clear,
                  fillcolor: 0xFF6C807F,
                ),
                CalcButton(
                  text: '%',
                  callBack: numClick,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                ),
                CalcButton(
                  text: '/',
                  callBack: numClick,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '8',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '9',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '*',
                  callBack: numClick,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                  textsize: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '5',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '6',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '-',
                  callBack: numClick,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                  textsize: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '2',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '3',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '+',
                  callBack: numClick,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                  textsize: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '0',
                  callBack: numClick,
                ),
                CalcButton(
                  text: '00',
                  callBack: numClick,
                  textsize: 26,
                ),
                CalcButton(
                  text: '=',
                  callBack: evalute,
                  fillcolor: 0xFFFFFFFF,
                  textcolor: 0xFF65BDAC,
                ),
              ],
            ),
          ],
        ));
  }
}
