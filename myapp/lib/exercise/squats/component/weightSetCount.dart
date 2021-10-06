import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';

class WeightSetCount extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Container(
      child: Center(
        child: Column(
        children: [
          Row(
            children: [
              Text('무게:', style: korLineStyle,),
              SizedBox(width: 10,),
              Text('xx', style: regularTextStyle,),
              SizedBox(width: 3,),
              Text('KG', style: subHeaderTextStyle,)
            ],
          ),
          Row(
            children: [
              Text('갯수:', style: korLineStyle,),
              SizedBox(width: 10,),
              Text('xx', style: regularTextStyle,),
              SizedBox(width: 3,),
              Text('SETS', style: subHeaderTextStyle,)
            ],
          )
        ],
      ),
      ),
      
    );
  }
}