import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calcultor extends StatefulWidget {
  const Calcultor({ Key? key }) : super(key: key);

  @override
  _CalcultorState createState() => _CalcultorState();
}

class _CalcultorState extends State<Calcultor> {
  var result = '';

  Widget btn(var txt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result += txt;
          });
        },
        child: Text(txt));
  }

  clear() {
    setState(() {
      result = '';
    });
  }

  equals() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("0"),
              btn("1"),
              btn("2"),
              btn("3"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              btn("7"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("8"),
              btn("9"),
              btn("+"),
              btn("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("x"),
              btn("/"),
              ElevatedButton(onPressed: equals, child: Text("=")),
              ElevatedButton(onPressed: clear, child: Text("C")),
            ],
          ),
        ],
      ),
    ));
  }
}