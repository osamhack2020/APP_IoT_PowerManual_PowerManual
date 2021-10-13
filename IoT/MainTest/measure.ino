//측정

#include<Wire.h>  // MPU6050과 I2C 통신을 위한 라이브러리
#include<math.h>

const int MPU_ADDR = 0x68;    // I2C통신을 위한 MPU6050의 주소
int16_t AcX = 0, AcY = 0, AcZ = 0, Tmp = 0, GyX = 0, GyY = 0, GyZ = 0;   // 가속도(Acceleration)와 자이로(Gyro)
double angleAcX = 0, angleAcY = 0, angleAcZ = 0;
double angleGyX = 0, angleGyY = 0, angleGyZ = 0;
double angleFiX = 0, angleFiY = 0, angleFiZ = 0;

const double RADIAN_TO_DEGREE = 57.29583;  
const double DEG_PER_SEC = 131.068;    // 1초에 회전하는 각도
const double ALPHA = 0.92; //1 / (1 + 0.04); 
// GyX, GyY, GyZ 값의 범위 : -32768 ~ +32767 (16비트 정수범위)


unsigned long now = 0;   // 현재 시간 저장용 변수
unsigned long past = 0;  // 이전 시간 저장용 변수
double dt = 0;           // 한 사이클 동안 걸린 시간 변수

double averAcX = 0, averAcY = 0, averAcZ = 0;
double averGyX = 0, averGyY = 0, averGyZ = 0;

int count = 0;  // getAngle() 내부용 카운터 변수

int squat = 1;
int exercise  = 0;  //앱으로 부터 어떤 운동을 수행할지 전달받는 변수; 처음 값은 0 지금은 squat 시연용이어서 1

double correctX1 = 0, correctY1 = 0, correctZ1 = 0;  //올바른 운동 시작 자세
double correctX2 = 0, correctY2 = 0, correctZ2 = 0;  //올바른 중간 운동 자세
double correctX_v1 = 0, correctY_v1 = 0, correctZ_v1 = 0;  //올바른 운동 속도1
double correctX_v2 = 0, correctY_v2 = 0, correctZ_v2 = 0;  //올바른 운동 속도2
double* measuredX; 
double* measuredY; 
double* measuredZ;  //측정된 각도값들 저장
double measuredX_v = 0, measuredY_v = 0, measuredZ_v = 0;  //측정된 속도값 저장
//double measuredX_v2 = 0, measuredY_v2 = 0, measuredZ_v2 = 0;


void measureSquart() {
    
    // 실험을 통해 얻은 올바른 운동 자세, 속도 값들 
    correctY1 = -87.4552;  // 올바른 시작, 돌아왔을 때 자세
    correctY2 = 16.0;      // 올바른 내려갔을때 자세
    correctY_v1 = 9.19;    // 올바른 내려갈때의 속도
    correctY_v2 = -9.77;   // 올바른 올라올때의 속도
    
    //시작자세 취하기
    bool correctStart = 0;
    //int counter = 0;  
    unsigned long past2 = 0;  // 시간 저장용 변수들2
    Serial.println("시작자세를 취해주세요");  // 똑바로 선 자세, 센서는 허벅지 앞쪽 중앙, 무릎 위쪽에 X축이 하늘을 바라보게
    while(!correctStart){
      Serial.println("...");  
      getAngle();  //현재 신체 모션 감지
      correctStart = (angleFiY > (correctY1 - 10)) && (angleFiY < (correctY1 + 10));  //올바른 시작 자세에 있는지 판단
      if(correctStart) {  //올바른 시작 차세를 취하기 시작하면
        past2 = millis(); //시작했을 때의 시간 저장
        // 2초동안 계속 올바른 자세이면 기다린 뒤에 true의 correctStart를 넘기고 아니면 false를 넘김
        while(correctStart) {
          if( (millis() - past2) > 2000)
            break;  //correctStart가 true 상태로 while(correctStart) 탈출
          getAngle();
          correctStart = (angleFiY > (correctY1 - 10)) && (angleFiY < (correctY1 + 10));
          delay(20);
        }
        if(correctStart)
          break;  //앞에서 correctStart가 true 상태로 while문을 탈출 했다면 while(!correctStart) 탈출
        else
          correctStart = 0;
      }
      /*
      Serial.println(".");
      getAngle();
      if((angleFiY >= (correctY1 - 10)) && (angleFiY <= (correctY1 + 10)) && (counter > 100)) {
        counter = 0;
        break;
      }
      else if((angleFiY >= (correctY1 - 10)) && (angleFiY <= (correctY1 + 10))){
        counter++;
      }
      delay(20);
      */
    }
    
    //운동 시작
    Serial.println("운동을 시작합니다");
    
    // 운동 시작 안내가 나오고 내려가기 시작하는지 판단
    measuredY = new double[2];
    getAngle();
    measuredY[0] = angleFiY;
    measuredY[1] = angleFiY;
    // angleFiY값의 전후 차이가 5이상 나지 않으면 대기
    while( (measuredY[1] - measuredY[0]) < 5 ) {
      getAngle();
      measuredY[0] = measuredY[1];
      measuredY[1] = angleFiY;
      delay(20);
    }
    delete[] measuredY;
    
    // 중간지점까지 운동자세 판단
    unsigned long past3 = millis(); // 시간 저장용 변수3, 내려가기 시작할때의 시간 저장
    int squatPosture = -1; // 판단결과 저장 변수, 0 = 정확, 1 =  높음, 2 = 낮음
    int squatSpeed = -1; // 판단결과 저장 변수, 0 = 정확, 1 = 빠름, 2 = 느림
    bool correctCheckPoint = 1;
    while( angleFiY < 11) {
      getAngle();
      if( angleFiY < -76) { // 허벅지가 덜 내려가고 다시 올라옴
        squatPosture = 1;
        Serial.println("너무 높습니다");
        correctCheckPoint = 0;
        break;
      }
      delay(20);
    }
    
    // 중간지점에서 올라올때까지 운동자세 판단
    if(!correctCheckPoint) { // 덜 내려가고 다시 시작자세로 돌아온 경우
      correctCheckPoint = 1;  // 다시 1로 reset하고 시작자세부터 다시 시작
    }
    else {
      // 내려간 속도 판단
      if( (millis() - past3) < 2000) {
        squatSpeed = 1;
        Serial.println("너무 빠릅니다.");
      }
      else if( (millis() - past3) > 4000) {
        squatSpeed = 2;
        Serial.println("너무 느립니다.");
      }
      else {
        squatSpeed = 0;
        Serial.println("정상 속도.");
      }
      
    }
    
    // 다시 올라오는지 판단
    measuredY = new double[2];
    getAngle();
    measuredY[0] = angleFiY;
    measuredY[1] = angleFiY;
    // angleFiY값의 전후 차이가 -5이상 나지 않으면 아직 올라오는 중 아님
    while( (measuredY[1] - measuredY[0]) > -5) {
      getAngle();
      measuredY[0] = measuredY[1];
      measuredY[1] = angleFiY;
      if( angleFiY > 30 ) {
        squatPosture = 2;
        Serial.println("너무 낮습니다.");
      }
      delay(20);
    }
    delete[] measuredY;
    
    //올라올때의 속도 판단
    unsigned long past4 = millis(); // 시간 저장용 변수4, 올라가기 시작할때의 시간 저장
    while( angleFiY >= -76 ) {
      getAngle();
      if( angleFiY < -76 ) {
        if( millis() - past4 < 2000) {
          squatSpeed = 1;
          Serial.println("너무 빠릅니다.");
        }
        else if( (millis() - past4) > 4000) {
          squatSpeed = 2;
          Serial.println("너무 느립니다.");
        }
        else {
          squatSpeed = 0;
          Serial.println("정상 속도.");
        }
      }
    }
    
    /*****************************************************************************************************
    // 운동 시작 안내가 나오고 반응시간이 필요함
    bool start = 0;
    double firstY = 0, secondY = 0;  //후에 운동 속도 계산할때 포함할 처음 두 측정값
    while(!start) {
      measuredY = new double[2];
      getAngle();
      measuredY[0] = angleFiY;
      measuredY[1] = angleFiY;
      while( (measuredY[1] - measuredY[0]) < 5 ) {  //angleFiY값의 전후 차이가 5이상 나기 시작하면 운동 시작
        getAngle();
        measuredY[0] = measuredY[1];
        measuredY[1] = angleFiY;
        delay(20);
      }
      start = 1;
      firstY = measuredY[0];
      secondY = measuredY[1];
      delete[] measuredY;
    }
    
    //앉는 자세 취하기
    bool correctCheckPoint = 0;
    measuredY = new double[200];
    measuredY[0] = firstY;
    measuredY[1] = secondY;
    unsigned long past3 = millis();  // 시간 저장용 변수3
    int i = 2;
    while(!correctCheckPoint) {
      getAngle();
      measuredY[i] = angleFiY;
      if( (measuredY[i] - measuredY[i-1]) < -10 ) {  //완전히 내려가기 전에 올라오는 경우
        Serial.println("충분히 내려가지 못했습니다.");
      } 
      i++;
      delay(20);
    }
    ******************************************************/
    
    /************
    while(!correctCheckPoint){
    //measuredX = new double[200];
    measuredY = new double[200];
    measuredY[0] = firstY;
    measuredY[1] = secondY;
    //measuredZ = new double[200];
    int i = 0;
    int counter2 = 0;
    do{
      getAngle();
      measuredX[i] = angleFiX;
      measuredY[i] = angleFiY;
      measuredZ[i] = angleFiZ;
      if((measuredY[i] < measuredY[i-1]) && (counter2 == 20)){
        break;
      }
      else if(measuredY[i] < measuredY[i-1]) {
        counter2++;
      }
      i++;
      delay(100);
    } while(measuredY[i-1] <= (correctY2 - 5));
    
    if(measuredY[i-1] >= (correctY2 - 5)){
      correctCheckPoint = true;
    }
    
    counter2 = 0;
    
    if(!correctCheckPoint){
      Serial.print("너무 높습니다");
      break;
    }
    measuredY_v = linearFit(measuredY, i);
    if(measuredY_v < (correctY_v1 - 1)){
      Serial.print("너무 느립니다");
    }
    else if(measuredY_v > (correctY_v1 + 1)){
      Serial.print("너무 빠릅니다");
    }
    delete[] measuredX;
    delete[] measuredY;
    delete[] measuredZ;
    
    measuredX = new double[1];
    measuredY = new double[1];
    measuredZ = new double[1];
    
    do{
      getAngle();
      measuredX[0] = angleFiX;
      measuredY[0] = angleFiY;
      measuredZ[0] = angleFiZ;
      
      if(measuredY[0] >= (correctY2 + 10)){
        Serial.print("너무 낮습니다");
      }
    } while(measuredY[0] >= (correctY2 - 5));
    
    }
    **************/
    
  }


void getAngle() {
  getData(); 
  getDT();
  
  double temp = sqrt(pow(AcX, 2) + pow(AcZ, 2));
  angleAcX = atan(AcY / temp);
  angleAcX *= RADIAN_TO_DEGREE;
  
  temp = sqrt(pow(AcY, 2) + pow(AcZ, 2));
  angleAcY = atan(-AcX / temp);
  angleAcY *= RADIAN_TO_DEGREE;

  //angleAcY = atan(-AcX / sqrt(pow(AcY, 2) + pow(AcZ, 2)));
  //angleAcY *= RADIAN_TO_DEGREE;
  // 가속도 센서로는 Z축 회전각 계산 불가함.
  
  // 가속도 현재 값에서 초기평균값을 빼서 센서값에 대한 보정
  angleGyX += ((GyX - averGyX) / DEG_PER_SEC) * dt;  //각속도로 변환
  angleGyY += ((GyY - averGyY) / DEG_PER_SEC) * dt;
  angleGyZ += ((GyZ - averGyZ) / DEG_PER_SEC) * dt;

  // 상보필터 처리를 위한 임시각도 저장
  double angleTmpX = angleFiX + angleGyX * dt;
  double angleTmpY = angleFiY + angleGyY * dt;
  double angleTmpZ = angleFiZ + angleGyZ * dt;

  // (상보필터 값 처리) 임시 각도에 0.96가속도 센서로 얻어진 각도 0.04의 비중을 두어 현재 각도를 구함.
  angleFiX = ALPHA * angleTmpX + (1.0 - ALPHA) * angleAcX;
  angleFiY = ALPHA * angleTmpY + (1.0 - ALPHA) * angleAcY;
  angleFiZ = angleGyZ;    // Z축은 자이로 센서만을 이용하열 구함.
  //Serial.print("AngleAcX:");
  //Serial.print(angleAcX);
  
  /***************************
  디버깅용 시리얼 모니터 출력
  테스트 다 끝나면 주석처리 필요
  ***************************/
  //if(count==10){
  //Serial.print("X: ");
  Serial.print(angleFiX);
  Serial.print(" ");
  //Serial.print("\t AngleAcY:");
  //Serial.print(angleAcY);
  //Serial.print(" Y: ");
  Serial.print(angleFiY);
  Serial.print(" ");
  //Serial.print("\t AngleGyZ:");
  //Serial.print(angleGyZ);
  //Serial.print(" Z: ");
  Serial.println(angleFiZ);
  //count =0;
  //}
  //count++;


//  Serial.print("Angle Gyro X:");
//  Serial.print(angleGyX);
//  Serial.print("\t\t Angle Gyro y:");
//  Serial.print(angleGyY);  
//  Serial.print("\t\t Angle Gyro Z:");
//  Serial.println(angleGyZ);
  delay(20);
}

double linearFit(double* measuredAngles, int counter) {
  int i, j, k, n;
  n = counter+1;
  double x[n], y[n], a;
  for(i = 0; i < n; i++){
    x[i] = i;
  }
  
  for(i = 0; i < n; i++){
    y[i] = measuredAngles[i];
  }
  
  double xsum = 0, x2sum = 0, ysum = 0, xysum = 0;
  for(i = 0; i < n; i++) {
      xsum += x[i]; // calculate sigma(xi)
      ysum += y[i]; // calculate sigma(yi)
      x2sum += pow(x[i], 2); // calculate sigma(xi^2)
      xysum += x[i]*y[i]; // calculate sigma(xi*yi)
  }
  a = (n*xysum - xsum*ysum)/(n*x2sum - xsum*xsum); // calculate slope
  return a;
}

void initSensor() {
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR);   // I2C 통신용 어드레스(주소)
  Wire.write(0x6B);    // MPU6050과 통신을 시작하기 위해서는 0x6B번지에    
  Wire.write(0);
  Wire.endTransmission(true);
}

void getData() {
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x3B);   // AcX 레지스터 위치(주소)를 지칭합니다
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_ADDR, 14, true);  // AcX 주소 이후의 14byte의 데이터를 요청
  AcX = Wire.read() << 8 | Wire.read(); //두 개의 나뉘어진 바이트를 하나로 이어 붙여서 각 변수에 저장
  AcY = Wire.read() << 8 | Wire.read();
  AcZ = Wire.read() << 8 | Wire.read();
  Tmp = Wire.read() << 8 | Wire.read();
  GyX = Wire.read() << 8 | Wire.read();
  GyY = Wire.read() << 8 | Wire.read();
  GyZ = Wire.read() << 8 | Wire.read();
}

// loop 한 사이클동안 걸리는 시간을 알기위한 함수
void getDT() {
  now = millis();   
  dt = (now - past) / 1000.0;  
  past = now;
}

// 센서의 초기값을 20회 정도 평균값으로 구하여 저장하는 함수
void caliSensor() {
  double sumAcX = 0 , sumAcY = 0, sumAcZ = 0;
  double sumGyX = 0 , sumGyY = 0, sumGyZ = 0;
  getData();
  for (int i=0;i<20;i++) {
    getData();
    sumAcX+=AcX;  sumAcY+=AcY;  sumAcZ+=AcZ;
    sumGyX+=GyX;  sumGyY+=GyY;  sumGyZ+=GyZ;
    delay(20);
  }
  averAcX=sumAcX/20;  averAcY=sumAcY/20;  averAcZ=sumAcY/20;
  averGyX=sumGyX/20;  averGyY=sumGyY/20;  averGyZ=sumGyZ/20;
}
