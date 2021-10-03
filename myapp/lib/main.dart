import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
//import 'package:myapp/alarmpage/alarmTest.dart';
import 'package:myapp/detail/squatsCard/SquatsBeforeStart.dart';
import 'package:myapp/detail/youtubelink/SquatsStrechingYoutube.dart';
import './HomePage.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   AndroidAlarmManager.initialize();
  
  runApp(new MaterialApp(
    title:"Power Maual",
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF736AB7)),
    
    home: new HomePage(),
    //home: new Alarm_teset_page(),
  ));
}

