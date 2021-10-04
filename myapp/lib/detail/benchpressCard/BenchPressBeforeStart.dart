

//import 'dart:html';



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import '/workspaces/APP_IoT_PowerManual_PowerManual/myapp/lib/MenuRow.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:myapp/exercise/benchPress/page/startBenchPress.dart';
import 'package:myapp/replace/page/replaceBenchPressPage.dart';
import '../youtubelink/BenchPressStrechingYoutube.dart';
import '../youtubelink/HowToBenchPressYoutube.dart';
import 'BenchPressDetail.dart';
import 'package:myapp/detail/bluetoothConnect.dart';
import 'package:myapp/exercise/benchPress/page/startBenchPress.dart';


class BenchPressPage extends StatefulWidget{
  @override
 
  _BenchPressPage createState() => _BenchPressPage();
}

class _BenchPressPage extends State<BenchPressPage>{
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('info'), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            title: Text('stretching'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.duo_rounded),
            title: Text('guide'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_replace),
            title: Text('replace'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text('exercise'), 
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BTConnect(title: "Bluetooth Connect",)),
            );
          },
          //label: const Text(""),
          child: Icon(Icons.bluetooth),
          
          ),

    );
}

List _widgetOptions = [
    BenchPressDetailPage(),
    BenchPressStrechingYoutubePlayerDemo(title: "Bench Press Streching",),
    HowtoBenchPressYoutubePlayerDemo(title: "How to Bench Press"),
    replaceBenchPressPage(),
    
    StartBenchPress(),
  ];
}