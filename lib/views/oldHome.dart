import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './ingredientData.dart';
import './supplements.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, bool> values = {
    'One a day': false,
    'Omega 3 supplement': false,
    'Calcium Supplement': false,
  };

  Future<String> myQuery(myItem) async{
    var item = '';
    Firestore.instance
        .collection('Ingredients')
        .where("name", isEqualTo: "vitex agnus-castus")
        .snapshots()
        .listen((data) =>
        data.documents.forEach((doc) => item = ((doc["Overview"]))));
    print(item);
    return item;
  }

  Future<String> asyncAwait(myItem) async{

    var myData = await myQuery(myItem);
    return myData;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Home Page', style: const TextStyle(color: Colors.white))),
        body: Container (child : Column(
            children: [

              Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  // decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blueAccent)
                  //   ),
                  //width: fill,
                  //color: Colors.lightBlue,
                  child: Text('Saved Ingredients',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, decoration: TextDecoration.underline),
                  )
              ),

              Container(
                  height: 150.0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView( child:Wrap(children: [


                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('Vitex'),
                        onPressed: () {
                          var myText = "vitex agnus-castus";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute(text: myText))
                          );
                        },
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('methoxylated flavones'),
                        onPressed: () {
                          var myText = "methoxylated flavones";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SecondRoute(text: myText))
                          );
                        },
                    ),
                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('capsicum'),
                        onPressed: () {
                          var myText = "capsicum";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SecondRoute(text: myText))
                          );
                        }
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('asafoetida'),
                        onPressed: () {
                          var myText = "asafoetida";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SecondRoute(text: myText))
                          );
                        }
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        padding: const EdgeInsets.all(8.0),
                        label: Text('lycopene'),
                        onPressed: () {
                          var myText = "lycopene";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SecondRoute(text: myText))
                          );
                        }
                    ),
                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('beta-carotene'),
                        onPressed: () {
                          var myText = "beta-carotene";
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SecondRoute(text: myText))
                          );
                        }
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('Calcium Trilate'),
                        onPressed: () {
                          print("If you stand for nothing, Burr, what’ll you fall for?");
                        }
                    ),
                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('Acetyl L-Carnitine'),
                        onPressed: () {
                          print("If you stand for nothing, Burr, what’ll you fall for?");
                        }
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        label: Text('ATP'),
                        onPressed: () {
                          print("If you stand for nothing, Burr, what’ll you fall for?");
                        }
                    ),

                    ActionChip(
                      /* avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),*/
                        padding: const EdgeInsets.all(8.0),
                        label: Text('Alfalfa'),
                        onPressed: () {
                          print("If you stand for nothing, Burr, what’ll you fall for?");
                        }
                    ),

                  ]
                  )
                  )
              ),
              Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  // decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blueAccent)
                  //   ),
                  //width: fill,
                  //color: Colors.lightBlue,
                  child: Text('My Saved Supplements',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, decoration: TextDecoration.underline),
                  )
              ),


              Supplements(values),


              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: () {},
                      child: Text('Generate Daily Intake', style: const TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                    new RaisedButton(
                      onPressed: () {},
                      child: Text('Reset', style: const TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),

            ]
        )
        )
    );
  }
}
void main() {
  runApp(new MaterialApp(home: new HomeView(), debugShowCheckedModeBanner: false));
}