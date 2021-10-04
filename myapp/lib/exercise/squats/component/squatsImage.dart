import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  18.0,
  fontWeight: FontWeight.w600
);


class SquatsImage extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return new Container(
      child: Column(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
        
          child: Image.asset(
             "assets/img/squats_start_image.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            
            ),

        ),
          Text("Squats", style: headerTextStyle,),
        ],
        ),
    );
  }
}