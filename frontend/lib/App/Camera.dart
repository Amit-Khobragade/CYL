import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:flutter/material.dart';
import 'package:CYL/Component/CameraComponents/CameraBtn.dart';
import 'package:CYL/Component/CameraComponents/ImagesBtn.dart';
import 'package:CYL/App/Variables/Size.dart';

class CameraPage extends StatefulWidget {
  static const routes = '/camera';
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: SizeVariables.bottomControlsPosB,
              left: SizeVariables.bottomControlsPosL,
              child: SizedBox(
                width: (MediaQuery.of(context).size.width + SizeVariables.iconLarge) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ImagesBtn(),
                    ClickBtn(onPressed: () => print('click')),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SizeVariables.bottomControlsPosL,
              left: SizeVariables.bottomControlsPosL + 10,
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: ColorVariables.color60Per,
                  size: SizeVariables.iconSmall1,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
