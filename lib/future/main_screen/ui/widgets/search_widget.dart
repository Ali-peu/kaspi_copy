import 'package:flutter/material.dart';

import 'search_from_main.dart';

class GlobalSearchFieldWidget extends StatelessWidget {
  final String? searchText;
  const GlobalSearchFieldWidget({
    super.key,
    this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: TextFormField(
          initialValue: searchText,
          readOnly: true,
          onTap: () async {
            await showSearch<String>(
              context: context,
              delegate: SearchFromMain(
              ),
            );
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: 'Поиск по Kaspi.kz',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
