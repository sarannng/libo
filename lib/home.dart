import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  bringdata(){
  //   Firestore.instance.collection('books').document()
  // .setData({ 'title': 'title', 'author': 'author' });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.red[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Issued books',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      )
                    ],
                  ),
                ),
              ),

              // 2 nd card start

              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.green[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Reissue date',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '14',
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      )
                    ],
                  ),
                ),
              ),

              // third card start

              Container(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.brown[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fine left',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '455',
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          //   RaisedButton(onPressed: bringdata()),
          Container(
            height: 50,
            child: Text(
              'Issued books',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            height: 300,
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('/students/XSnTgX51bPX0Kgw5RFSD/issed_books')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:  
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                            
                        return new ListTile(
                          title: Text(document['title']),
                          subtitle: Text(document['author']),
                          // trailing: new Image.network(document['qr'],
                          // ),
                          trailing: Image.network(document['img']),
                        );
                      
                      
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
