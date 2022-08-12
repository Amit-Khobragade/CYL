import 'package:cyl/App/search_page.dart';
import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:flutter/cupertino.dart';

class CustomSearchBox extends StatefulWidget {
  const CustomSearchBox({Key? key}) : super(key: key);

  @override
  State<CustomSearchBox> createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: WidgetVariables.searchContainerEdgeInsets,
        child: CupertinoSearchTextField(
          prefixIcon: Image.asset('assets/images/search.png', width: SizeVariables.iconSmall),
          borderRadius: WidgetVariables.borderRadiusPrimary,
          backgroundColor: ColorVariables.color60Per,
          prefixInsets: WidgetVariables.searchBoxEdgeInsets,
          style: WidgetVariables.primaryTextStyle,
          placeholder: 'Search cyl',
          onSubmitted: (val) => Navigator.pushNamed(context, SearchPage.routes, arguments: SearchQuery(keywords: val)),
        ),
      ),
    );
  }
}
