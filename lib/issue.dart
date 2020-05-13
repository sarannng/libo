import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class Issue extends StatefulWidget {
  @override
  _IssueState createState() => _IssueState();
}

class _IssueState extends State<Issue> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        print(qrText);
      });
    });
  }

  @override
  void dispose() {     
    controller?.dispose();
    super.dispose();
  }

  void addbook() {
    var databasebook =
        Firestore.instance.collection('books').document('$qrText').get();

    databasebook.then((onValue) { 
      var bookprevtitle = onValue.data['title'];
      var bookprevauthor = onValue.data['author'];
      var bookprevimg = onValue.data['qr'];

      Firestore.instance
          .collection('/students/XSnTgX51bPX0Kgw5RFSD/issed_books')
          .document()
          .setData({
        'title': bookprevtitle,
        'author': bookprevauthor,
        'img': bookprevimg,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('books')
                      .document('$qrText')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          'Please scan the Qr on book!!',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,

                              // color: Color.fromRGBO(21, 167, 225, 0.9)
                              color: Color.fromRGBO(221, 65, 68, 0.9)),
                        ),
                      );
                    }
                    var userDocument = snapshot.data;
                    return Scaffold(
                      body: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox( 
                              height: 8,
                            ),
                            Text(
                              'Book details',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        ' Book Title',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 19,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        userDocument["title"],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 52,
                                      ),
                                      Text(
                                        'Book Author',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 19,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        userDocument["author"],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        userDocument["qr"],
                                        height: 120,
                                        width: 84,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.red,
                              child: MaterialButton(
                                minWidth: 30,
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                onPressed: () {
                                  //Navigator.pushReplacementNamed(context, '/first');
                                  addbook();
                                  dispose();
                                },
                                child: Text("Request Issue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.0)
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
