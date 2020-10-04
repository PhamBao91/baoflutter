import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/feature.dart';
import 'box21.dart';
import 'box22.dart';
import 'box23.dart';

class Box1 extends StatefulWidget {
  @override
  _Box1State createState() => _Box1State();
}

class _Box1State extends State<Box1> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box21(),
          Box22(),
          Box23(),
          increaseNumber()
        ],
      ),
    );
  }


  // Button of increasing Number
  increaseNumber()
  {
    return RaisedButton(
      child: Text("Tăng số", style: TextStyle(fontSize: 20),),
      onPressed: (){
        context.read<Feature>().increaseCount();
      },
    ); 
  }

}
