import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './App/CYL.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CameraDescription cameraDescription = (await availableCameras())[1];
  runApp(CYL(
    cameraDescription: cameraDescription,
  ));
}
