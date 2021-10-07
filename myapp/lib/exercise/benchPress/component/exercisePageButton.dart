import 'package:flutter/material.dart';
class ExercisePageButoon extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           ElevatedButton(
            onPressed: (){
              //Navigator.push(
              //  context,
                // MaterialPageRoute(builder: (context)=> ())
               // );
            },
           child: Text("자세 설명 보기")
           ),
           SizedBox(width: 30,),
           ElevatedButton(
            onPressed: (){
              //Navigator.push(
              //  context,
                // MaterialPageRoute(builder: (context)=> ())
               // );
            },
           child: Text("세트 마무리")
           )
        ],
      ),
    );
}
}