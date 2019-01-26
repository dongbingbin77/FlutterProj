import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/mypage.dart';
import 'dart:async';
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MyApp();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}


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
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page1'),
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
  int _counter = 0;

  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "getName":
        return "Hello from Flutter";
        break;
      case "backPressed":

        Navigator.pop(context);
        return "Hello from Flutter dongbingbin";
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    platform.setMethodCallHandler(platformCallHandler);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new MyPage(title:"ddddd");
    }));
    //Navigator.pop(context);
  }

  String _batteryLevel = "Unknown battery level.";
  static const platform = const MethodChannel("samples.flutter.io/battery");
  //static const _channel = MethodChannel()


  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      print("dart -_getBatteryLevel");
//      在通道上调用此方法
      final String result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      print("dart -setState");
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:111`',
              style:new TextStyle(color:Colors.red,fontSize:25),
            ),
            new Row(children: <Widget>[
              new Expanded(child:
                  new Padding(
                    child: new Container(
                      //color:Colors.red,
                      child: new Align(
                          //color:Colors.red,
                        alignment: Alignment(-1.0, 1.0),
                        child: new Row(
                          //mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Center(child: new Container(color:Colors.black,width: 5,height: 5,),),
                            new Align(
                              alignment: Alignment(-1.0, -1.0),
                              child: new Container(color: Colors.red,width: 5,height: 5,),
                            ),

                            new Align(
                              alignment: Alignment.bottomRight,
                              child:  new Container(color:Colors.black,width: 5,height: 5,
                              margin: EdgeInsets.only(bottom: 10),
                              ),
                            ),

                          ],
                        ),
                      ),
                      width: 30,height: 40,
                      decoration: const BoxDecoration(
                        //color: Color(0xFFFFFFFFFF),
                            border:Border(
                                top: BorderSide(color: Colors.blue,width: 10),
                                bottom:BorderSide(color: Colors.blue,width: 10),
                          )
                      ),
                    ),
                    padding:EdgeInsets.only(right:20) ,
                  ),
              ),
              new Expanded(child: new Container(color:Colors.green,width: 30,height: 30,)),
            ],),
            Text(
              '$_counter',
              style: new TextStyle(color:Colors.amber),
            ),
            Container(
              height: 250,
              //width: 300,

              child: Column(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: Container(
                      color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.yellow,
                            margin: EdgeInsets.only(left:20,right: 20),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 50,
                              height: 50,
                              color: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 40,
                                height: 20,
                                color: Colors.cyan,
                                margin: EdgeInsets.only(right: 30),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 550,
                                  height:550,
                                  color: Colors.brown,
                                ),
                                new Positioned(
                                  right: 0,
                                  top:0,
                                  left:0,
                                  bottom: 0,
                                  child: new Container(
                                    width: 150,
                                    height: 150,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Image.asset("images/ic_launcher.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Text(_batteryLevel),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      margin: EdgeInsets.only(top: 20),
                      child: new RaisedButton(
                        onPressed: _getBatteryLevel,
                        child: new Text("Get battery level"),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
