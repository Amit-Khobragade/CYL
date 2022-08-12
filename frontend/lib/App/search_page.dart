import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/Component/HomeComponents/Categories/categories.dart';
import 'package:cyl/Component/app_bar/app_bar.dart';
import 'package:cyl/Component/Card/card.dart';
import 'package:cyl/Component/Footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'Variables/widget_variables.dart';

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
    String searchKeys = (ModalRoute.of(context)!.settings.arguments as SearchQuery).keywords;
    String query = """
    query {
      search(search: "$searchKeys") {
        _id
        uid
        title
        description
        subCategory
      }
    }
    """;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController!,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CustomAppBar(),
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
                    searchKeys,
                    style: WidgetVariables.headerTextStyle,
                  ),
                  WidgetVariables.horizontalSpacingSmall,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Query(
                options: QueryOptions(document: gql(query)),
                builder: (result, {fetchMore, refetch}) {
                  if (result.source == QueryResultSource.loading) {
                    return const Text('loading...');
                  } else if (result.data == null) {
                    return const Text('an error occured');
                  }
                  List<dynamic> data = result.data!['search'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: data.map((e) => CustomCard(title: e['title'])).toList(),
                    ),
                  );
                },
              ),
            ),
            CustomFooter(scrollController: scrollController!),
          ],
        ),
      ),
    );
  }
}

class CategorySearchPage extends StatefulWidget {
  static const String routes = '/categorySearch';
  const CategorySearchPage({Key? key}) : super(key: key);

  @override
  State<CategorySearchPage> createState() => _CategorySearchPageState();
}

class _CategorySearchPageState extends State<CategorySearchPage> {
  ScrollController? scrollController;
  List filters = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    String category = (ModalRoute.of(context)!.settings.arguments as CategorySearchQuery).category;
    String query = """
    query {
      productsByCategory(category: "$category"){
        _id
        uid
        title
        description
        subCategory
      }
    } 
  """;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          slivers: [
            const CustomAppBar(),
            CategoriesTile(
              category: category,
              onSelected: (list) {
                setState(() {
                  filters = list;
                });
                return;
              },
            ),
            SliverToBoxAdapter(
              child: Query(
                options: QueryOptions(document: gql(query)),
                builder: (result, {fetchMore, refetch}) {
                  if (result.source == QueryResultSource.loading) {
                    return const Text('loading...');
                  } else if (result.data == null) {
                    return const Text('an error occured');
                  }
                  List<dynamic> data = result.data!['productsByCategory'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: data
                          .where((element) => (!filters.isNotEmpty || filters.contains(element['subCategory'])))
                          .map((e) => CustomCard(title: e['title']))
                          .toList(),
                    ),
                  );
                },
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

class CategorySearchQuery {
  final String category;
  CategorySearchQuery({required this.category});
}
