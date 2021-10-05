import 'package:flutter/material.dart';

class SquatsCount extends StatefulWidget {
   @override
    _SquatsCountState createState() => _SquatsCountState();
     }

class _SquatsCountState extends State<SquatsCount> {
   @override
    Widget build(BuildContext context) {
       return Container(
         child: Column(
           children: [
             Row(
               children: [
                 Text("개수"),
                SizedBox(width: 20,),
                 Text("10"),
                 SizedBox(width: 20,),
                 Text("수행갯수"),
               ],
             ),
             Row(
               children: [
                 Text("정확한 갯수"),
                 SizedBox(width: 20,),
                 Text("5"),
               ],
             ),
              Row(
               children: [
                 Text("가동범위부족"),
                 SizedBox(width: 10,),
                 Text("5"),
                 SizedBox(width: 20,),
                 Text("무릎각도부적절"),
                 SizedBox(width: 10,),
                 Text("5"),
                 SizedBox(width: 20,),
                 Text("무릎 위치 조절"),
                 SizedBox(width: 10,),
                 Text("5"),
                
               ],
             ),
           ],
         ),
       );
    }
    
 }