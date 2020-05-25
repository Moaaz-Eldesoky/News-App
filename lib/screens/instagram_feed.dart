import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Feeds',
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
                _cardHeader(),
                _cardBody(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                Text(
                  "Chirstina Meyers ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Text('Fri, 12May 2017 . 14.30')
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            Text('25'),
          ],
        ),
      ],
    );
  }

  /*********************************/
  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Text(
        'WE also talk about the future of work as the robots',
        style: TextStyle(fontSize: 16, height: 2),
      ),
    );
  }

  /*********************************/
  Widget _cardFooter() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    '10 COMMENTS',
                    style:
                        TextStyle(color: Colors.yellow.shade800, fontSize: 16),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Share",
                      style: TextStyle(
                          color: Colors.yellow.shade800, fontSize: 16),
                    )),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Open",
                      style: TextStyle(
                          color: Colors.yellow.shade800, fontSize: 16),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
