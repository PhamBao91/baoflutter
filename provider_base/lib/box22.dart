import 'package:flutter/material.dart';
import 'package:provider_base/feature.dart';
import 'package:provider/provider.dart';
class Box22 extends StatefulWidget {
  @override
  _Box22State createState() => _Box22State();
}

class _Box22State extends State<Box22> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: 200,
      margin : EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey ,
      ),
      child: Center(
        child: Text("Không dùng Provider", style: TextStyle(color: Colors.white, fontSize: 20),),
      )
    );
  }


}
