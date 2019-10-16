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

// ignore: must_be_immutable
class HomePage extends StatefulWidget{

  String title;
  HomePage({Key key,this.title}):super(key:key);



  @override
  _HomePageState createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  Future<bool> _onWillPop() {
    //Navigator.pop(context);
    //_showDialog();
    return Future.value(false);
  }


  @override
  void initState() {
    readBanner();
  }

  readBanner() async{
    var result = await DefaultAssetBundle.of(context).loadString('jsons/home_page_banner.json');
    Map bannerMap = jsonDecode(result);
    var bannerContainer = HomePageBannerContainer.fromJson(bannerMap);

    StoreProvider.of<AppState>(context).dispatch(GetBannerAction(bannerContainer));
    debugPrint("dongbingbin "+bannerContainer.data.head.elementAt(0).bannerImage);
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
                        height: 185.0,
                        margin: EdgeInsets.only(bottom: 20),
                        child: StoreConnector<AppState, HomePageBannerContainer>(
                          converter: (Store<AppState> store) {
                            debugPrint("Store Connector ");
                            return store.state.banner;
                          },
                          builder: (BuildContext context, HomePageBannerContainer banner) {
                            return new Swiper(
                              itemBuilder: (BuildContext context, int index) {
                               // debugPrint("dongbingbin image:"+banner.data.head[index].bannerImage);
                                return new Image.network(
                                  banner.data.head[index].bannerImage,
                                  fit: BoxFit.fill,
                                );
                              },
                              index: 110,
                              itemCount: banner.data.head.length,
                              viewportFraction: 1,
                              //loop: banner.data.head.length>0,
                              scale: 1,
                              //autoplay: false,
                              control: new SwiperPagination(
                                  margin: new EdgeInsets.all(1.0),
                                builder: new DotSwiperPaginationBuilder(
                                    activeColor:Color.fromRGBO(235, 94, 24, 1),
                                    size: 5,
                                    activeSize: 5,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                         // padding: EdgeInsets.all(8.0),
                          itemExtent: 50.0,
                          itemCount: 30,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 30,
                                color: Colors.blue,
                                child:Text('entry $index')
                            );
                          },
                        ),
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
                      new GestureDetector(
                          onTap: (){
                            print("Container clicked");

                            StoreProvider.of<AppState>(context).dispatch(AddAction(35));
                          },
                          child: new Container(
                            width: 500.0,
                            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                            color: Colors.black12,
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