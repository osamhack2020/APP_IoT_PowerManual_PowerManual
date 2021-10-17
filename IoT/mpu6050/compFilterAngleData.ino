/*
상보필터를 적용한 roll, pitch, yaw 각도 구하기
운동자세 판단값들 정할때 데이터 수집용 코드로 사용됨
Serial Monitor에 출력된 데이터들을 엑셀로 옮긴뒤 분석하였음
*/

#include<Wire.h>
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

int count = 0;

void setup() {
  initSensor();
  Serial.begin(115200);
  caliSensor();   //  초기 센서 캘리브레이션 함수 호출
  past = millis(); // past에 현재 시간 저장  
}

void loop() {
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
  if(count==10){
  Serial.print("X: ");
  Serial.print(angleFiX);
  //Serial.print("\t AngleAcY:");
  //Serial.print(angleAcY);
  Serial.print(" Y: ");
  Serial.print(angleFiY);
  //Serial.print("\t AngleGyZ:");
  //Serial.print(angleGyZ);
  Serial.print(" Z: ");
  Serial.println(angleFiZ);
  count =0;
        }


//  Serial.print("Angle Gyro X:");
//  Serial.print(angleGyX);
//  Serial.print("\t\t Angle Gyro y:");
//  Serial.print(angleGyY);  
//  Serial.print("\t\t Angle Gyro Z:");
//  Serial.println(angleGyZ);
  count++;
  delay(20);
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

// 센서의 초기값을 10회 정도 평균값으로 구하여 저장하는 함수
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
