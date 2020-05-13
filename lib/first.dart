import 'package:flutter/material.dart';
import 'package:libo/home.dart';
import 'package:libo/issue.dart';
import 'package:libo/payment.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}
 

class _FirstState extends State<First> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        
      appBar: AppBar(
          title: Text(
        'Hello Sarang!',
        style: TextStyle(
          fontFamily: 'montserrat',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      )),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.blue[70],
      
      onTap: (newIndex) => setState((){ _currentIndex= newIndex;}) ,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text("Issue")
          ),

        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          title: Text("Payment")
          ),    
      ],
      ),

      body: new IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          new Home(),
          new Issue(),
          new Payment(),
        ],
      ),
      

      
    );
  }
}
