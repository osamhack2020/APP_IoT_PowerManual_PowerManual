//main
void setup() {
  setupmeasure();
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
