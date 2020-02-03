import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SecondRoute extends StatelessWidget {
  @override
  final String text;
  SecondRoute({Key key, @required this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.blueGrey.shade100,
        primaryColor: Colors.blueGrey[500],
        accentColor: Colors.blue,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Overview'),
                Tab(text: 'Uses'),
                Tab(text: 'Dosing'),
                Tab(text: 'Interactions'),
                Tab(text: 'Side Effects'),


              ],
            ),
            title: Text('Ingredient Data'),
          ),
          body: TabBarView(
            children: [
              StreamBuilder(

                  stream: Firestore.instance.collection('Ingredients').where("name", isEqualTo: this.text).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('Accessing Database.....');
                    return SingleChildScrollView(child:
                        Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(snapshot.data.documents[0]['Overview'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,))));}),
          StreamBuilder(

              stream: Firestore.instance.collection('Ingredients').where("name", isEqualTo: this.text).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text('Accessing Database.....');
                return SingleChildScrollView(child:
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(snapshot.data.documents[0]['Uses'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,))));}),
          StreamBuilder(

              stream: Firestore.instance.collection('Ingredients').where("name", isEqualTo: this.text).snapshots(),
              builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Accessing Database.....');
              return SingleChildScrollView(child:
               Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(snapshot.data.documents[0]['Dosing'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,))));}),

           StreamBuilder(

              stream: Firestore.instance.collection('Ingredients').where("name", isEqualTo: this.text).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text('Accessing Database.....');
                return SingleChildScrollView(child:
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(snapshot.data.documents[0]['Interactions'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,))));}),
          StreamBuilder(

              stream: Firestore.instance.collection('Ingredients').where("Synonyms", arrayContains: this.text).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text('Accessing Database.....');
                return SingleChildScrollView(child:
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(snapshot.data.documents[0]['Side Effects'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,))));}),
            ],
          ),
        ),
      ),
    );
  }
}

