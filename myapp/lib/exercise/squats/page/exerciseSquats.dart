import 'package:flutter/material.dart';
import 'package:myapp/exercise/squats/component/exercisePageButton.dart';
import '../component/squatsJudgementImage.dart';
import '../component/weightSetCount.dart';
import '../component/squatsCount.dart';
class ExerciseSquatsPage extends StatefulWidget {
   @override
    _ExerciseSquatsPageState createState() => _ExerciseSquatsPageState();
     }

class _ExerciseSquatsPageState extends State<ExerciseSquatsPage> {
   @override
    Widget build(BuildContext context) {
       return Scaffold(
         appBar: _buildReplaceAppBar(),
         body: SingleChildScrollView(
          child:Center(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SquatsJudgementImage(),
               WeightSetCount(),
               SquatsCount(),
               ExercisePageButoon(),
             ],
           ),
          ),
           
         ),
       ); 
    }
    AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Excercise Squats", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
 }

