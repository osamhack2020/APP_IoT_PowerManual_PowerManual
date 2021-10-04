import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);
final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 15.0
);

class DataInput extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Count", style: subHeaderTextStyle,),
              TextField(
                decoration: new InputDecoration(
                  hintText: "다음 세트에 수행할 갯수를 입력하세요"
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("Weight", style: subHeaderTextStyle,),
              TextField(
                decoration: new InputDecoration(
                  hintText: "다음 세트에 수행할 무게를 입력하세요"
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
