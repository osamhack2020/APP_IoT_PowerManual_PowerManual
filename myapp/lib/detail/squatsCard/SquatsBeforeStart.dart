

//import 'dart:html';



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import '/workspaces/APP_IoT_PowerManual_PowerManual/myapp/lib/MenuRow.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:myapp/detail/bluetoothConnect.dart';
import 'package:myapp/replace/page/replaceSquatsPage.dart';
import '../youtubelink/SquatsStrechingYoutube.dart';
import '../youtubelink/HowToSquatsYoutube.dart';
import 'SquatsDetail.dart';

class SquatsPage extends StatefulWidget{
  @override
 
  _SquatsPage createState() => _SquatsPage();
}

class _SquatsPage extends State<SquatsPage>{
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
      
       
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BTConnect(title: "test",)),
            );
          },
          label: const Text(""),
          icon: const Icon(Icons.bluetooth),
          
          ),
      
    );
}

List _widgetOptions = [
    SquatsDetailPage(),
    SquatsStrechingYoutubePlayerDemo(title: "Squats Streching",),
    HowtoSquatsYoutubePlayerDemo(title: "How to Squats"),
   
    replaceSquatsPage(),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
  ];
}