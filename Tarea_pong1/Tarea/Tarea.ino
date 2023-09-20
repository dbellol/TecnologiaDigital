const int button1=2;
const int button2=3;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(button1,INPUT);
  pinMode(button2,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(button1)==HIGH){
    Serial.println("1");
    delay(20);
    }
    if(digitalRead(button2)==HIGH){
      Serial.println("2");
      delay(20);
      }
      if(digitalRead(button1)==LOW && digitalRead(button2)==LOW){
        Serial.println("9");
        delay(20);
      }
 
}
