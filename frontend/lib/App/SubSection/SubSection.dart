import 'package:flutter/material.dart';
import '../HorizontalList/HorizontalList.dart';
import '../Variables/ColorVariables.dart';
import '../Variables/Size.dart';
import '../Variables/WidgetVariables.dart';

class SubSection extends StatelessWidget {
  final String title;
  const SubSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetVariables.smallPadding,
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(color: ColorVariables.textPrimaryColor, fontSize: SizeVariables.headingSizeMedium),
              ),
              const Icon(
                Icons.arrow_right_alt_rounded,
                color: ColorVariables.textPrimaryColor,
                size: SizeVariables.iconSizeMed,
              )
            ],
          ),
          WidgetVariables.verticalSpacingSmall,
          HorizontalList()
        ],
      )),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
