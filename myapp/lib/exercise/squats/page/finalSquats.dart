import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';
import 'package:myapp/HomePage.dart';
import 'package:myapp/exercise/benchPress/component/benchPressCount.dart';
final KorBlackHeaderStyle= KorHeaderStyle.copyWith(
  color: Colors.black,
  fontSize:23.0,
  fontWeight: FontWeight.w600,
);

final KorTextStyle= baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:15.0,
  fontWeight: FontWeight.w600,
);

final korBlackLineStyle=korLineStyle.copyWith(
  fontSize: 15.0,
  color: Colors.grey[600],
);

class FinalSquats extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
        
          child: Image.asset(
             "assets/img/stimulation/stimulation1.jpg",
              width: 400,
              height: 200,
              fit: BoxFit.fill,
            
            ),

        ),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("SETS", style: MiddleTextStyle,),
                 SizedBox(width: 5,),
                 Text("5", style: headerTextStyle,),
                 SizedBox(width: 15,),
                 Text("Total", style: MiddleTextStyle,),
                 SizedBox(width: 5,),
                 Text("40", style: headerTextStyle,),
               ],
             ),
             SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("정확한갯수:", style:KorMiddlesytle),
                  SizedBox(width:5),
                  Text("30", style: correctHeaderTextStyle,),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  
                  Text("무릎각도:", style:KorMiddlesytle),
                  SizedBox(width:5),
                  Text("3", style: wrongHeaderTextStyle,),
                  SizedBox(width: 15,),
                  Text("무릎넓이:", style:KorMiddlesytle),
                  SizedBox(width:5),
                  Text("3", style: wrongHeaderTextStyle,),
                ],
              ),
              SizedBox(height: 5,),
               Row(
                children: [
                  Text("가동범위부족:", style:KorMiddlesytle),
                  SizedBox(width:5),
                  Text("3", style: wrongHeaderTextStyle,),
                  SizedBox(width: 15,),
                  Text("기타문제:", style:KorMiddlesytle),
                  SizedBox(width:5),
                  Text("1", style: wrongHeaderTextStyle,),
                ],
                
              ),
              SizedBox(height: 10,),
              ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> HomePage())
              );
            },
                 child: Text("시작화면으로", style: KorHeaderStyle,))
               
            
            ],
          ),
        ),
      ),
    );
  }
}