import 'package:CYL/App/Images.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './Camera.dart';
import './Home.dart';

class CYL extends StatefulWidget {
  final CameraDescription cameraDescription;
  const CYL({super.key, required this.cameraDescription});

  @override
  State<CYL> createState() => _CYL();
}

class _CYL extends State<CYL> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Choose Your Look',
      initialRoute: '/',
      routes: {
        '/': (_) => const Home(),
        CameraPage.routes: (_) => CameraPage(
              cameraDescription: widget.cameraDescription,
            ),
        ImagesPage.routes: (_) => const ImagesPage(),
      },
    ));
  }
}
