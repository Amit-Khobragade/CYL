import 'package:flutter/material.dart';
import '../Variables/WidgetVariables.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width, height;
  const ShimmerWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white54,
      highlightColor: Colors.black12,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: Colors.white54, borderRadius: WidgetVariables.borderRadiusSmall, border: WidgetVariables.boxBorderSmall),
      ),
    );
  }
}
