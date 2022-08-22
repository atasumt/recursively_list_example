import 'package:flutter/material.dart';
import 'package:recursively_list_example/modules/city/city.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: City(),
      ),
    );
  }
}
