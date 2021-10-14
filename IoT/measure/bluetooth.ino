//블루투스 통신



#include <SoftwareSerial.h>
#include <MsTimer2.h>
SoftwareSerial blue(2,3);
String sth=" ";
int command=0;
boolean flag=false;

void checking() {
  //led 켬
  if(blue.available()){//들어온 명령이 있을 때
    while (blue.available()>1){//여러명령이 들어왔을경우 마지막 명령만 실행
      blue.read();
    }
    command=static_cast<int>(blue.read());
    switch(command){
      case 11://첫번째 종류의 운동(스쿼트) 시작
      flag=true;
      exercise=1;
      break;
      //case 12://두번째 종류의 운동 시작
      //flag=ture;
      //exercise=2;
      //break;
      case 2://멈추기
      flag=false;
      //측정중단함수
      break;
      default:
      blue.println(99);
    }
    
  }
  else if (!sth==' ') {//보낼것이 있을때
    blue.println(sth);
    sth=" ";
  }
  else if (flag==true){//명령도 없고 완료된 측정된 것도 없을때
    blue.println(5);//측정중
  }
  else{
    blue.println(6);//측정중이 아님
  }
  //led 끔
}
