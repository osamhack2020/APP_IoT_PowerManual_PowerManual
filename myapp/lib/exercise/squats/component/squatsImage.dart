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
          CircleAvatar(
            radius: 20,
            backgroundImage: new AssetImage('assets/img/squats_start_image.jpg'),
          ),
          Text("Squats", style: headerTextStyle,),
        ],
        ),
    );
  }
}