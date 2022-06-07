import 'package:flutter/material.dart';
import './productImageContainer/ProductImageContainer.dart';
import '../Variables/WidgetVariables.dart';

class HorizontalList extends StatefulWidget {
  final List<Widget> items = [];
  HorizontalList({super.key, List<dynamic> itemList = _data}) {
    items.add(WidgetVariables.horizontalSpacingSmall);
    for (var element in itemList) {
      items.add(ProductImageClass(
        url: element.url,
      ));
      items.add(WidgetVariables.horizontalSpacingSmall);
    }
  }

  @override
  State<HorizontalList> createState() => _HorizontalList();
}

class _HorizontalList extends State<HorizontalList> {
  void buildItemList({List itemList = _data}) {}

  @override
  Widget build(BuildContext context) {
    return (SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.items,
      ),
    ));
  }
}

class _SampleData {
  final String url;
  const _SampleData({required this.url});
}

const List<_SampleData> _data = [
  _SampleData(url: "https://www.freeiconspng.com/uploads/lipstick-png-31.png"),
  _SampleData(url: "https://www.freeiconspng.com/uploads/lipstick-png-31.png"),
  _SampleData(url: "https://www.freeiconspng.com/uploads/lipstick-png-31.png"),
  _SampleData(url: "https://www.freeiconspng.com/uploads/lipstick-png-31.png"),
  _SampleData(url: "https://www.freeiconspng.com/uploads/lipstick-png-31.png"),
];
