import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String title;
  const CustomCard({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isWishlisted = false;
  int amountInCart = 0;
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
              widget.title,
              style: WidgetVariables.primaryTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (amountInCart == 0)
                    ? IconButton(
                        onPressed: () => setState(() {
                          amountInCart++;
                        }),
                        icon: const Icon(Icons.add_shopping_cart),
                        color: ColorVariables.secondaryTextColor,
                      )
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () => setState(() {
                              amountInCart--;
                            }),
                            icon: const Icon(Icons.remove),
                            color: ColorVariables.secondaryTextColor,
                          ),
                          Text('$amountInCart'),
                          IconButton(
                            onPressed: () => setState(() {
                              amountInCart++;
                            }),
                            icon: const Icon(Icons.add),
                            color: ColorVariables.secondaryTextColor,
                          ),
                        ],
                      ),
                IconButton(
                  onPressed: () => setState(() {
                    isWishlisted = !isWishlisted;
                  }),
                  icon: Icon(isWishlisted ? Icons.playlist_remove : Icons.playlist_add),
                  color: ColorVariables.secondaryTextColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
