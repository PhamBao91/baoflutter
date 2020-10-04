import 'package:flutter/material.dart';
import 'package:provider_base/feature.dart';
import 'package:provider/provider.dart';
class Box21 extends StatefulWidget {
  @override
  _Box21State createState() => _Box21State();
}

class _Box21State extends State<Box21> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: 200,
      margin : EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: context.watch<Feature>().count%2==0 ? Colors.blue : Colors.red ,

      ),
        child: Center(
         child: Text(context.watch<Feature>().count.toString(), style: TextStyle(color: Colors.white, fontSize: 20),),

        )
    );
  }


}
