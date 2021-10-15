import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';

class MotivationIMG3 extends StatelessWidget{
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
             "assets/img/motivation3.jpg",
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
        Text("힘은 물리적인 능력에서 나오는 것이 아니라 꺽을 수 없는 의지에서 나온다.",
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