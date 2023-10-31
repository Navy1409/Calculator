import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String equation ='0';
  String result ='0';
  String expression ='';

  buttonPresses(btnText){
    setState(() {
      if(btnText=='AC'){
        equation='0';
        result='0';
      }else if(btnText=='⌫'){
        equation=equation.substring(0, equation.length-1);
        if(equation==''){
          equation='0';
        }
      }else if(btnText=='='){

        expression=equation;
        expression=expression.replaceAll("×", '*');
        expression=expression.replaceAll("÷", '/');

        try{
          Parser p= Parser();
          Expression exp= p.parse(expression);
          ContextModel cm= ContextModel();
          result="${exp.evaluate(EvaluationType.REAL, cm)}";
        }
        catch(e){
          'Error';
        }

      }else{
        if(equation=='0'){
          equation=btnText;
        }else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButton(String btnText, Color bgColor, Color textColor){
    return InkWell(
      onTap: (){
        buttonPresses(btnText);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text(btnText, style: TextStyle(fontSize: 35, color: textColor),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("CALCULATOR",style: TextStyle(color: Colors.greenAccent),),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
            color: Colors.black,
          child: Column(
            children: [
              //result
              Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(child: Text(equation,style: TextStyle(color: Colors.greenAccent, fontSize: 50),)),
              ),
              //expression
              Container(
                height: 140,
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(child: Text(result,style: TextStyle(color: Colors.white, fontSize: 65),)),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      calButton("AC", Colors.greenAccent, Colors.white),
                      calButton("%", Colors.greenAccent, Colors.white),
                      calButton("÷", Colors.greenAccent, Colors.white),
                      calButton("⌫", Colors.greenAccent, Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      calButton("7", Colors.grey.shade900, Colors.greenAccent),
                      calButton("8", Colors.grey.shade900, Colors.greenAccent),
                      calButton("9", Colors.grey.shade900, Colors.greenAccent),
                      calButton("×", Colors.greenAccent, Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      calButton("4", Colors.grey.shade900, Colors.greenAccent),
                      calButton("5", Colors.grey.shade900, Colors.greenAccent),
                      calButton("6", Colors.grey.shade900, Colors.greenAccent),
                      calButton("+", Colors.greenAccent, Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      calButton("1", Colors.grey.shade900, Colors.greenAccent),
                      calButton("2", Colors.grey.shade900, Colors.greenAccent),
                      calButton("3", Colors.grey.shade900, Colors.greenAccent),
                      calButton("-", Colors.greenAccent, Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      calButton("+/-", Colors.grey.shade900, Colors.greenAccent),
                      calButton("0", Colors.grey.shade900, Colors.greenAccent),
                      calButton(".", Colors.grey.shade900, Colors.greenAccent),
                      calButton("=", Colors.greenAccent, Colors.white),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),),
    );
  }
}

