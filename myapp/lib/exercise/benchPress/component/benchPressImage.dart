import 'package:flutter/material.dart';
import '../component/benchPressImage.dart';
import '../component/dataInput.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  18.0,
  fontWeight: FontWeight.w600
);


class BenchPressImage extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return new Container(
      child: Column(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
        
          child: Image.asset(
             "assets/img/benchpress_start_image.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            
            ),

        ),
          Text("Bench Press", style: headerTextStyle,),
        ],
        ),
    );
  }
}