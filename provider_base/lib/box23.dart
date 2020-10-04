import 'package:flutter/material.dart';
import 'package:provider_base/feature.dart';
import 'package:provider/provider.dart';
class Box23 extends StatefulWidget {
  @override
  _Box23State createState() => _Box23State();
}

class _Box23State extends State<Box23> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Feature>(context);
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
