import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  const CustomCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 180,
        height: 200,
        padding: WidgetVariables.smallPadding,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Expanded(child: Text('Placeholder')),
            Text(
              title,
              style: WidgetVariables.primaryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
