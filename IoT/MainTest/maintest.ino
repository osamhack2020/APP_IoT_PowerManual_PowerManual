//main
void setup() {
  initSensor();
  Serial.begin(115200);
  caliSensor();   //  초기 센서 캘리브레이션 함수 호출
  past = millis(); // past에 현재 시간 저장  
  blue.begin(9600);
  MsTimer2::set(1000,checking);//1초마다 명령이 들어왔는지,보낼것이 있는지 체크
  MsTimer2::start();
}

void loop() {
switch(exercise){
      case 1://squart 측정
        measureSquart();
      break;
//      case 2: //다른 운동일경우
//      measureSthelse();
//      break;
      default:
      blue.println('e');
  
}
}
