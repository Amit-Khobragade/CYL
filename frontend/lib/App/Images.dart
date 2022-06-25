import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/Component/AppBar/appBar.dart';
import 'package:CYL/Component/Footer/Footer.dart';
import 'package:CYL/Component/ImageSlider/ImageSlider.dart';
import 'package:CYL/Component/ImagesComponents/SelectedSection.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePageArgs {
  final List<XFile> files;
  ImagePageArgs({required this.files});
}

class ImagesPage extends StatefulWidget {
  static const routes = '/images';
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorVariables.color60Per,
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController!,
          slivers: [
            const CustomAppBar(),
            const SliverToBoxAdapter(
              child: WidgetVariables.verticalSpacingSmall,
            ),
            ImageSlider(files: (ModalRoute.of(context)!.settings.arguments as ImagePageArgs).files),
            SelectedSection(),
            CustomFooter(scrollController: scrollController!)
          ],
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
  }
}
