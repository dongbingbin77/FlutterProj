

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter/actions/actions.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.dart';
import 'dart:convert';

import 'package:my_flutter/models/app_state.dart';
import 'package:redux/redux.dart';
//
//class MyPage extends StatelessWidget{
//  MyPage({Key key,this.title}):super(key:key);
//
//  final String title;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Text("123321");
//  }
//
//}

// ignore: must_be_immutable
class MyPage extends StatefulWidget{

   String title;
  MyPage({Key key,this.title}):super(key:key);



  @override
  _MyPageState createState() {
    // TODO: implement createState
    return new _MyPageState();
  }
}

class _MyPageState extends State<MyPage>{
  static const EventChannel eventChannel = const EventChannel('samples.flutter.io/charging');
  StreamSubscription _timerSubscription ;
  @override
  void initState() {
    super.initState();

    debugPrint('initState');
    //postNet_2();

    readFlashSalse();
    readBanner();
    _timerSubscription = eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  String _content;

  readFlashSalse() async {
    var result = await DefaultAssetBundle.of(context).loadString('jsons/flash_sales.json');
    debugPrint(result);
  }

  readBanner() async{
    var result = await DefaultAssetBundle.of(context).loadString('jsons/home_page_banner.json');
    Map bannerMap = jsonDecode(result);
    var bannerContainer = HomePageBannerContainer.fromJson(bannerMap);
    debugPrint("dongbingbin "+bannerContainer.data.head.elementAt(0).bannerImage);
  }


  void postNet_2() async {
    var params = Map<String, String>();
    params["username"] = "hellonews";
    params["password"] = "123456";

    var client = http.Client();
    var response = await client.post("http://wanandroid.com/wxarticle/chapters/json", body: params);
    _content = response.body;
    debugPrint(_content);
    var result = jsonDecode(_content);
    debugPrint(result["data"][0]["name"]);
  }

  @override
  void dispose(){
    super.dispose();
    _timerSubscription.cancel();
  }

  String _chargingStatus;
  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出当前界面'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop();
            },
            child: new Text('确定'))
      ]),
    );
  }
  Future<bool> _onWillPop() {
    //Navigator.pop(context);
    _showDialog();
    return Future.value(false);
  }
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
        child: new Scaffold(
          body:LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: Colors.yellow,
                      height: 120.0,
                      margin: EdgeInsets.only(bottom: 20),
                      child: StoreConnector<AppState, int>(
                        converter: (Store<AppState> store) {
                          return store.state.count;
                        },
                        builder: (BuildContext context, int count) {
                          return Text("$count");
                        },
                      ),
                    ),
                    new GestureDetector(
                        onTap: (){
                          print("Container clicked");

                          StoreProvider.of<AppState>(context).dispatch(AddAction());
                        },
                        child: new Container(
                          width: 500.0,
                          padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                          color: Colors.green,
                          child: new Column(
                              children: [
                                new Text("Ableitungen"),
                              ]
                          ),
                        )
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.green,
                      height: 120.0,
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      // A fixed-height child.
                      color: Colors.yellow,
                      height: 120.0,
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.red,
                      height: 120.0,
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.green,
                      height: 120.0,
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.red,
                      height: 120.0,
                      child: new Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.network(
                            "http://via.placeholder.com/288x188",
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 10,
                        viewportFraction: 0.8,
                        scale: 0.9,
                      ),
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                ),
              );
            },
          )
        ),
        onWillPop: _onWillPop
    );
  }

}
