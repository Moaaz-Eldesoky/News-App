import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
ValueNotifier<int> _pageIndexNotifier = ValueNotifier(0);

  List<PageModel>pages;
  void _addPages(){
    pages=List<PageModel>();
    pages.add(PageModel('Welcome!', "1-Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore ", Icons.ac_unit, 'assets/images/bg.jpg'));
    pages.add(PageModel('Welcome!', "2-Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore ", Icons.map, 'assets/images/bg2.jpg'));
    pages.add(PageModel('Welcome!', "3-Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore ", Icons.access_alarm, 'assets/images/bg3.jpg'));
    pages.add(PageModel('Welcome!', "4-Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
        " sed do eiusmod tempor incididunt ut labore ", Icons.access_time, 'assets/images/bg4.jpg'));
  }
  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
      body: Stack(                      //to make layers like z-index
        children: <Widget>[
          PageView.builder(           //to make slider
            itemBuilder: (context, index) {     //index is a loop depends on the num of Count
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].image),  //load 4 icons depends on index
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //center inside column
                    mainAxisAlignment: MainAxisAlignment.center,
                    //center inside the fullpage
                    
                    children: <Widget>[
                      Transform.translate(   //to move child with offset
                        child: Icon(
                          pages[index].icon, //load 4 icons depends on index
                      color: Colors.white,
                          size: 120,
                        ),
                        offset: Offset(0,-50),    //determine the position by X & Y axis
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 10),
                        child: Text(
                          pages[index].title,
                          style: TextStyle(color: Colors.white,fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45,right: 45),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(color: Colors.white,fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,     //number of slides on the slider
            onPageChanged: (index){
              _pageIndexNotifier.value=index;
            },

          ),
          Transform.translate(
            offset:Offset(0,175),
            child:Align(
              alignment: Alignment.center,
              child: _desplayPageIndicators(pages.length),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10,right: 16,left: 16),
              child: SizedBox(
                width: double.infinity,     //dynamic width to be responsive
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        _updateSeen();
                        return HomeScreen();
                      },
                      ),
                    );
                  },
                  child: Text("Get Started",style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _desplayPageIndicators(int length){
    return PageViewIndicator(
  pageIndexNotifier: _pageIndexNotifier,
  length: length,
  normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
  highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
);
  }
  void _updateSeen()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('seen', true);
  }
}

