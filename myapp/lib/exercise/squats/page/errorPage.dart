

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
                    child: Image.asset("assets/img/range_of_motion.png", width: 400, height: 300,),
                    flex: 1,
                    ),
                 
                  Expanded(child: Text("가동범위 부족\n 스쿼트 운동 시 허벅지를 지면과 수평할 때까지 내려가야 좋은 운동 효과를 얻을 수 있습니다. 부상을 주의하며 가능한 깊게 내려가며 운동하세요 "
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
                    child: Image.asset("assets/img/knee_angle.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                    
                    
                  Expanded(child: Text("무릎 각도 부적절\n 스쿼트 운동 중 무릎 각도는 바깥쪽을 향해야 합니다.(약 30도에서 40도) 무릎 각도를 11자에 가깝게 운동할 경우 깊게 앉을 수 없을뿐만 아니라 무릎 부상을 초래하라 수 있습니다."
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
                    child: Image.asset("assets/img/knee.png", width: 300, height: 300,),
                    flex: 1,
                    ),
                 
                  Expanded(child: Text("무릎위치문제\n 가급적 무릎이 발가락보다 앞에 나가지 않도록 하는 것이 좋습니다. 잘못된 무릎위치는 통증을 유발할 수 있습니다."
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
