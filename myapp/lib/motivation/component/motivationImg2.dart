import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';

class MotivationIMG2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: new BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.black,
        ),
        borderRadius: new BorderRadius.circular(30.0),
        
        color: new Color(0xFF333366)
      ),
      
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.all(30.0),
      child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70.0),
          child: Image.asset(
             "assets/img/motivation2.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            
            ),

        ),
        SizedBox(height: 10,),
        Text(
          "",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600
            ),
        ),
        SizedBox(height: 10,),
        Text("너의 몸은 거의 버틸 수 있다. 너의 정신력을 믿으면 된다.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        ),
      ],
    ),
    );
    
  }
}