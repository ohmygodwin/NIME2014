import supercollider.*;
import oscP5.*;

Synth simple;

float freq = 0;

void setup() {
  
  simple = new Synth("simple");
  simple.create();
  
}

void draw() {
  for (int i = 0; i < 20; i++) {
    freq = map(i, 0, 19, 440, 660);
    simple.set("freq", freq);
    delay(150);
  }
}

void exit() {
  simple.free();
  super.exit(); //free the synths you created
}
