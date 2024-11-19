import 'package:flutter/material.dart';

class SearchFromMain extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Поиск по Kaspi.kz';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [const SizedBox()];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(Icons.search_rounded);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text('empty'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('empty'));
  }
}
