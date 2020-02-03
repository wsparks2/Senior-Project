import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:test_1/views/pages.dart';

Future main() async {
	final cameras = await availableCameras();
	final CameraDescription firstCamera = cameras.first;
	runApp(
		MaterialApp(
			debugShowCheckedModeBanner: false,

			theme: ThemeData(
				brightness: Brightness.light,
				backgroundColor: Colors.blueGrey.shade100,
				primaryColor: Colors.blueGrey[500],
				accentColor: Colors.blue,
			),

			home: Pages(camera: firstCamera),
		)
	);
}
