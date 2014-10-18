//the default sound server is s
Server.default = s = Server.local;

//for info on inputs and outputs
s.boot;

//sine oscillator
({SinOsc.ar(LFNoise0.kr(30, mul:800, add:1000), 0.3)}).play;

rand(80); //random value 0-arg
exprand(1.0, 100.) //exponential random

(100.rand).dup(4);
({100.rand}).dup(4); //function - it will give 4 unique values

{LFNoise0.ar}.play; //.plot will graph it, .scope is like an oscilloscope

{SinOsc.ar(220, 0, 1, 0)}.play;

{SinOsc.ar(LFNoise1.kr(2, 200, 400), 0, 1, 0)}.play;

{SinOsc.ar([660, 880], 0, 1, 0)}.play;

//arrays aren't picky - they can take different types at the same time
{SinOsc.ar([660, LFNoise1.ar(1, 200, 400)], 0, 1, 0)}.play;

//phase modulation oscillator
{PMOsc.ar([440, 220], MouseY.kr(1, 550), MouseX.kr(1, 15))}.play;

(
p = {
	//initialize function as variable
	var line, rand, trig;
	line = Line.kr(1, 40, 120); //set line uGen as variable
	trig = Impulse.kr(line); //set trigger as a variable

	rand = TRand.kr(100, 1000, trig);
	Blip.ar([rand, rand],
		TRand.kr(
			1, 10, trig, 0, 0.5, 1/line)
	)
}.play;
)

p.free; //now that function is a var, we can send commands to it

s.dumpOSC; //osc commands to post window

(
SynthDef(\simple, { //synthdef name
	arg freq = 440;
	var sum, source; //init variables
	source = SinOsc.ar(freq); //create sound source
	sum = Pan2.ar(source, 0.5, 1); //modulate - pan2 splits into 2 channels
	Out.ar(0, sum); //output to audio bus
}).add //add to server
)

x = Synth(\simple); //call to play
x.set(\freq, 660);
x.free; //stop synth










