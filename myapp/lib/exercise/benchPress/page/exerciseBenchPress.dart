//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp/exercise/squats/component/exercisePageButton.dart';
import '../component/benchPressJudgementImage.dart';
import '../component/weightSetCount.dart';
import '../component/benchPressCount.dart';
class ExerciseBenchPressPage extends StatefulWidget {
   @override
    _ExerciseBenchPressPageState createState() => _ExerciseBenchPressPageState();
     }

class _ExerciseBenchPressPageState extends State<ExerciseBenchPressPage> {
   @override
    Widget build(BuildContext context) {
       return Scaffold(
         appBar: _buildReplaceAppBar(),
         body: SingleChildScrollView(
          child:Center(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               BenchPressJudgementImage(),
               SizedBox(height: 10,),
               WeightSetCount(),
               SizedBox(height: 7,),
               BenchPressCount(),
               SizedBox(height: 15,),
               ExercisePageButoon(),
             ],
           ),
          ),
           
         ),
       ); 
    }
    AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Excercise BenchPress", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
 }

