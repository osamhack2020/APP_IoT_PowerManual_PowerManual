import 'package:flutter/material.dart';

import 'package:android_alarm_manager/android_alarm_manager.dart';


class AlarmTest extends StatefulWidget{
  @override
  
  _MyAppState createState() => _MyAppState();
}

showpinrt(){
    print('alarm done');
  }




class _MyAppState extends State<AlarmTest>{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlinedButton(
            child: Text('Alarm Now'),
            onPressed: (){
              AndroidAlarmManager.oneShot(Duration(seconds: 3), 0, showpinrt());
            },
          ),
        ),
      ),
    );
  }
}