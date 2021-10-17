// 자이로 센서로 Roll, Pitch, Yaw 각도 구하기
#include<Wire.h>
#include<math.h>

const int MPU_ADDR = 0x68;    // I2C통신을 위한 MPU6050의 주소
int16_t AcX = 0, AcY = 0, AcZ = 0, Tmp = 0, GyX = 0, GyY = 0, GyZ = 0;   // 가속도(Acceleration)와 자이로(Gyro)
double angleAcX = 0, angleAcY = 0, angleAcZ = 0;
double angleGyX = 0, angleGyY = 0, angleGyZ = 0;

const double RADIAN_TO_DEGREE = 57.29583;  
const double DEG_PER_SEC = 131.068;    // 1초에 회전하는 각도
// GyX, GyY, GyZ 값의 범위 : -32768 ~ +32767 (16비트 정수범위)


unsigned long now = 0;   // 현재 시간 저장용 변수
unsigned long past = 0;  // 이전 시간 저장용 변수
double dt = 0;           // 한 사이클 동안 걸린 시간 변수 

double averAcX = 0, averAcY = 0, averAcZ = 0;
double averGyX = 0, averGyY = 0, averGyZ = 0;

void setup() {
  initSensor();
  Serial.begin(115200);
  caliSensor();   //  초기 센서 캘리브레이션 함수 호출
  past = millis(); // past에 현재 시간 저장  
}

void loop() {
  getData(); 
  getDT();
  angleGyX += ((GyX - averGyX) / DEG_PER_SEC) * dt;
  angleGyY += ((GyY - averGyY) / DEG_PER_SEC) * dt;
  angleGyZ += ((GyZ - averGyZ) / DEG_PER_SEC) * dt;
  
  Serial.print("X:");
  Serial.print(angleGyX);
  Serial.print(" y:");
  Serial.print(angleGyY);  
  Serial.print(" Z:");
  Serial.println(angleGyZ);  
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
