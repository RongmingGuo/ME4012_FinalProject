// Include Libararies
#include <Wire.h> //MPU Communication

// Variable Declaration
// MPU-6050 Sensor
int16_t a_x;
int16_t a_y;
int16_t a_z;
int16_t temperature;
int16_t gyro_x;
int16_t gyro_y;
int16_t gyro_z;

// sensorReading[6] = boardTemperature

// Auxiliary Functions
void setUpMPU(){
  const int MPU_ADDR = 0x68;
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR); // Begins a transmission to the I2C slave (GY-521 board)
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
}

void getSensor(){
    const int MPU_ADDR = 0x68;
    Wire.beginTransmission(MPU_ADDR);
    Wire.write(0x3B);  
    Wire.endTransmission(false);
    Wire.requestFrom(MPU_ADDR,12,true); 
    
    a_x = Wire.read()<<8 | Wire.read(); // reading registers: 0x3B (ACCEL_XOUT_H) and 0x3C (ACCEL_XOUT_L)
    a_y = Wire.read()<<8 | Wire.read(); // reading registers: 0x3D (ACCEL_YOUT_H) and 0x3E (ACCEL_YOUT_L)
    a_z = Wire.read()<<8 | Wire.read(); // reading registers: 0x3F (ACCEL_ZOUT_H) and 0x40 (ACCEL_ZOUT_L)
    temperature = Wire.read()<<8 | Wire.read(); // reading registers: 0x41 (TEMP_OUT_H) and 0x42 (TEMP_OUT_L)
    gyro_x = Wire.read()<<8 | Wire.read(); // reading registers: 0x43 (GYRO_XOUT_H) and 0x44 (GYRO_XOUT_L)
    gyro_y = Wire.read()<<8 | Wire.read(); // reading registers: 0x45 (GYRO_YOUT_H) and 0x46 (GYRO_YOUT_L)
    gyro_z = Wire.read()<<8 | Wire.read(); // reading registers: 0x47 (GYRO_ZOUT_H) and 0x48 (GYRO_ZOUT_L)
}
void setup() {
  // put your setup code here, to run once:
  // Setup Serial Communication
  Serial.begin(9600);
  // Setup MPU
  setUpMPU();
  //

}

void loop() {
  // put your main code here, to run repeatedly:
  // Reading sensor
  getSensor();
  Serial.println(a_x);
}
