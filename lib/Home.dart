import 'package:flutter/material.dart';
import 'package:calculator/button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String expression = '';
List<MyButton>buttons=[
  MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _clearExpression(),x:"Ac",colortxt: Color(0xFF858585),),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FB),
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(167, 138, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      expression,
                      style: TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 38.0,),
          Padding(
            padding: const EdgeInsets.only(left: 171.0), // Add left padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "=${_evaluateExpression()}",
                      style: TextStyle(
                        color: Color(0xFF424242),
                        fontSize: 48.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),child: Row(
              children: [
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _clearExpression(),x:"Ac",colortxt: Color(0xFF858585),),
               SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _deleteLastCharacter(),x:"⌫",colortxt:Color(0xFF858585) ,),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFADE2FF),onPressed: ()=> _addToExpression('/'),x:"/",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFADE2FF),onPressed: ()=> _addToExpression('*'),x:"*",colortxt: Color(0xFF109DFF),),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),            child: Row(
              children: [
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('7'),x:"7",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('8'),x:"8",colortxt:Color(0xFF109DFF) ,),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('9'),x:"9",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFADE2FF),onPressed: ()=> _addToExpression('-'),x:"-",colortxt: Color(0xFF109DFF),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),            child: Row(
              children: [
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('4'),x:"4",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('5'),x:"5",colortxt:Color(0xFF109DFF) ,),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('6'),x:"6",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                Transform.translate(offset:Offset(0.0, 20.0),child: MyButton(w: 62.0, h: 96.0, colorcontainer: Color(0xFFADE2FF),onPressed: ()=> _addToExpression('+'),x:"+",colortxt: Color(0xFF109DFF),)),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Row(
              children: [
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('1'),x:"1",colortxt: Color(0xFF109DFF),),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('2'),x:"2",colortxt:Color(0xFF109DFF) ,),
                SizedBox(width: 20.0,),
                MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('3'),x:"3",colortxt: Color(0xFF109DFF),),


              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 34.0,),
              MyButton(w: 144.0, h: 60.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('0'),x:"0",colortxt: Color(0xFF109DFF),),
              SizedBox(width: 20.0,),
              MyButton(w: 62.0, h: 62.0, colorcontainer: Color(0xFFF7F8FB),onPressed: ()=> _addToExpression('.'),x:".",colortxt:Color(0xFF109DFF) ,),
              SizedBox(width: 20.0,),
              Transform.translate(
                offset: Offset(0.0, -10.0),
                child: MyButton(
                  w: 62.0,
                  h: 96.0,
                  colorcontainer: Color(0xFFADE2FF),
                  onPressed: () => _calculateExpression(),
                  x: "=",
                  colortxt: Color(0xFF109DFF),
                ),
              ),
            ],

          ),
        ],
      ),
    );
  }

  void _addToExpression(String value) {
    setState(() {
      expression += value;
    });
  }

  String _evaluateExpression() {
    try {
      final parser = Parser();
      final result = parser.parse(expression);
      final context = ContextModel();
      final evaluation = result.evaluate(EvaluationType.REAL, context);

      final formatter = NumberFormat('#,##0');
      return formatter.format(evaluation);
    } catch (e) {
      return '';
    }
  }

  void _calculateExpression() {
    setState(() {
      expression = _evaluateExpression();
    });
  }
  void _clearExpression() {
    setState(() {
      expression = '';
    });
  }

  void _deleteLastCharacter() {
    setState(() {
      if (expression.isNotEmpty) {
        expression = expression.substring(0, expression.length - 1);
      }
    });
  }
}
