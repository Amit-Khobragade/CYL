import 'package:CYL/App/Images.dart';
import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/Component/CameraComponents/AddFilters.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:CYL/Component/CameraComponents/CameraBtn.dart';
import 'package:CYL/Component/CameraComponents/ImagesBtn.dart';
import 'package:CYL/App/Variables/Size.dart';

class CameraPage extends StatefulWidget {
  static const routes = '/camera';
  final CameraDescription cameraDescription;
  const CameraPage({Key? key, required this.cameraDescription}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  List<XFile> images = <XFile>[];

  @override
  Widget build(BuildContext context) {
    Widget camera = cameraController != null
        ? CameraPreview(cameraController!)
        : Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            camera,
            Positioned(
              bottom: SizeVariables.bottomControlsPosB,
              left: SizeVariables.bottomControlsPosL,
              child: SizedBox(
                width: (MediaQuery.of(context).size.width + SizeVariables.iconLarge) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImagesBtn(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        ImagesPage.routes,
                        arguments: ImagePageArgs(files: images),
                      ),
                    ),
                    ClickBtn(onPressed: () async => images.add(await cameraController!.takePicture())),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SizeVariables.chevronPosT,
              left: SizeVariables.chevronPosL,
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: ColorVariables.color60Per,
                  size: SizeVariables.iconSmall1,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Positioned(
              top: SizeVariables.filterPosT,
              right: SizeVariables.filterPosR,
              child: Filters(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    (() async {
      cameras = await availableCameras();
      cameraController = CameraController(cameras![1], ResolutionPreset.max);
      cameraController?.initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((e) {
        print('Camera Issues');
      });
    })();
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }
}
