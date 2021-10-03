import 'package:flutter/material.dart';
import 'package:myapp/detail/benchpressCard/BenchPressBeforeStart.dart';
import 'package:myapp/detail/squatsCard/SquatsBeforeStart.dart';
import 'alarmpage/alarmtest.dart';



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













 Widget _planetValue({required String value, required String image}){
   return new Row(
     children: <Widget>[
       new Image.asset(image, height: 12.0,),
       new Container(width: 8.0,),
       new Text("planet.gravity", style: regularTextStyle,)
      ],
     );
 } 

final squatsCardContent = Container(
  margin: new EdgeInsets.fromLTRB(120.0, 16.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'Squats',//여기
        style: headerTextStyle,
      ),
      new Container(height: 10.0,),
      new Text(
        '#legs #하체',//여기
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
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),

          new Expanded(
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

final benchpressCardContent = Container(
  margin: new EdgeInsets.fromLTRB(120.0, 16.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'BenchPress',//여기
        style: headerTextStyle,
      ),
      new Container(height: 10.0,),
      new Text(
        '#Chest #가슴',//여기
        style: subHeaderTextStyle,
      ),
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff),
      ),
/*
      new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),

          new Expanded(
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


final alarmCardContent = Container(
  margin: new EdgeInsets.fromLTRB(120.0, 16.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'Alarm',//여기
        style: headerTextStyle,
      ),
      new Container(height: 10.0,),
      new Text(
        '#Alarm #보충제 시간 알람. #먹는것까지 운동',//여기
        style: subHeaderTextStyle,
      ),
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff),
      ),
      /*
      new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),

          new Expanded(
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

final settingCardContent = Container(
  margin: new EdgeInsets.fromLTRB(120.0, 16.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'Setting',//여기
        style: headerTextStyle,
      ),
      new Container(height: 10.0,),
      new Text(
        '#sensor #센서 설정',//여기
        style: subHeaderTextStyle,
      ),
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff),
      ),
      /*
      new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),

          new Expanded(
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

final dataCardContent = Container(
  margin: new EdgeInsets.fromLTRB(120.0, 16.0, 16.0, 16.0),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height:4.0),
      new Text(
        'Record',//여기
        style: headerTextStyle,
      ),
      new Container(height: 10.0,),
      new Text(
        '#Record #운동 기록 확인',//여기
        style: subHeaderTextStyle,
      ),
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff),
      ),
      /*
      new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
                  children: <Widget>[
                    //new Image.asset("assets/img/ic_distance.png", height: 12.0),
                    new Container(width: 8.0),
                    new Text("planet.distance", style: regularTextStyle),//여기
                  ]
            ),
          ),

          new Expanded(
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



class SquatsCard extends StatelessWidget{
  @override

  

final squatsThumbnail = new Container(
  margin: new EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: new Image(
    image: new AssetImage('assets/img/squats_icon.png' ),//여기
    height: 92.0,
    width: 92.0,
  ),
);

final squatsMenuCard = new Container(
  child: squatsCardContent,
  height: 120.0,
  margin: new EdgeInsets.only(left: 46.0),

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

  Widget build(BuildContext context){
    return new GestureDetector(
      child: Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          squatsMenuCard,
          squatsThumbnail,
          
        ]
        )
      ),
      onTap: (){
        Navigator.push(
          context,
           MaterialPageRoute(builder: (context)=>SquatsPage()),
                  
          );
      },
    );
  }

}

class BenchpressCard extends StatelessWidget{
  @override
  
  final benchpressThumbnail = new Container(
  margin: new EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: new Image(
    image: new AssetImage('assets/img/benchpress_icon.png' ),//여기
    height: 92.0,
    width: 92.0,
  ),
  );

final benchpressMenuCard = new Container(
  child: benchpressCardContent,
  height: 120.0,
  margin: new EdgeInsets.only(left: 46.0),

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


  Widget build(BuildContext context){
    return new GestureDetector(
      child: Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          benchpressMenuCard,
          benchpressThumbnail,
          
        ]
        )
      ),
      onTap:(){
        Navigator.push(
          context, 
         MaterialPageRoute(builder: (context)=>BenchPressPage()),
         
        );
      }
    );
  }


}

class Alarmcard extends StatelessWidget{
  @override

  final alarmThumbnail = new Container(
  margin: new EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: new Image(
    image: new AssetImage('assets/img/alarm.png' ),//여기
    height: 92.0,
    width: 92.0,
  ),
);
  final alarmMenuCard = new Container(
  child: alarmCardContent,
  height: 120.0,
  margin: new EdgeInsets.only(left: 46.0),

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
  
  Widget build(BuildContext context){
    return new GestureDetector(
      child: Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          alarmMenuCard,
          alarmThumbnail,
          
        ]
        )
      ),
      onTap:(){
        Navigator.push(
          context, 
         MaterialPageRoute(builder: (context)=>AlarmTest()),
         
        );
      }
    );
  }

}

class Setting extends StatelessWidget{
  @override

  final settingThumbnail = new Container(
  margin: new EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: new Image(
    image: new AssetImage('assets/img/setting_icon.png' ),//여기
    height: 92.0,
    width: 92.0,
  ),
);
final settingMenuCard = new Container(
  child: settingCardContent,
  height: 120.0,
  margin: new EdgeInsets.only(left: 46.0),

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
  Widget build(BuildContext context){
    return new GestureDetector(
      child: Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          settingMenuCard,
          settingThumbnail,
          
        ]
        )
      ),
      onTap:(){
        Navigator.push(
          context, 
         MaterialPageRoute(builder: (context)=>SquatsPage()),
         
        );
      }
    );
  }

}

class Data extends StatelessWidget{
  @override
  final dataThumbnail = new Container(
  margin: new EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: new Image(
    image: new AssetImage('assets/img/data_icon.png' ),//여기
    height: 92.0,
    width: 92.0,
  ),
);
final dataMenuCard = new Container(
  child: dataCardContent,
  height: 120.0,
  margin: new EdgeInsets.only(left: 46.0),

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

Widget build(BuildContext context){
    return new GestureDetector(
      child: Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          dataMenuCard,
          dataThumbnail,
          
        ]
        )
      ),
      onTap:(){
        Navigator.push(
          context, 
         MaterialPageRoute(builder: (context)=>SquatsPage()),
         
        );
      }
    );
  }
}

/*
class PlanetRow extends StatelessWidget {
  //final Planet planet;
  //PlanetRow({required this.planet});
  @override


  







  
  Widget build(BuildContext context) {
    return new Column(
      children: [
        
        new Container(
          
          //스쿼트
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          menuCard,
          squatsThumbnail,
          squatsCardContent,
        ]
        )
        ),
        new Container(
          //벤치프레스
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          menuCard,
          benchpressThumbnail,
          benchpressCardContent,
        ]
        )
        ),
         new Container(
           //데드리프트
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          menuCard,
          deadliftThumbnail,
          deadliftCardContent,
        ]
        )
        ),
        new Container(
           //센서 설정
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          menuCard,
          settingThumbnail,
          settingCardContent,
        ]
        )
        ),
        new Container(
           //기록 확인
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 24.0,
        ),
        child: new Stack(children: <Widget>[
          menuCard,
          dataThumbnail,
          dataCardContent,
        ]
        )
        ),
      ],
        );
      
        
  }
 
}*/