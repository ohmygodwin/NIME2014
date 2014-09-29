void setup() {
  Serial.begin(115200);
  {
    
void loop() {
  for(int i = 0; i < 6; i++) {
    Serial.print(analogRead(i));
    Serial.print(' ');
  }
  Serial.println();
  delay(30);
}
