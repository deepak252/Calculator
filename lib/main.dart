import "package:flutter/material.dart";

void main()
{
  runApp(myApp());
} 

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title:"Text Field",
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myhomepage(),

    );
  }
}

class myhomepage extends StatefulWidget {
  @override
  _myhomepageState createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {

  String name="";
  void greet()
  {
    setState(() {
      name="Hello $name";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "INPUT",
        ),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            " $name",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              onChanged: (text){
                name=text;
              },
              style:TextStyle(
                color:Colors.green[400],
                fontSize: 20.0
              ),
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_box),
              ),
            ),
          ),
          FlatButton(
            onPressed: greet,
            color: Colors.black,
            child: Text(
              "GREET",
              style: TextStyle(color: Colors.white,fontSize: 25.0),
            ),
          ),
        ],
      ),
    );
  }
}