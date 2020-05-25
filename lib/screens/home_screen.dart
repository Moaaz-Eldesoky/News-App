import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
import 'package:newsapp/screens/home_tabs/whats_new.dart';
import 'package:newsapp/screens/home_tabs/popular.dart';
import 'package:newsapp/screens/home_tabs/favorites.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
// *with SingleTickerProviderStateMixin* enable calass to extends from more than one and we need singleTic.... for TabBar
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{   
  TabController _tabController;
  @override
  // this is a state that depends on stateful class to serve tabBar
  void initState(){
    super.initState();
    _tabController = TabController(initialIndex:0, length: 3, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),   //navigation menue 
      appBar: AppBar(
        title: Text("Explore"),
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
          WhatsNew(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController ),
      ),
    );
  }
}