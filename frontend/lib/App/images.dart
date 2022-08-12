import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/app_bar/app_bar.dart';
import 'package:cyl/Component/Footer/footer.dart';
import 'package:cyl/Component/ImageSlider/image_slider.dart';
import 'package:cyl/Component/ImagesComponents/selected_section.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePageArgs {
  final Map<XFile, dynamic> files;
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
  int currPos = 0;
  @override
  Widget build(BuildContext context) {
    Map<XFile, dynamic> files = (ModalRoute.of(context)!.settings.arguments as ImagePageArgs).files;
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
            ImageSlider(
              files: files.keys.toList(),
              onChanged: (index) {
                setState(() {
                  currPos = index;
                });
              },
            ),
            SelectedSection(
              selection: Map.from(files.values.toList()[currPos]),
            ),
            CustomFooter(scrollController: scrollController!)
          ],
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }
}
