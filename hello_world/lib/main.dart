import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // Gỡ title debug bên phải màn hình
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        // Tạo Appbar
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        // Tạo nội dung App là Hello World và hiển thị ở giữa
        body: Center(
          child: Text("Hello World !"),
        ),
      ),
    );
  }
}