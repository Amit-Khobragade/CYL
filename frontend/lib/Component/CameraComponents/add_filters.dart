import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/app_bar/search_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

dynamic filters = {
  "face": '0',
  "eyes": '0',
  "lips": '0',
};

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
          Icon(
            (filters[value] == '0') ? Icons.add : Icons.check,
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
    String query = """
    query {
      productsByCategory(category: "${widget.value}") {
        _id
        title 
      }
    }
    """;
    return Center(
      child: Container(
        width: SizeVariables.filterPopupWidth,
        height: SizeVariables.filterPopupHeight,
        padding: WidgetVariables.smallPadding,
        decoration: const BoxDecoration(
          borderRadius: WidgetVariables.borderRadiusPrimary,
          color: ColorVariables.navBarColor,
        ),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                widget.value.toUpperCase(),
                style: WidgetVariables.primaryTextStyle,
              ),
            ),
            const SliverToBoxAdapter(child: CustomSearchBox()),
            SliverToBoxAdapter(
              child: Query(
                options: QueryOptions(document: gql(query)),
                builder: (result, {fetchMore, refetch}) {
                  if (result.source == QueryResultSource.loading) {
                    return const Text('loading...');
                  } else if (result.data == null) {
                    if (kDebugMode) {
                      print(result);
                    }
                    return const Text('An Error Occurred...');
                  }
                  return Wrap(
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: (result.data!['productsByCategory'] as List)
                        .map(
                          (e) => _FilterCards(
                            title: e['title'],
                            id: e['_id'],
                            category: widget.value,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FilterCards extends StatelessWidget {
  final String title, id, category;
  const _FilterCards({Key? key, required this.title, required this.id, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () => (filters[category] = id),
        child: Container(
          width: 160,
          height: 200,
          padding: WidgetVariables.smallPadding,
          alignment: Alignment.center,
          child: Column(children: [
            const Expanded(child: Text('Placeholder')),
            Text(
              title,
              style: WidgetVariables.primaryTextStyle,
            ),
          ]),
        ),
      ),
    );
  }
}
