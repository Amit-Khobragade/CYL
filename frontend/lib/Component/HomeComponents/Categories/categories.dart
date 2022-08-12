import 'package:cyl/App/search_page.dart';
import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/StyledButton/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CategoriesTile extends StatelessWidget {
  final String? category;
  final void Function(List selected)? onSelected;
  final void Function(String clicked)? onClicked;
  const CategoriesTile({Key? key, this.category, this.onSelected, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String query, key;
    if (category == null) {
      query = """
      query {
        categories
      }
      """;
      key = 'categories';
    } else {
      query = """
      query {
        subCategories(category: "$category")
      }
      """;
      key = 'subCategories';
    }
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorVariables.textPrimaryColor,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside,
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: WidgetVariables.categoriesPad,
          child: Query(
            options: QueryOptions(document: gql(query)),
            builder: (result, {fetchMore, refetch}) {
              if (result.source == QueryResultSource.loading) {
                return (const Text('loading...'));
              }
              if (result.data != null) {
                return TileSection(
                  data: (result.data![key] as List),
                  onClicked: onClicked ??
                      ((onSelected == null)
                          ? (cat) => Navigator.pushNamed(
                                context,
                                CategorySearchPage.routes,
                                arguments: CategorySearchQuery(category: cat),
                              )
                          : null),
                  onSelected: onSelected,
                );
              }
              return (const Text('Error!!!'));
            },
          ),
        ),
      ),
    );
  }
}

/*
 * Generic tile section
 */
class TileSection extends StatefulWidget {
  final void Function(List selected)? onSelected;
  final void Function(String clicked)? onClicked;
  final List data;

  const TileSection({Key? key, required this.data, this.onClicked, this.onSelected}) : super(key: key);

  @override
  State<TileSection> createState() => _TileSectionState();
}

class _TileSectionState extends State<TileSection> {
  final List selected = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: widget.data
          .map(
            (e) => Padding(
              padding: WidgetVariables.medPaddingHorizontal,
              child: StyledBtn(
                text: e,
                eventListener: () {
                  if (widget.onClicked != null) {
                    widget.onClicked!(e);
                  }
                  if (widget.onSelected != null) {
                    setState(() {
                      (selected.contains(e)) ? selected.remove(e) : selected.add(e);
                      widget.onSelected!(selected);
                    });
                  }
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
