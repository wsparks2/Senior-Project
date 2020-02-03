library dart.dom.svg;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_1/views/inginformation.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './ingredientData.dart';
import './supplements.dart';

List<String> ingList = ["vitex agnus-castus", "methoxylated flavones", "capsicum",
  "asafoetida", "lycopene", "beta-carotene",
  "Monounsaturated Fat 0.5g", "Vitamin A 4250 IU",
  "Vitamin D 425 IU", "Omega-3 fatty acids 0.5g"];


List<CupertinoButton> buttonsList = new List<CupertinoButton>();

// button for loop  ${ingList[i]}
// After local database set, need to add if-else loop too.
List<Widget> buttonWidget(context){
  // button loop
  for(var i =0; i<ingList.length; i++) {
    buttonsList.add(new CupertinoButton(
      child: Text('${ingList[i]}',
        style: TextStyle(fontSize: 20, color: Colors.black),),
      onPressed: () {

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute(text: ingList[i]))
        );
        },
      ),
    );
  }
  /*
  // remove numbers from string
  for(var i=0; i<ingList.length; i++){
    ingList[i].substring(0, ingList[i].length-2);
  }  */
  return buttonsList;
}

String check(String a){
  a.substring(0, a.length-2);
  Text("$a", textAlign: TextAlign.center, style: TextStyle(fontSize: 30),
  );
  return a;
}

class CameraResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _CameraResultState();
  }
// _CameraResultState createState() => _CameraResultState();
}

class _CameraResultState extends State<CameraResult> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: buttonWidget(context)
      ),
    );
  }
}
