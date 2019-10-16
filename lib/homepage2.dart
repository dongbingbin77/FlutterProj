import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter/actions/actions.dart';
import 'package:my_flutter/home_widget/IconTitleWidget.dart';
import 'package:my_flutter/models/HomePageBanner/HomePageBannerContainer.dart';
import 'package:my_flutter/models/HomePageBanner/IconTitleModel.dart';
import 'dart:convert';

import 'package:my_flutter/models/app_state.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class HomePage2 extends StatefulWidget{

  String title;
  HomePage2({Key key,this.title}):super(key:key);



  @override
  _HomePageState createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage2>{

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

  List<IconTitleModel> getIconTitleList(){
    return List.of([
      new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ,new IconTitleModel("images/ic_launcher.png", "酒店")
      ,new IconTitleModel("images/ic_launcher.png", "酒店")
      ,new IconTitleModel("images/ic_launcher.png", "酒店")
      ,new IconTitleModel("images/ic_launcher.png", "酒店")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
            body:LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: Container(
                    //color: Colors.blue,
                    margin: EdgeInsets.only(left:15,right: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height:44,
                          child: Row(

                            children: <Widget>[
                              Container(
                                margin:EdgeInsets.only(right:15),
                                child: Text("321"),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    height: 28,
                                    decoration: new BoxDecoration(
                                      color: Color.fromARGB(255, 241, 241, 241),
                                      //color: Colors.white,
                                      //设置四周圆角 角度
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      //设置四周边框
                                      border: new Border.all(width: 1, color:Color.fromARGB(255, 241, 241, 241)),
                                    ),

                                  //alignment: Alignment(0, 0),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("images/ic_launcher.png")
                                      ,
                                      Text("东方明珠",style: TextStyle(
                                          color:Color.fromARGB(255,153,153,153),
                                      ),)
                                    ],
                                  )


                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left:12,right: 14),
                                child: Text("321"),
                              ),

                              Text("321")
                            ],
                          ),
                          //color: Colors.yellow,
                        ),
                        Container(
                          //color: Colors.grey,
                          margin: EdgeInsets.only(top:15),
                          width: double.infinity,

                          //height:100,
                          child: GridView.builder(
                              scrollDirection:Axis.vertical,
                            shrinkWrap:true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                //childAspectRatio: .5 //显示区域宽高相等
                            )
                            , itemBuilder: (context,index){
                            IconTitleModel model = getIconTitleList().elementAt(index);
                            IconTitleWidget w = IconTitleWidget(model.icon, model.name,(name1)=>
                              //debugPrint(name1)
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      content: Text(name1),
                                    );
                                  },
                              )
                            );
                            return w;
                          }
                            ,itemCount: getIconTitleList().length,).build(context),
                        )
                      ],
                    ),
                  )
                );
              },
            )
        ),
        onWillPop: _onWillPop
    );
  }
}