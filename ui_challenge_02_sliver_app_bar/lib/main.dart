import 'package:flutter/material.dart';
import 'package:ui_challenge_02_sliver_app_bar/destination.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Destination> destinations = [
    Destination(
      title: "One Pillar Pagoda",
      travelAgent: "Vietnam Travel",
      rating: 5,
      numberOfRating: 650,
      price: "450.000",
      currency: "đ",
      imageName: "images/one_pillar_pagoda.png",
    ),
    Destination(
      title: "Ho Chi Minh Mausoleum",
      travelAgent: "Vietnam Travel",
      rating: 5,
      numberOfRating: 700,
      price: "750.000",
      currency: "đ",
      imageName: "images/ho_chi_minh_mausoleum.png",
    ),
    Destination(
      title: "Hoàn Kiếm Lake",
      travelAgent: "Vietnam Travel",
      rating: 5,
      numberOfRating: 900,
      price: "1.500.000",
      currency: "đ",
      imageName: "images/hoan_kiem_lake.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var headerStack = Stack(
                      children: <Widget>[              
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            "images/hanoi.png",
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Positioned(
                          top: 44,
                          child: 
                            IconButton(
                              icon: Image.asset('images/ic_back.png',width: 24,),
                              // iconSize: 50,
                              onPressed: () {
                                print("Chung");
                              },
                            ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Hanoi",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text("Vietnam",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    );
    var listView = ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20),
      itemCount: destinations.length,
      itemBuilder: (BuildContext ctxt, int index) {
      return _createItemFrom(destinations[index]);
    });
    return Scaffold(
      body:
        Container(
          color: Color(0xfff3f5f7),
          child: Column(
            children: <Widget>[
              headerStack,
              Expanded(child: listView),
            ],
          ),
          )
    );
  }

  Widget _createItemFrom(Destination destination) {
    var screenSize = MediaQuery.of(context).size;
    var actualHeight = screenSize.height * 0.2;
    var aspectRatio = 
     ClipRRect(
       borderRadius: BorderRadius.all(Radius.circular(12)),
       child: 
        Container(
          // color: Colors.red,
          // height: actualHeight,
          // width: 100,
          child: 
            AspectRatio(
              aspectRatio: 270/432,
              child: Image.asset(destination.imageName,
              fit: BoxFit.contain,
              ),
            ),
          ),
     );

    var titleStyle = TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      );

    var topColumn = 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(destination.title,
            style: titleStyle,
          ),                
          Text(destination.travelAgent,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black38
            ),
          ),
          Row(
            children: <Widget>[
              getStarsFromRating(destination.rating),
              SizedBox(width: 12,),
              Text("${destination.numberOfRating} reviews",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38
                ),
              ),

            ],
          ),
        ],
      );

    var bottomColumn = 
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Text("from",
          style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.black26
          ),
        ),
        Text(
          destination.price + destination.currency,
          style: titleStyle,
        ),                                                      
      ],
    );

    var textColumn = 
      Column(
        children: <Widget>[
          Expanded(child: topColumn),
          Expanded(child: bottomColumn),
        ],
      );

    return 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50,
              right: 10,
              child: 
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 20,
                          blurRadius: 20,
                          offset: Offset(3, 27), // changes position of shadow
                        ),
                      ],
                    ),                    
                    child: 
                      Container(
                        alignment: Alignment.bottomRight,
                        height: actualHeight,
                        color: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                          child:                    
                            Container(
                              color: Color(0xffdaf2f5),
                              child: IconButton(
                                    icon: Image.asset('images/ic_right_arrow.png',width: 24,),
                                    // iconSize: 50,
                                    onPressed: () {
                                      print("Chung");
                                    },
                                  ),
                            ),
                        ),
                      ),
                  ),
                )
            ),
            
            Container(
              height: actualHeight,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: 
                Row(
                  children: <Widget>[
                    aspectRatio,
                    SizedBox(width: 8,),
                    Expanded(child: textColumn)
                  ],
                ),
            )
          ],
        ),
      );
    
  }

  Widget getStarsFromRating(int rating) {
    if (rating < 0) {
      return       
        Icon(
          Icons.star,
          color: Colors.white10,
        );
    }
    List<Widget> stars = [];

    for (var i = 0; i < rating; i++) {
      stars.add(
        Image.asset(
          "images/ic_star.png",
          width: 18,
        )
      );
      stars.add(SizedBox(width: 2,));
    }

    return Row(
      children: stars,
    );
  }
}
