// Global Variables
#define MOTOR1PIN1 2
#define MOTOR1PIN2 4
#define MOTOR2PIN1 7
#define MOTOR2PIN2 8
#define MOTORPOWERPIN1 10
#define MOTORPOWERPIN2 11

void setup() {
  // put your setup code here, to run once:
  pinMode(MOTOR1PIN1, OUTPUT);
  pinMode(MOTOR1PIN2, OUTPUT);
  pinMode(MOTOR2PIN1, OUTPUT);
  pinMode(MOTOR2PIN2, OUTPUT);
  pinMode(MOTORPOWERPIN1, OUTPUT);
  pinMode(MOTORPOWERPIN2, OUTPUT);
}

void loop() {
  analogWrite(MOTORPOWERPIN1, 255);
  analogWrite(MOTORPOWERPIN2, 255);
  // put your main code here, to run repeatedly:
  // put your main code here, to run repeatedly:   
  digitalWrite(MOTOR1PIN1, HIGH);
  digitalWrite(MOTOR1PIN2, LOW); // HIGH + LOW == C.W

  digitalWrite(MOTOR2PIN1, HIGH);
  digitalWrite(MOTOR2PIN2, LOW);
  
}
