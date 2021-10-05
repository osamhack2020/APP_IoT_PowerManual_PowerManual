import 'package:flutter/material.dart';

class WeightSetCount extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('무게'),
              Text('xxKG'),
            ],
          ),
          Row(
            children: [
              Text('현재 세트'),
              Text('1 SET'),
            ],
          )
        ],
      ),
    );
  }
}