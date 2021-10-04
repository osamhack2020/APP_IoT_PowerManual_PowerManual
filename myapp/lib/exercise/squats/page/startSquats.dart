import 'package:flutter/material.dart';
import '../component/squatsImage.dart';
import '../component/dataInput.dart';

class StartSquats extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Expanded(
      
      child: SingleChildScrollView(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ㅁㄴㅇㄹ", ),
            SquatsImage(),
            DataInput(),

          ],
        ),
      ),
    );
  }
}