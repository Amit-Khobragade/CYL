import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../App/Variables/Factories.dart';
import '../App/Variables/Size.dart';
import '../App/Variables/ColorVariables.dart';

class CameraPage extends StatefulWidget {
  static const routes = "/camera";

  const CameraPage({super.key});
  @override
  State<CameraPage> createState() => _CameraPage();
}

class _CameraPage extends State<CameraPage> {
  Future<void>? _initControllerFuture;
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  int _currentCamPos = 0;
  bool _filterDialog = false;

  void switchCamera() {
    WidgetsFlutterBinding.ensureInitialized();

    setState(() {
      _currentCamPos = (_currentCamPos == 0) ? 1 : 0;
      _controller = CameraController(_cameras.elementAt(_currentCamPos), ResolutionPreset.max);
      _initControllerFuture = _controller.initialize();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    (availableCameras()).then((value) {
      setState(() {
        if (value.isEmpty) {
          throw CameraException('404', 'Camera not Found');
        }
        _cameras = value;
        _currentCamPos = 1;
        _controller = CameraController(value.elementAt(_currentCamPos), ResolutionPreset.max);
        _initControllerFuture = _controller.initialize();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initControllerFuture == null) {
      return Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
      );
    }
    return (FutureBuilder<void>(
      future: _initControllerFuture,
      builder: (context, snapshot) => (snapshot.connectionState == ConnectionState.done)
          ? Stack(fit: StackFit.expand, children: <Widget>[
              CameraPreview(_controller),
              Positioned(
                right: 10,
                top: 70,
                child: Card(
                  color: ColorVariables.lowOpacityColor,
                  child: Column(
                    children: <Widget>[
                      IconBtn(
                        onPressed: switchCamera,
                        iconData: Icons.switch_camera,
                        size: SizeVariables.navBarTextSize,
                        tooltip: "switch cam",
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 50,
                  left: 5,
                  right: 5,
                  // width: ,
                  child: Card(
                    color: ColorVariables.noOpacityColor,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconBtn(
                          iconData: Icons.add,
                          onPressed: () => print("add"),
                          color: Colors.white,
                        ),
                        IconBtn(
                          iconData: Icons.camera,
                          onPressed: () => print("click"),
                          color: Colors.white,
                          size: SizeVariables.iconSizeLarge,
                        ),
                        const SizedBox(
                          width: SizeVariables.iconSizeMed,
                        )
                      ],
                    ),
                  ))
            ])
          : Container(
              color: Colors.black,
              height: double.infinity,
              width: double.infinity,
            ),
    ));
    // TODO: implement build
    throw UnimplementedError();
  }
}
