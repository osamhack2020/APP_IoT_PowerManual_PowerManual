import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  23.0,
  fontWeight: FontWeight.w600
);

final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 12.0,
  fontWeight: FontWeight.w400
);

final MiddleTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 18.0,
  fontWeight: FontWeight.w400
);

final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 15.0
);

final korBaseStyle = const TextStyle(
  fontFamily: "Elice"
);

final KorHeaderStyle= baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:23.0,
  fontWeight: FontWeight.w600,
);


final KorMiddlesytle = KorHeaderStyle.copyWith(
  color: Color(0xffb6b2df),
  fontSize: 20,
);

final KorTextStyle= baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:15.0,
  fontWeight: FontWeight.w400,
);

final korLineStyle=baseTextStyle.copyWith(
  fontSize: 12.0,
);
final correctHeaderTextStyle = baseTextStyle.copyWith(
  color: Colors.greenAccent,
  fontSize:  23.0,
  fontWeight: FontWeight.w600
);

final wrongHeaderTextStyle = correctHeaderTextStyle.copyWith(
  color: Colors.redAccent,

  
);