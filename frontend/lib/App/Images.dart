import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePageArgs {
  final List<XFile> files;
  ImagePageArgs({required this.files});
}

class ImagesPage extends StatelessWidget {
  static const routes = '/images';
  const ImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
