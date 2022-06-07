import 'package:flutter/material.dart';
import './Camera.dart';
import './Home.dart';

class CYL extends StatefulWidget {
  const CYL({super.key});

  @override
  State<CYL> createState() => _CYL();
}

class _CYL extends State<CYL> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Choose Your Look",
      initialRoute: "/",
      routes: {"/": (_) => const Home(), CameraPage.routes: (_) => const CameraPage()},
    ));
  }
}
