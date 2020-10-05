
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'FutureProvider/future_provider_page.dart';
import 'FutureProvider/load_data_from_json.dart';
import 'StreamProvider/number_stream.dart';
import 'StreamProvider/stream_provider_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Advance Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
            providers: [
              FutureProvider(create: (_) => LoadDataFromJson().loadUserData()),
             StreamProvider(create: (_) => NumberStream().intStream(), initialData: 0)
            ],
            child: DefaultTabController(
                length: 2,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Advanced Provider"),
                      bottom: TabBar(
                        tabs: [
                          Tab(child: Text("FutureProvider"),),
                          Tab(child: Text("StreamProvider"),),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        FutureProviderPage(),
                        StreamProviderPage(),
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}














