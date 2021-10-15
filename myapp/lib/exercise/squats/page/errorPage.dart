

import 'package:flutter/material.dart';

class SquatsErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildReplaceAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset("assets/img/error_test.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                 Expanded(
                   child: VerticalDivider(
                       thickness: 1,
                        color: Colors.grey, 
                   ),),
                  Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  ), flex: 3,)
                ],
              ),
              Divider(
    thickness: 1,
    color: Colors.grey,
),
SizedBox(height:3),
               Row(
                children: [
                  Expanded(
                    child: Image.asset("assets/img/error_test.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                    Expanded(
                   child: VerticalDivider(
                       thickness: 1,
                        color: Colors.grey, 
                   ),),
                    
                  Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  ), flex: 3,)
                ],
              ),
               Divider(
    thickness: 1,
    color: Colors.grey,
),
SizedBox(height:3),
               Row(
                children: [
                  Expanded(
                    child: Image.asset("assets/img/error_test.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                 Expanded(
                   child: VerticalDivider(
                       thickness: 1,
                        color: Colors.grey, 
                   ),),
                  Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  ), flex: 3,)
                ],
              ),
              Divider(
    thickness: 1,
    color: Colors.grey,
),
SizedBox(height:3),
               Row(
                children: [
                  Expanded(
                    child: Image.asset("assets/img/error_test.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                  Expanded(
                   child: VerticalDivider(
                       thickness: 1,
                        color: Colors.grey, 
                   ),),
                  Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  ), flex: 3,)
                ],
              ),
            ],
          ),
          ),
      )
    );
  }
   AppBar _buildReplaceAppBar() => AppBar(
    //backgroundColor: Colors.white,
    title: Text("Exercise Error", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    actions: [
      //Icon(Icons.thumb_up_off_alt, color: Colors.black,),
    ],
  );
}
