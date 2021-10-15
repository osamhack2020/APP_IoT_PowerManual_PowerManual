import 'package:flutter/material.dart';
import 'package:myapp/MenuRow.dart';
import '../component/squatsImage.dart';
import '../component/dataInput.dart';
import './exerciseSquats.dart';
import 'package:flutter/widgets.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);
final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize:  18.0,
  fontWeight: FontWeight.w600
);
final regularTextStyle = baseTextStyle.copyWith(
  color: const Color(0xffb6b2df),
  fontSize: 9.0,
  fontWeight: FontWeight.w400
);




class StartsSquats extends StatefulWidget{
   @override
    _StartsSquatsState createState() => _StartsSquatsState();
     }

class _StartsSquatsState extends State<StartsSquats> {
   @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildReplaceAppBar(),
      body: SingleChildScrollView(
        child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          SizedBox(
            height: 30,
          ),
          
          SquatsImage(),
              DataInput(),


          SizedBox(
            height: 30,
          ),
          
          Text("세트1 = $DataInput.setsInput"),
          
          
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> ExerciseSquatsPage())
                );
              
            },
           child: Text("운동 시작하기"))
        ],
      ),
      ),
      
      ),
     
    );
    }
    AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Excercise Squats", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
 }
/*
class StartSquats extends StatelessWidget{
 // const StartSquats({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildReplaceAppBar(),
      body: SingleChildScrollView(
        child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          SizedBox(
            height: 30,
          ),
          
          SquatsImage(),
              DataInput(),

          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> ExerciseSquatsPage())
                );
              
            },
           child: Text("운동 시작하기"))
        ],
      ),
      ),
      
      ),
     
    );
  }
  AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Befor Start", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
}

*/

/*
class StartSquats extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("ㅁㄴㅇㄹ", ),
            SquatsImage(),
            DataInput(),
            SquatsCard(),

          ],
        ),
      )
      ),
    ); 
    
  }
}*/