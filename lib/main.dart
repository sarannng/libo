import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:libo/first.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
     // home: MyHomePage(title: 'Flutter Demo Home Page'),


      initialRoute: '/',
      routes: {
         '/': (context) => MyHomePage(),
         '/first': (context) => First(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.all(36.0),
        // color: Colors.white,
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
            Colors.blue[400],
             
            Colors.blue[200],
          ])
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                   Image.network("https://firebasestorage.googleapis.com/v0/b/library-651eb.appspot.com/o/finallogo.png?alt=media&token=67b97849-ae04-4771-bf4c-6b985582c688",
                   
                   height: 100,
                   width: 100,),

                    Text('Libo',
                      style: TextStyle( fontSize: 60, fontFamily: 'Lato', fontWeight: FontWeight.bold, color: Colors.white),

                    ),

                ],
              ),
             
              SizedBox(height: 50,),

              TextField(
          obscureText: false,
          
          style: TextStyle( fontFamily: 'Montserrat', fontSize: 20.0 ),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white60,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enrollment number",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
        ),
            
              SizedBox(height: 45,),

              TextField(
                obscureText: true,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white60,                  
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: 'password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
              ), 

              SizedBox(height: 45,),

               Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10.0),
          
           
          child: MaterialButton (

            
            minWidth: 200,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/first');
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ),
            
            ],
          ),
        ),
      ),
    );
      
      
      

     
  }
}
