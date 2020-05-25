import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Twitter Feeds',
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: NavigationDrawer(), // دى تبع الماتيريال ديزاين بتظبط الدنيا معاك
      body: ListView.builder(
        //دى بتعمل ليسته من العناصر بدل ما اكرر الكود
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
                child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _cardHeader(),
                  ],
                ),
                _cardBody(),
                _drowLine(),
                _cardFooter(),
              ],
            )),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Chirstina Meyers ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height:20),
                  Text(
                    "@ch_meyers",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text('Fri, 12May 2017 . 14.30')
            ],
          )
        ],
      ),
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Text(
        'WE also talk about the future of work as the robots advanced, and we ask whether a retro phone',
        style: TextStyle(fontSize: 17, height: 2),
      ),
    );
  }
  Widget _drowLine() {
    return Container(
    height: 1,
    color: Colors.grey.shade200,
    margin: EdgeInsets.only(top:10 ),
    );
  }
  Widget _cardFooter() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(icon:Icon(Icons.repeat,color: Colors.yellow.shade800,size: 40,),onPressed: (){},),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('25',style: TextStyle(fontSize: 20,color:Colors.grey),),
        ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              FlatButton(onPressed:(){}, child: Text("Share",style: TextStyle(color:Colors.yellow.shade800,fontSize: 20),)),
              FlatButton(onPressed:(){}, child: Text("Open",style: TextStyle(color:Colors.yellow.shade800,fontSize: 20),)),
            ],
          ),
        )
        ],
      ),
    );
  }
}
