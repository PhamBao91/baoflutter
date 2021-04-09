import 'package:app_theme_demo/app_theme.dart';
import 'package:app_theme_demo/app_theme_provider.dart';
import 'package:app_theme_demo/sharedprf_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeData = await SharedPrfTheme.getTheme();

  runApp(MyApp(themeData: themeData));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final int themeData;

  const MyApp({Key key, this.themeData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeProvider>(
      create: (context) => AppThemeProvider(themeData),
      child: Consumer<AppThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: value.themeData,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool themeVal = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Headline 1",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Headline 2",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "Headline 3",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "Headline 4",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Headline 5",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            CupertinoSwitch(
                value: themeVal,
                onChanged: (val) {
                  Provider.of<AppThemeProvider>(context, listen: false)
                      .changeTheme(val
                          ? AppTheme.darkThemeData
                          : AppTheme.lightThemeData);
                })
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
