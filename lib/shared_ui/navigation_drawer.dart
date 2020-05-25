import 'package:flutter/material.dart';
import 'package:newsapp/screens/headLine_news.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/instagram_feed.dart';
import 'package:newsapp/screens/twiter_feed.dart';
import '../models/nav_menu.dart';
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavmenuItem>navigationMenu=[
    //we use this way insteed of "NavmenuItem("Explor", HomeScreen())" to avoid lake recorses as we don't need to make class instance for evry Item on the menu
    NavmenuItem("Explor",() => HomeScreen()), 
    NavmenuItem("Headline News",() => HeadLineNews()),
    NavmenuItem("Twiter",() => TwitterFeed()),
    NavmenuItem("Instagram",() => InstagramFeed()),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 50),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].Title,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade600,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return navigationMenu[position].destination();
                  }));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
