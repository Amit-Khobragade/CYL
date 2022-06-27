import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:CYL/Component/AppBar/appBar.dart';
import 'package:CYL/Component/Card/Card.dart';
import 'package:CYL/Component/Footer/Footer.dart';
import 'package:flutter/material.dart';

import 'Variables/WidgetVariables.dart';

class SearchPage extends StatefulWidget {
  static const String routes = '/Search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController!,
          physics: BouncingScrollPhysics(),
          slivers: [
            CustomAppBar(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WidgetVariables.horizontalSpacingSmall,
                  const Icon(
                    Icons.search,
                    size: SizeVariables.iconSmall1,
                  ),
                  Text(
                    (ModalRoute.of(context)!.settings.arguments as SearchQuery).keywords,
                    style: WidgetVariables.headerTextStyle,
                  ),
                  WidgetVariables.horizontalSpacingSmall,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: WidgetVariables.smallPadding,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: const [
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                  ],
                ),
              ),
            ),
            CustomFooter(scrollController: scrollController!),
          ],
        ),
      ),
    );
  }
}

class SearchQuery {
  final String keywords;
  SearchQuery({required this.keywords});
}
