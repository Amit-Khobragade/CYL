import 'package:cyl/App/images.dart';
import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/Component/CameraComponents/add_filters.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cyl/Component/CameraComponents/camera_btn.dart';
import 'package:cyl/Component/CameraComponents/images_btn.dart';
import 'package:cyl/App/Variables/size.dart';

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
  Map<XFile, dynamic> images = <XFile, dynamic>{};

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
          fit: StackFit.expand,
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
                    ClickBtn(
                      onPressed: () async => images.addAll({await cameraController!.takePicture(): Map.from(filters)}),
                    )
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
        if (kDebugMode) {
          print('Camera Issues');
        }
      });
    })();
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }
}
