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
    var listView = ListView(
              children: <Widget>[
                Stack(
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
                      top: 16,
                      child: 
                        IconButton(
                          icon: Image.asset('images/ic_back.png'),
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
                ),
                _createItemFrom(destinations[0])
              ],
            );
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body:
        Container(
          color: Color(0xfff3f5f7),
          child: listView,
          )
    // CustomScrollView(
    //   slivers: <Widget>[
    //     // SliverAppBar(
    //     //   pinned: true,
    //     //   expandedHeight: 400.0,
    //     //   flexibleSpace: ,
    //     //   floating: true,
    //     // ),
                            
    //   ],
    // ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _createItemFrom(Destination destination) {
    var aspectRatio = 
      Container(
        color: Colors.red,
        height: 200,
        child: 
          AspectRatio(
            aspectRatio: 16/9,
            child: Image.asset(destination.imageName,
            fit: BoxFit.contain,
            ),
          ),
        );

    return Stack(children: <Widget>[
      Row(
        children: <Widget>[
          // Image.asset(destination.imageName),
          aspectRatio,
          
      ],)
    ],);
  }
}
