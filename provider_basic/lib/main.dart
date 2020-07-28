import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'counter_model.dart';
import 'counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      ChangeNotifierProvider<CounterModel>(create: (context) => CounterModel()),

    ],
    child: MaterialApp(
      home: CounterView(),
    ),);
  }
}