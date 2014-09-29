void setup() {
  Serial.begin(9600);
}
    
void loop() {
  Serial.print(analogRead(0));  
  Serial.println();
  delay(30);
}
