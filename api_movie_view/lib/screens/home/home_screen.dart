import 'package:flutter/material.dart';

import 'popular_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_tabBar(), _tabBarView()],
      ),
    );
  }

  _tabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 25),
      child: TabBar(
        controller: _controller,
        labelStyle: TextStyle(
            fontFamily: "Comfortaa", fontSize: 24, fontWeight: FontWeight.bold),
        tabs: [
          Text(
            "Popular",
          ),
          Text(
            "NowPlaying",
          ),
          Text(
            "Up Coming",
          ),
          Text(
            "Top Rate",
          ),
        ],
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        isScrollable: true,
      ),
    );
  }

  _tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: [
          PopularView(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
