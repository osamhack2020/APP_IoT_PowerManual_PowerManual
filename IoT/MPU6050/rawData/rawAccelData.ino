/* 
GY-521(MPU6050) Raw 데이터 얻기
센서의 각축으로부터 가속도와 자이로에 대한 아날로그 데이터를 
16bit 분해능을 가진 ADC를 거치면 디지털 수치값으로 변환된다.
"-32768 ~ +32767" 사의 값이 SDA를 통해 출력되게 된다.
출력된 Raw 데이터는 Serial Monitor를 통해 보여진다. 
*/

#include <Wire.h> // I2C 통신을 위한 라이브러리
const int MPU_ADDR = 0x68; // IC2 통신을 위한 MPU6050의 주소
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ; // 가속도(Acceleration) 선언
void getRawData(); // 센서값 얻는 서브함수의 프로토타입 선언
void initSensor(); // I2C 통신 시작 서브함수의 프로토타입 선언

void setup() {
  initSensor();
  Serial.begin(9600);
  delay(200);
}

void loop() {
  getRawData(); // 센서값 얻어오는 함수 호출
  Serial.print("AcX:");
  Serial.print(AcX);
  Serial.print(" AcY:");
  Serial.print(AcY);
  Serial.print(" AcZ:");
  Serial.print(AcZ);
  //Serial.print("   GyX:");
  //Serial.print(GyX);
  //Serial.print("   GyY:");
  //Serial.print(GyY);
  //Serial.print("   GyZ:");
  //Serial.print(GyZ);
  Serial.println();
  delay(300);
}

void initSensor() {
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR); // I2C 통신용 주소
  Wire.write(0X6B); // MPU6050과 통신을 시작하기 위해서는 0X68에
  Wire.write(0); // MPU6050을 동작 대기 모드로 변경
  Wire.endTransmission(true);
}

void getRawData() {
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x3B); // AcX 레지스터 주소를 지칭
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_ADDR, 14, true); // AcX 주소 이후의 14byte의 데이터 요청

  AcX = Wire.read() << 8 | Wire.read(); // 두 개의 나뉘어진 바이트를 하나로 이어 붙여서 각 변수에 저장
  AcY = Wire.read() << 8 | Wire.read();
  AcZ = Wire.read() << 8 | Wire.read();
  Tmp = Wire.read() << 8 | Wire.read();
  GyX = Wire.read() << 8 | Wire.read();
  GyY = Wire.read() << 8 | Wire.read();
  GyZ = Wire.read() << 8 | Wire.read();
}
