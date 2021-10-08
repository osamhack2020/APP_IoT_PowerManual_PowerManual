import 'package:flutter/material.dart';
import 'package:myapp/MenuRow.dart';
import 'package:myapp/exercise/squats/page/finalSquats.dart';
import '../component/squatsImage.dart';
import '../component/dataInput.dart';
import './exerciseSquats.dart';
import 'package:myapp/Font.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  18.0,
  fontWeight: FontWeight.w600
);
final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);
final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 15.0
);


class AfterSquats extends StatelessWidget{
 // const StartSquats({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildReplaceAppBar(),
      body: SingleChildScrollView(
        child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          SizedBox(
            height: 30,
          ),
          
          SquatsImage(),
              DataInput(),

          SizedBox(
            height: 30,
          ),
          Row(
            children: [
            ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> ExerciseSquatsPage())
                );
            },
           child: Text("다음 세트로", style: KorMiddlesytle,)),
           SizedBox(width: 25,),
           ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> FinalSquats())
                );
            },
           child: Text("세트 종료", style: KorMiddlesytle,))
            ],
          )
          
           
           
        ],
      ),
      ),
      
      ),
     
    );
  }
  AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Inter-Set Rest", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
}

