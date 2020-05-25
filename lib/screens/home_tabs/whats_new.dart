import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //Enable page to be scrollable
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_drawBannar(), _drawTopStories()],
      ),
    );
  }

  Widget _drawBannar() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 22,
    );
    TextStyle _headerDescription = TextStyle(
      fontSize: 13,
      color: Colors.white,
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/placeholder.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.23,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Text(
                'How Terriers & Royals Gatecrashed Final',
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Text(
                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: _headerDescription,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
//End of Bannar

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: _drawSectionTitle('Top Stories')),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          //Second Card
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: _drawSectionTitle('Recent Updates')),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawRecentUpdatesCard(Colors.deepOrange),
                _drawRecentUpdatesCard(Colors.green),
                SizedBox(height: 20,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(
                image: ExactAssetImage('assets/images/placeholder.jpg'),
                fit: BoxFit.cover),
            width: 124,
            height: 124,
          ),
          SizedBox(
            width: 16,
          ), //for moving the text right
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'the World Global Warming Annual Summit',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Michael Adams'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.alarm),
                        Text('15 min'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

  Widget _drawRecentUpdatesCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/placeholder.jpg'),
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .25,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              left: 16,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Sport",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              'Adipisicing laborum enim eu nulla sint consequat amet est aliquip aliqua proident officia.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 4,bottom: 8),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer,color: Colors.grey,size: 16,),
                SizedBox(width: 4,),
                Text('15 min',style: TextStyle(color:Colors.grey,fontSize: 14),)
              ],
            ),
            ),
            
        ],
      ),
    );
  }
}
