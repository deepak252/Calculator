import 'dart:math';

import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Calculator",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double num1=0,num2=0;
  String result="";
  String operation="";
  String textToDisplay="";

  void btnClicked(String btnVal)
  {
    if(btnVal=='C')
    {
      num1=0;
      num2=0;
      result="";
    }
    else if(btnVal=='+'||btnVal=='-'||btnVal=='x'||btnVal=='/'||btnVal=='^'||btnVal=='%')
    {
      num1=double.parse(result);
      operation=btnVal;
      result="";
    }
    else if(btnVal=='<X>' && result.length>0)
    {      
      result=result.substring(0,result.length-1);
    }
    else if(btnVal=='='){
      num2=double.parse(result);
      switch(operation){
        case '+':result=(num1+num2).toString();break;
        case '-':result=(num1-num2).toString();break;
        case 'x':result=(num1*num2).toString();break;
        case '/':result=(num1/num2).toString();break;
        case '%':result=(num1%num2).toString();break;
        case '^':result=(pow(num1, num2)).toString();break;
      }
    }
    else if(btnVal!='<X>' )
    {
      result=result+btnVal;
    }


    setState(() {
      textToDisplay=result;
    });
  }


  Widget customButton(String btnVal)
  {
    return (
      Expanded(
        child: OutlineButton(
         padding:EdgeInsets.all(25.0),
          onPressed:()=>btnClicked(btnVal),
          child: Text(
            "$btnVal",
            style: TextStyle(
                fontSize: 25.0
            )

          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CALCULATOR",
          style:TextStyle(
            color: Colors.white,
            fontSize:30.0,
            fontFamily:"Harlow Solid Italic" ,
          )
        ),
        // toolbarHeight: 80,
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget> [

            Container(
              
              alignment: Alignment.bottomRight,
              padding:EdgeInsets.all(12),
              child: 
              Text(
                "$textToDisplay",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),

              ),
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("^"),
                customButton("%"),
                customButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("<X>"),
                customButton("0"),
                customButton("."),
                customButton("="),
              ],
            ),
          ],
        )
      ),
    );
  }
}