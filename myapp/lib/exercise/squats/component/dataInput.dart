import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';
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
                controller: weightInputController,
              ),
            
          
          

            
              TextField(
                decoration: new InputDecoration(
                  label: Text("Weight", style: subHeaderTextStyle),
                  hintText: "다음 세트에 수행할 무게를 입력하세요"
                ),
                controller: setsInputController,
              ),
              Text("$weightInputController"),
            ],
          
        
      ),
    );
  }
}
