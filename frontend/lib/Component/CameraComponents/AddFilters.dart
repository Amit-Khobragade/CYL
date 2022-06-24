import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/Component/AppBar/searchBox.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value is String) {
          showDialog(
            context: context,
            builder: (context) {
              return CustomFilterPopup(value: value);
            },
          );
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem>[
          _customFilterPopupItem(value: 'lips'),
          _customFilterPopupItem(value: 'eyes'),
          _customFilterPopupItem(value: 'face'),
        ];
      },
      child: Image.asset(
        'assets/images/add_filter.png',
        width: SizeVariables.iconMed,
      ),
    );
  }
}

PopupMenuItem _customFilterPopupItem({required String value}) {
  return PopupMenuItem(
    padding: WidgetVariables.smallPadding,
    value: value,
    child: Center(
      child: Column(
        children: [
          const Icon(
            Icons.add,
            size: SizeVariables.iconSmall1,
            color: ColorVariables.secondaryTextColor,
          ),
          Text(
            value.toUpperCase(),
            style: WidgetVariables.primaryTextStyle,
          ),
        ],
      ),
    ),
  );
}

class CustomFilterPopup extends StatefulWidget {
  final String value;
  const CustomFilterPopup({Key? key, required this.value}) : super(key: key);

  @override
  State<CustomFilterPopup> createState() => _CustomFilterPopupState();
}

class _CustomFilterPopupState extends State<CustomFilterPopup> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeVariables.filterPopupWidth,
        height: SizeVariables.filterPopupHeight,
        padding: WidgetVariables.smallPadding,
        decoration: const BoxDecoration(
          borderRadius: WidgetVariables.borderRadiusPrimary,
          color: ColorVariables.navBarColor,
        ),
        child: Column(
          children: [
            Text(
              widget.value.toUpperCase(),
              style: WidgetVariables.primaryTextStyle,
            ),
            const CustomSearchBox(),
            Container()
          ],
        ),
      ),
    );
  }
}
