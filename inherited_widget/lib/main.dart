import 'package:flutter/material.dart';
void main(){
  return  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: TheStatefulWidget(
            child: TheContainer(
              child:  TheStackWidget(),
            ),

          )
      ),
    );
  }
}

/// TheStatefulWidget
///
/// This Widget use InheritedWidget
/// This Widget contains: variables , functions
/// Its child Widget will interact these variables , functions

class TheStatefulWidget extends StatefulWidget {
  final Widget child;

  TheStatefulWidget({Key key, @required this.child}):super(key: key);

  /// Add listener with InheritedWidget
  static TheStatefulWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TheInheritedWidget>().data;
  }

  @override
  TheStatefulWidgetState createState() => TheStatefulWidgetState();
}

class TheStatefulWidgetState extends State<TheStatefulWidget> {
  bool _changed = false;
  bool get changed => _changed;

  changeColor(){
    setState(() {
      _changed = !_changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TheInheritedWidget(
        child: widget.child,
        data: this);
  }
}

/// The InheritedWidget
///
/// This Widget will be used to pass data from TheStatefulWidget to child Widgets
class TheInheritedWidget extends InheritedWidget{

  final TheStatefulWidgetState data; // define data of parent Widgets is: TheStatefulWidgetState

  TheInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data
  }) : super(key: key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }


}


// TheContainer is parents of ColorBox & LableBox Widget
class TheContainer extends StatelessWidget {

  final Widget child;

  TheContainer({Key key, this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
/// TheStackWidget
///
///
class TheStackWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        ColorBox(),
        LableBox()
      ],
    );
  }


}

// LableBox use data from the TheStatefulWidget
class LableBox extends StatefulWidget {
  @override
  _LableBoxState createState() => _LableBoxState();
}

class _LableBoxState extends State<LableBox> {

  bool changed;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    TheStatefulWidgetState data = TheStatefulWidget.of(context);
    changed = data.changed;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return changed ? Text("Màu Đỏ", style: TextStyle(
        color: Colors.white
    ),) : Text("Màu Xanh", style: TextStyle(
        color: Colors.white
    ),);

  }
}

class ColorBox extends StatefulWidget {
  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  bool changed ;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    TheStatefulWidgetState data = TheStatefulWidget.of(context);
    changed = data.changed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: changed ? Colors.red: Colors.blue
        ),
      ),
      onTap: (){
        // Use function of parentWidget - TheStatefulWidget
        TheStatefulWidget.of(context).changeColor();
      },
    );
  }
}



