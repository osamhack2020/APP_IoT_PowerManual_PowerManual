import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';
import 'package:myapp/motivation/component/motivationImg1.dart';
import 'package:myapp/motivation/component/motivationImg2.dart';
import 'package:myapp/motivation/component/motivationImg3.dart';
import 'package:myapp/motivation/component/motivationImg4.dart';

class MotivationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: _buildReplaceAppBar(),
      body: Center(
        child:SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                  MotivationIMG1(),
                  MotivationIMG2(),
                  MotivationIMG3(),
                  MotivationIMG4()
                ],
             ),
              
                
            )  
      ),
         
                      
    
         
      
    );
  }
  AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Motivation", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
}