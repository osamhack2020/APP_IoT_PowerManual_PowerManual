

//import 'dart:html';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import '.../MenuRow.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);

final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  18.0,
  fontWeight: FontWeight.w600
);

final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);

final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 12.0
);




class BenchPressDetailPage extends StatelessWidget{



  @override

 


  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
          _getBackground(),
          _getGradient(),
          _getContent(),
          _getToolbar(context),
          ],
        ),
      ),

     






      
    );
  }

}

Container _getBackground(){
  return new Container(
    child: new Image.asset('assets/img/BenchPress_background.jpg',
      fit: BoxFit.cover,
      height: 300.0,
    ),
    constraints: new BoxConstraints.expand(height: 300),
  );
}

Container _getGradient(){
  return new Container(
    margin: new EdgeInsets.only(top: 190.0),
    height: 110.0,
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: <Color>[
          new Color(0x00736AB7),
           new Color(0xFF736AB7)
        ],
        stops: [0.0, 0.9],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
      ),
    ),
  );
}

Widget _getContent(){
  final _overviewTitle="Overview".toUpperCase();

  return new ListView(
    padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: <Widget>[
      new Container(
        height: 200.0,
        margin: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            detailCard,
            benchpressDetailThumbnail,
            //squatsDetailCardContent,
          ],
          ),
      ),
      new Container(
        padding: new EdgeInsets.symmetric(horizontal: 32.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle, style: headerTextStyle,),
              new Separator(),
              new Text("3대 운동 중 하나로 알려진 벤치프레스는 흉근을 중점으로 어깨와 삼두 근육을 성장시킬 수 있는 운동이다. 벤치에 누워 덤벨 혹은 바벨을 가슴과 수직으로 들어올리는 방법으로 운동한다. \n운동을 시작하기 전 운동방법에 대한 충분한 습득과 스트레칭을 통해 부상을 방지해야 한다. 영상을 시청하고 운동을 시작하는 것을 권장한다. \n기기를 양쪽 팔꿈치에 끼우고 운동을 시작하세요.",style: regularTextStyle,)


            ],
          ),
      ),
    ],
  );
}

Container _getToolbar(BuildContext context){
  return new Container(
  
      margin: new EdgeInsets.only(
        top: MediaQuery.of(context).padding.top 
      ),
    );
  
}

class Separator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 8.0),
      height: 2.0,
      width: 18.0,
      color: new Color(0xff00c6ff),
    );
  }
}

//스쿼트 모양
final benchpressDetailThumbnail = new Container(
  margin: new EdgeInsets.fromLTRB(0.0,16.0,0.0,40.0),
  alignment: FractionalOffset.center,
  child: new Image(
    image: new AssetImage('assets/img/benchpress_icon.png' ),//여기
    height: 80.0,
    width: 80.0,
  ),
);

  final benchpressCardContent = Container(
  margin: new EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'Bench Press',//여기
        style: headerTextStyle,
      ),
      //new Container(height: 10.0,),
      new Text(
        '#chest #가슴',//여기
        style: subHeaderTextStyle,
      ),
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff),
      ),
      /*new Row(
        children: <Widget>[
          new Expanded(
            flex: 0,
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),
          new Container(
            width: 32.0,
          ),
          new Expanded(
            flex: 0,
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_gravity.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.gravity", style: regularTextStyle),//여기
                  ]
                ),
          ),
          
          
        ],
      ),*/
    ],
  ),
);

final detailCard = new Container(
  
  child: benchpressCardContent,
  height: 300.0,
  margin: new EdgeInsets.only(top: 72.0),

  decoration: new BoxDecoration(
    color: new Color(0xFF333366),
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(8.0),
    boxShadow: <BoxShadow>[
      new BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
      ),
    ],
  ),
);
/*
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: new Color(0xFFFFEB3B), //색상
      child: Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: colorThemeRed(),
          indicatorWeight: 4,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black38,
          labelStyle: TextStyle(
              fontSize: 17, fontFamilyFallback: fontFamily('Poppins')),
 
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.sort_by_alpha_rounded, size: 20),
              text: 'Vocab',
            ),
            Tab(
              icon: Icon(
                Icons.library_books,
                size: 20,
              ),
              text: 'Library',
            ),
            Tab(
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              text: 'MyPage',
            )
          ],
        ),
      ),
    );
  }
}*/