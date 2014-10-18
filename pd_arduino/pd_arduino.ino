int pot;

void setup() {
  Serial.begin(9600);
}

void loop() {
  pot = analogRead(0);
  int pot_ = map(pot, 0, 1023, 0, 100);
  
  Serial.write(pot_);
  //Serial.println(); do not use for Pd
  delay(30);
}
