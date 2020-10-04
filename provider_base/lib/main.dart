import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'box1.dart';
import 'feature.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => Feature()),
    ],
     child:MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Box1(),
          ),
        ),
      ),
    ));
  }
}
