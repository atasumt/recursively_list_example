import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class City extends StatelessWidget {
  City({Key? key}) : super(key: key);
  List _items = [];
  List<dynamic> cityRecursivelyList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: cityRecursivelyList.length,
          itemBuilder: (context, index) {
            return Text("Name: ${cityRecursivelyList[index]?['county_name']}");
          },
        );
      },
    );
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data/data.json');
    final data = await json.decode(response);
    _items = data["city"];

    for (var i = 0; i < _items.length; i++) {
      _recursivelyList(_items[i]);
    }
  }

  _recursivelyList(dynamic city) {
    if (city != null) {
      cityRecursivelyList.add(city);
      if (city['parent_recursively'] != null) {
        _recursivelyList(city['parent_recursively']);
      }
    }
  }
}
