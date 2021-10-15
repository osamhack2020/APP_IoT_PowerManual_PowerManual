import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';
import 'package:myapp/exercise/squats/page/startSquats.dart';
import '../page/startSquats.dart';
final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);




class DataInput extends StatelessWidget{
  @override
  String weightInput="";
  String setsInput="";

final weightInputController=TextEditingController();
final setsInputController=TextEditingController();
  Widget build(BuildContext context){
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
            
              TextField(
                
                decoration: new InputDecoration(
                  label: Text("Count", style: subHeaderTextStyle),
                  hintText: "다음 세트에 수행할 갯수를 입력하세요"
                ),
                onChanged: (val) => setsInput=val,
                controller: weightInputController,
              ),
            
          
          

            
              TextField(
                decoration: new InputDecoration(
                  label: Text("Weight", style: subHeaderTextStyle),
                  hintText: "다음 세트에 수행할 무게를 입력하세요"
                ),
                onChanged: (val) => weightInput=val,
                controller: setsInputController,
              ),
              Text("무게는 : ${weightInputController.text} 혹은 $weightInput"),
              Text("세트는 : ${setsInputController.text} 혹은 $setsInput"),
              
            ],
          
        
      ),
    );
  }
}
