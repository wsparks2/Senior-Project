import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:test_1/views/labelRender.dart';
import './dispLabel.dart';

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home:


      TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {

  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

  class TakePictureScreenState extends State<TakePictureScreen> {
  List<String> myListMin = [];
  List<String> myListIng = [];
  CameraController _controller;
  File pickedImage;
  String imagePath;
  Future <void> _initializeControllerFuture;
  Future pickImage(flagger) async {
    print("In picture state");
    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = tempStore;
    });
    print('Now printing list');

    File croppedFile = await ImageCropper.cropImage(
        sourcePath: pickedImage.path,
    );
    await readImage(flagger, croppedFile);


  }

  Future readImage(flagger, croppedFile) async {

    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(
        croppedFile);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(visionImage);

    if (flagger == 0) {
      for (TextBlock block in readText.blocks) {
        for (TextLine line in block.lines) {
          print(line.text);
          myListMin.add(line.text);
          for (TextElement word in line.elements) {
            print(word.text);
          }
        }
      }
    }

    if (flagger == 1) {
      for (TextBlock block in readText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement word in line.elements) {
            print(word.text);
            myListIng.add(word.text);
          }
        }
      }
    }
    print(myListMin);


  }
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Read in label')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body:  Center(child: Stack(
    children: <Widget>[FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      Align(
        alignment: Alignment.bottomLeft,
        child: ActionChip(
        label: Text('Read Column'),
        // Provide an onPressed callback.
        onPressed: ()=>pickImage(0),
      ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: ActionChip(
          label: Text('Read Ingdnts'),
          // Provide an onPressed callback.
          onPressed: ()=>pickImage(1),

        ),
      ),

      Align(
        alignment: Alignment.bottomCenter,
        child: ActionChip(
          label: Text('Submit'),
          // Provide an onPressed callback.
          onPressed: () {Navigator.push(
              context,MaterialPageRoute(builder: (context) =>
              DispRoute(ing: myListIng, min: myListMin)));

          },

        ),
      ),

],
    ),
    ),
    );

  }

}

