import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
import 'package:newsapp/screens/home_tabs/popular.dart';
import 'package:newsapp/screens/home_tabs/favorites.dart';


class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(initialIndex:0, length: 3, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),   //navigation menue 
      appBar: AppBar(
        title: Text("Headline News"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert,), onPressed: (){}),
        ],
        bottom: TabBar(tabs:[
          Tab(text:"What's New", ),
          Tab(text:"Popular", ),
          Tab(text:"Favorites", ),
        ],indicatorColor: Colors.white,
        controller: _tabController,
        ),
      ),
      body: Center(
        child: TabBarView(children: [
          Favorites(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController ),
      ),
    );
  }
}