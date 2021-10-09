/* 
GY-521(MPU6050) 가속도 센서를 이용해 각도 값 얻기
중력과 X축, Y축, Z축과의 기울기를 이용한 삼각함수를 적용
*/

#include <Wire.h> // I2C 통신을 위한 라이브러리
const int MPU_ADDR = 0x68; // IC2 통신을 위한 MPU6050의 주소
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ; // 가속도(Acceleration) 선언
double angleAcX;
double angleAcY;
double angleAcZ;
const double RADIAN_TO_DEGREE = 180 / 3.14159;
double getAngleXYZ();
void initSensor();
void getData();


void setup() {
  initSensor();
  Serial.begin(115200);
  delay(200);
}

void loop() {
  getAngleXYZ();
  Serial.print("Angle x : ");
  Serial.print(angleAcX);
  Serial.print(" Angle y: ");
  Serial.print(angleAcY);
  Serial.print(" Angle z: ");
  Serial.println(angleAcZ);
  delay(20);
}

double getAngleXYZ() {
  getData();
  // 삼각함수를 이용한 Roll 각도 구하기
  angleAcX = atan(AcY / sqrt(pow(AcX, 2) + pow(AcZ, 2)));
  angleAcX *= RADIAN_TO_DEGREE;
  // 삼각함수를 이용한 Pitch 각도 구하기
  angleAcY = atan(-AcX / sqrt(pow(AcY, 2) + pow(AcZ, 2)));
  angleAcY *= RADIAN_TO_DEGREE;
  // 삼각함수를 이용한 Yaw 각도 구하기
  angleAcZ = atan(sqrt(pow(AcX, 2) + pow(AcY, 2)) / AcZ );
  angleAcZ *= RADIAN_TO_DEGREE;
}

void initSensor() {
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR); // I2C 통신용 주소
  Wire.write(0X6B); // MPU6050과 통신을 시작하기 위해서는 0X68에
  Wire.write(0); // MPU6050을 동작 대기 모드로 변경
  Wire.endTransmission(true);
}

void getData() {
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
