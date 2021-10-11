#include <SoftwareSerial.h>
#include <MsTimer2.h>
SoftwareSerial blue(2,3);
String sth=" ";
int command=0;
boolean flag=false;
void setup() {

  blue.begin(9600);
  MsTimer2::set(1000,checking);//1초마다 명령이 들어왔는지,보낼것이 있는지 체크
  MsTimer2::start();
  //기타 초기화함수

}
void loop() {
  if ( flag==true){
    //측정하기
  }
  else{
    //측정중단
  }
}
void checking() {
  //led 켬
  if(blue.available()){//들어온 명령이 있을 때
    while (blue.available()>1){//여러명령이 들어왔을경우 마지막 명령만 실행
      blue.read();
    }
    command=static_cast<int>(blue.read());
    switch(command){
      case 1://시작하기
      flag=true;
      break;
      case 2://멈추기
      flag=false;
      //측정중단함수
      break;
      default:
      blue.println('e');
    }
    
  }
  else if (!sth==' ') {//보낼것이 있을때
    blue.println(sth);
    //led끄기
  }
  else if (flag==true){//명령도 없고 완료된 측정된 것도 없을때
    blue.println(5);//측정중
  }
  else{
    blue.println(6);//측정중이 아님
  }
  //led 끔
}
