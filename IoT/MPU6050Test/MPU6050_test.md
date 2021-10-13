WOKWI: MPU6050 시뮬레이터  
Fritzing: 회로 시뮬레이터  
사용된 부품: Arduino Nano, GY-521 모듈(MPU6050 센서)

참고 자료:  
https://rasino.tistory.com/325 => MPU6050 센서 실습(MPU Library 사용 X)  
https://diymaker.tistory.com/79 => Arduino Nano I2C pinmap  
https://www.hackster.io/Hack-star-Arduino/arduino-simulator-adafruit-mpu6050-gyro-accelorometer-9678d6 => Virtual Arduino Simulator with MPU6050  
https://scienceon.kisti.re.kr/srch/selectPORSrchArticle.do?cn=JAKO202031064817950&dbt=NART => 관성 센서기반 스쿼트 각도 측정 융합 시스템 논문  

1차 Test:  
"Raw 데이터 얻기"  
https://wokwi.com/arduino/projects/311299741125182016  
기울기 센서가 움직임에 따라 raw데이터도 변함
시뮬레이션에서 x축 0, y축 0, z축 1g 상태는 기울기 센서가 위를 바라보며 가만히 놓여있는 상태이다.  

2차 Test:  
"Accelerometer로 부터 angle 얻기"
https://wokwi.com/arduino/projects/311317515851530816  
1차와 같은 회로 사용
움직임이 없는 상태에서 보다 정확한 값을 얻을 수 있음  
가속도 센서는 z축 회전각 계산 불가  

3차 Test:  
"Gyro로 부터 angle 얻기"
https://wokwi.com/arduino/projects/311333884930294337  
1차와 같은 회로 사용
축을 중심으로 회전하는 각속도를 측정한 뒤 적분하여 기울어진 각도를 계산  
노이즈나 미세한 기본 오차 값들이 적분으로 인해, 시간이 지날 수록 측정값의 오차가 커지는 Drift현상 발생  
하지만, 가속도 센서와 달리 진동에 영향이 크게 없으며 중fur과 일치하는 Z축의 Yaw 각도도 구할 수 있음  
또한, 평균값을 사용하여 spike와 같은 오차를 줄임

4차 Test:  
"Complementary Filter로 angle 얻기"  
https://wokwi.com/arduino/projects/311334970688799296  
가속도 센서는 고주파 영역의 노이즈를 감쇠시키고 낮은 주파수 영역을 통과시키는 저역필터를 적용  
자이로 센서는 저주파 영역의 노이즈를 감쇠시키는 높은 주파수 영역을 통과시키는 고역필터를 적용    
가중치는 임의로 정해져 있으나 실험을 통해 실제 각도기를 이용한 측정값과 가장 가까울 때의 가중치가 구해져야 함  
가중치를 과도하게 조정하면 출력 딜레이가 발생하므로 주의  
cf)칼만필터(출력 딜레이를 줄여주는 필터)는 드론과 같이 빠른 반응이 중요한 곳에 사용하므로 우리 PowerManual에는 불필요함  

6차 Test:


Testbed  
구성:  
Wemos D1 R2, MPU6050  

