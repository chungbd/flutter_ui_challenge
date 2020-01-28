import 'package:flutter/material.dart';
import 'package:mark922_flutter_lottie/mark922_flutter_lottie.dart';
import 'package:page_indicator/page_indicator.dart';

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
  LottieController controller;
  List<Widget>  pageItems;

  @override
  void initState() {
    pageItems = [
                  getPageItem(
                    filePath: "animations/happy-new-year.json",
                    title: "Happy New Year 2020",
                    subTitle: "Give wings to your dreams and \nallow them to see come true in 2020!"
                    ),
                  getPageItem(
                    filePath: "animations/lunarnewyear.json",
                    title: "Business flourishes",
                    subTitle: "Cheers to a better life and a bright future!"
                    ),
                  getPageItem(
                    filePath: "animations/lunar-new-year.json",
                    title: "Happy New Lunar Year",
                    subTitle: "Enjoy a loony, rocking, enchanting and\nexciting New Year!"
                    ),
                ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var pageView = PageView(
                            children: pageItems,
                          );
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: 
        Center(
          child: Column(
                      children: <Widget>[
                        SizedBox(height: 100,),
                        Expanded(
                          child: 
                            PageIndicatorContainer(
                              child: pageView,
                              length: pageItems.length,
                              indicatorColor: Colors.grey,
                              indicatorSelectorColor: Colors.black,
                            ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(color: Colors.black,),
                            ),
                            Expanded(
                              flex: 2,
                              child: 
                                FlatButton(
                                  padding: EdgeInsets.all(12.0),
                                  color: Colors.white,
                                  shape: StadiumBorder(
                                    side: BorderSide(color: Colors.black, width: 2),
                                  ),
                                  child: Text(
                                    "Continue".toUpperCase(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {

                                  },
                                ),
                            ),
                            Expanded(
                              child: Container(color: Colors.red,),
                            ),                          ],
                        ),
                        // Container(
                        //   width: double.infinity,                          
                        //   child: ,
                        // ),
                        SizedBox(height: 100,),
                      ],
                    ),
        )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getPageItem({
    String filePath,
    String title = "",
    String subTitle = ""
  }) {
    return 
      // child: SizedBox(
      //   height: 300,
      //   width: 300,
      //   // child: Container(
      //   //   color: Colors.black,
      //   // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: LottieView.fromFile(
                    filePath: filePath,
                    autoPlay: true,
                    loop: true,
                    reverse: true,
                    onViewCreated: onViewCreatedFile,
                  ),
                ),
                Text(
                  title,
                  style: 
                    TextStyle(
                      fontWeight: FontWeight.w700, 
                      fontSize: 28
                    ),
                ),
                SizedBox(height: 32,),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: 
                    TextStyle(
                      height: 1.5,
                      color: Colors.black38,
                      fontSize: 18
                    ),
                )                
            ],
          );
      // ),
  }

  void onViewCreatedFile(LottieController controller) {
    this.controller = controller;
  }  
}
