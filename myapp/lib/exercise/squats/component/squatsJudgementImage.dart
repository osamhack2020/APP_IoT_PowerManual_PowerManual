import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  23.0,
  fontWeight: FontWeight.w600
);

final korBaseStyle = const TextStyle(
  fontFamily: "Elice"
);

final KorHeaderStyle= baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:18.0,
  fontWeight: FontWeight.w600,
);

final KorTextStyle= baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:14.0,
  fontWeight: FontWeight.w400,
);

class SquatsJudgementImage extends StatefulWidget {
   @override
    _SquatsJudgementImageState createState() => _SquatsJudgementImageState();
     }
int state=0;
class _SquatsJudgementImageState extends State<SquatsJudgementImage> {
   @override
    Widget build(BuildContext context) {
       return Container(
         
         child: Center(
           
           child: Column(
            
           children: [
             SizedBox(height: 5,),
             Text("Squats", style: headerTextStyle,),
             SizedBox(height: 10,),
             ClipRRect(
            borderRadius: BorderRadius.circular(70.0),
             child: Image.asset(
             "assets/img/squats_standup.jpeg",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            
            ),

          ),
             SizedBox(height: 7,),
             Text('운동 시작 전 자세입니다.', style: KorTextStyle )
             
           ],
         ),
         ),
         
       ); 
    }
 }
