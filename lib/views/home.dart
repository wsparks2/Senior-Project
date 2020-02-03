import 'package:flutter/material.dart';
import 'package:test_1/views/result.dart';
//import 'package:camera/camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingredients reader',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        //canvasColor: const Color(0xFFedfced),
      ),
      home: IngHome('Ingredient Reader')
    );
  }
}

class IngHome extends StatefulWidget {
  final String title;

  IngHome(this.title);

  @override
  _IngHomeState createState() => _IngHomeState();
}

class _IngHomeState extends State<IngHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30
        ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Center(child: Text("Warning", style: TextStyle(fontSize: 28, color: Colors.red[800]), ),),
            ),
            Container(
              child: Center(
                child: Text("The purpose of this app is simply give informations about ingredients.\nThe information can be not perfect, and can be wrong. Before you decides your supplements based on informations from this app, checking your health condition with your doctor is recomanded.\nAgain, the informations we gave from app is not perfect.\n\n", style: TextStyle(fontSize: 22, color: Colors.black),),),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.red, width: 5.0),
                    top: BorderSide(color: Colors.red, width: 5.0),
                    right: BorderSide(color: Colors.red, width: 5.0),
                    left: BorderSide(color: Colors.red, width: 5.0),
                  )
                )
            ),
//              ),
//           Text('Warning', style: TextStyle(fontSize: 28, color: Colors.red[800]), ),
//            Text('The purpose of this app is simply give informations about ingredients.\nThe information can be not perfect, and can be wrong. Before you decides your supplements based on informations from this app, checking your health condition with your doctor is recomanded.\nAgain, the informations we gave from app is not perfect.\n\n', style: TextStyle(fontSize: 22),),

            // After combine with camera, remove this
            RaisedButton(
              child: Text('mv to demo result'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraResult())
                );
              },
            )

          ],
        )
      ),
    );
  }
}
