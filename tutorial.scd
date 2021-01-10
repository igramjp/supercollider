3.cubed

x = 3.cubed

x

(
var number;
number = 3.cubed;
)

~number = 3.cubed;

~number;

(
var foo;
foo = 3;
foo = foo.cubed;
foo = foo + 100;
foo = foo / 2;
foo;
)

3.cubed + 100 / 2;

// single line comment

/*
multi
line
comment
*/

Server.local.boot;

Server.local.quit;

s;

s.boot;

s.quit;

{SinOsc.ar}.play;

x = {SinOsc.ar}.play;

x.free;

x = {SinOsc.ar};

y = x.play;

y.free;

x = {SinOsc.ar(700, 0, 0.125, 0)}.play;
x = {SinOsc.ar(700, mul:0.125)}.play;
x = {SinOsc.ar(700) * 0.125}.play;
x.free;

(
z = {
	arg freq=440, amp=1;
	var sig;
	sig = SinOsc.ar(freq) * amp;
}.play;
)

z.set(\freq, 330);
z.set(\amp, 0.125);
z.set(\freq, 660, \amp, 0.5);
z.free;

(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8, 400, 600);
	sig = SinOsc.ar(freq);
}.play;
)

(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8).range(200, 1000);
	sig = SinOsc.ar(freq);
}.play;
)

(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8).exprange(200, 1000);
	sig = SinOsc.ar(freq);
}.play;
)

(
z = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200, 1000);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
}.play;
)

z.set(\noiseHz, 64);
z.set(\noiseHz, exprand(4, 64));
z.free;


(
z = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200, 1000);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
}.play;
)

(
SynthDef.new(\sineTest, {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200, 1000);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
	Out.ar(0, sig);
}).add
)

// add as load, send, store

x = Synth.new(\sineTest);
x = Synth.new(\sineTest, [\noiseHz, 32]);
x.set(\noiseHz, 12);
x.free;

// favorite
(
SynthDef.new(\pulseTest, {
	arg ampHz=4, fund=40, maxPartial=4, width=0.5;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0.5, 0.12) * 0.75;
	freq1 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8, add:1);
	freq2 = freq2 * LFPulse.kr(6, add:1);
	sig1 = Pulse.ar(freq1, width, amp1);
	sig2 = Pulse.ar(freq2, width, amp2);
	sig1 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	sig2 = FreeVerb.ar(sig2, 0.7, 0.8, 0.25);
	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add
)

x = Synth.new(\pulseTest);

x.set(\width, 0.05);
x.set(\fund, 30);
x.set(\maxPartial, 20);
x.set(\ampHz, 0.25);

x.free;

x = Synth.new(\pulseTest, [\ampHz, 3.3, \fund, 48, \maxPartial, 4, \width, 0.15]);

x = {PinkNoise.ar * 0.5}.play;

x.free;

// node tree
s.plotTree;

s.freeAll;

(
x = {
	var sig, env;
	env = Line.kr(1,0,1);
	sig = Pulse.ar(ExpRand(30, 500)) * env;
}.play;
)

x.free;

(
x = {
	var sig, env;
	env = XLine.kr(1, 0.01, 1, doneAction:2);
	sig = Pulse.ar(ExpRand(30, 500)) * env;
}.play;
)

(
x = {
	var sig, freq, env;
	env = Line.kr(1, -40, 5, doneAction:2);
	freq = XLine.kr(880, 110, 1, doneAction:0);
	sig = Pulse.ar(freq) * env.dbamp;
}.play;
)

(
x = {
	var sig, freq, env;
	env = XLine.kr(1, 0.01, 5, doneAction:2);
	freq = XLine.kr(880, 110, 1, doneAction:0);
	sig = Pulse.ar(freq) * env;
}.play;
)

0.125.ampdb;
-18.061799739839.dbamp;

Env.new.plot;

(
x = {
	var sig, env;
	env = EnvGen.kr(Env.new, doneAction:2);
	sig = Pulse.ar(ExpRand(30, 500)) * env;
}.play;
)


Env.new([0, 1, 0.2, 0], [0.5, 1, 2]).plot;
Env.new([0, 1, 0.2, 0], [0.5, 1, 2], \exp).plot;
Env.new([0.01, 1, 0.2, 0.01], [0.5, 1, 2], \exp).plot;

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [3, -3, 0]).plot;

(
x = {
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[3, -3, 0]
	), doneAction:2);
	sig = Pulse.ar(ExpRand(30, 500)) * env;
}.play;
)

(
x = {
	arg gate=0;
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[3, -3, 0],
	), gate);
	sig = Pulse.ar(LFPulse.kr(8).range(600, 900)) * env;
}.play;
)

x.set(\gate, 1);

// trigger
(
x = {
	arg t_gate=0;
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[3, -3, 0],
	), t_gate, doneAction:2);
	sig = Pulse.ar(LFPulse.kr(8).range(600, 900)) * env;
}.play;
)

x.set(\t_gate, 1);

(
x = {
	arg gate=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr, gate);
	sig = VarSaw.ar(SinOsc.kr(16).range(500, 1000)) * env;
}.play;
)

x.set(\gate, 0);

(
x = {
	arg gate=0;
	var sig, env, freq;
	freq = EnvGen.kr(Env.adsr(1), gate, 200, 0.1);
	env = EnvGen.kr(Env.adsr, gate, doneAction:2);
	sig = VarSaw.ar(SinOsc.kr(freq).range(500, 1000)) * env;
}.play;
)

x.set(\gate, 1);
x.set(\gate, 0);


{VarSaw.ar(freq: 660.0, iphase: 0.0, width: 0.5, mul: 1.0, add: 0.0)}.play;

// levels (dBFS)
s.meter;

x = {[SinOsc.ar(300), SinOsc.ar(500)]}.play;

x = {SinOsc.ar([300, 500])}.play;

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1]).range(0, 1);
		sig = SinOsc.ar([300, 500]);
		sig = sig * amp;
}.play;
)

(
x = {
	var sig, amp;
	amp = SinOsc.kr(7).range(0, 1);
	sig = SinOsc.ar([300, 500]);
	sig = sig * amp;
}.play;
)

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	Mix.new(sig) * 0.25;
}.play;
)

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	[Mix.new(sig), Mix.new(sig)] * 0.25;
}.play;
)

x.free;

60.dup(4);
"hello".dup(4);

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	Mix.new(sig).dup(2) * 0.25;
}.play;
)

60!4

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	Mix.new(sig)!2 * 0.25;
}.play;
)

(
x = {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	Splay.ar(sig) * 0.25;
}.play;
)

x.free;

x = {PinkNoise.ar(0.5)!2}.play;
x = {PinkNoise.ar(0.5!2)}.play;

// favorite
(
SynthDef.new(\multi, {
	var sig, amp;
	amp = SinOsc.kr([7, 1, 2, 0.2, 6]).range(0, 1);
	sig = SinOsc.ar([300, 500, 700, 900, 1100]);
	sig = sig * amp;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\multi);
x.free;

rrand(50, 1200)!4;
{rrand(50, 1200)}!4;

(
SynthDef.new(\multi, {
	var sig, amp;
	amp = SinOsc.kr({exprand(0.2, 12)}!8).range(0, 1);
	sig = SinOsc.ar({exprand(50, 1200)}!8);
	sig = sig * amp;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\multi);
x.free;

(
SynthDef.new(\multi, {
	var sig, amp;
	amp = SinOsc.kr({ExpRand(0.2, 12)}!8).range(0, 1);
	sig = SinOsc.ar({ExpRand(50, 1200)}!8);
	sig = sig * amp;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\multi);
x.free;

// favorite
(
SynthDef.new(\multi, {
	var sig, amp, env;
	env = EnvGen.kr(
		Env.new([0, 1, 0], [10, 10], [1,-1]),
		doneAction:2
	);
	amp = SinOsc.kr({ExpRand(0.2, 12)}!8).range(0, 1);
	sig = SinOsc.ar({ExpRand(50, 1200)}!8);
	sig = sig * amp * env;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\multi);
x.free;

[6, 4, 0.5, 10, 7].do{"hello".postln}

(
x = Array.newClear(5);

[6, 4, 0.5, 10, 7].do{
	arg item, count;
	x[count] = item.squared;
}
)

x;

z = [6, 4, 0.5, 10, 7].collect(_.squared);

5.do{arg item; item.postln};

x = {VarSaw.ar(40!2, 0, 0.05)}.play;

// favorite
(
SynthDef.new(\iter, {
	arg freq=40;
	var temp, sum, env;
	sum = 0;
	env = EnvGen.kr(
		Env.perc(0.01, 5, 1, -2),
		doneAction:2
	);
	10.do{
		temp = VarSaw.ar(
			freq * {Rand(0.99, 1.02)}!2,
			0,
			0.05
		);
		sum = sum + temp;
	};
	sum = sum * 0.05 * env;
	Out.ar(0, sum);
}).add;
)

x = Synth.new(\iter);

Synth.new(\iter, [\freq, 66.midicps]);
Synth.new(\iter, [\freq, 73.midicps]);
Synth.new(\iter, [\freq, 80.midicps]);
Synth.new(\iter, [\freq, 75.midicps]);

(
[53, 59, 63, 68].do{
	arg midinote;
	Synth.new(\iter, [\freq, midinote.midicps]);
}
)

x.free;

// favorite
(
SynthDef.new(\iter2, {
	arg freq=440;
	var temp, sum;
	sum = 0;
	10.do{
		arg count;
		temp = SinOsc.ar(
			freq *
			(count + 1) *
			LFNoise1.kr({Rand(0.05, 0.2)}!2).range(0.98, 1.02)
		);
		temp = temp * LFNoise1.kr({Rand(0.5, 8)}!2).exprange(0.01, 1);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);
}).add;
)

x = Synth.new(\iter2);

x.set(\freq, 50);

x.free;

(
SynthDef.new(\iter2, {
	arg freq=200, dev=1.02, num=10;
	var temp, sum;
	sum = 0;
	num.do{
		arg count;
		temp = SinOsc.ar(
			freq *
			(count + 1) *
			LFNoise1.kr({Rand(0.05, 0.2)}!2).range(dev.reciprocal, dev)
		);
		temp = temp * LFNoise1.kr({Rand(0.5, 8)}!2).exprange(0.01, 1);
		sum = sum + temp;
	};
	sum = sum * 0.05;
	Out.ar(0, sum);
}).add;
)

x = Synth.new(\iter2);

x.set(\freq, 50);
x.set(\dev, 1.3);
x.set(\num, 5.4);

x.free;

(
SynthDef.new(\blip, {
	arg out;
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(300, 1200).round(300);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(2);
	sig = sig * EnvGen.kr(Env.perc(0.01, 0.2), trig);
	Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 1);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2)!2;
	Out.ar(out, sig);
}).add;
)

s.options.numAudioBusChannels;
s.options.numOutputBusChannels;
s.options.numInputBusChannels;

s.options.numAudioBusChannels;
s.options.numOutputBusChannels = 4;
s.options.numInputBusChannels = 2;

s.reboot;
s.meter;

y = Synth.new(\reverb, [\in, 6]);
x = Synth.new(\blip, [\out, 6]);
x.set(\out, 25);
y.set(\in, 25);
x.free;
y.free;
s.freeAll;

~reverbBus = Bus.audio(s, 1);
~reverbBus.index;

y = Synth.new(\reverb, [\in, ~reverbBus]);
x = Synth.new(\blip, [\out, ~reverbBus]);
x.free;
y.free;
s.freeAll;

// stereo bus
(
SynthDef.new(\blip, {
	arg out;
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(300, 1200).round(300);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(2);
	sig = sig * EnvGen.kr(Env.perc(0.01, 0.2), trig);
	Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 2);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2)!2;
	Out.ar(out, sig);
}).add;
)

~reverbBus2 = Bus.audio(s, 2);
~reverbBus3 = Bus.audio(s, 1);

~reverbBus2.index;

y = Synth.new(\reverb, [\in, ~reverbBus2]);
x = Synth.new(\blip, [\out, ~reverbBus2]);
x.free;
y.free;
s.freeAll;

g = Group.new;
g.free;

x = Synth.new(\blip, [\out, ~reverbBus2]);
y = Synth.new(\reverb, [\in, ~reverbBus2], x, \addAfter);

x = Synth.before(y, \blip, [\out, ~reverbZBus2]);

// group
~sourceGrp = Group.new;
~fxGrp = Group.after(~sourceGrp);

x = Synth.new(\blip, [\out, ~reverbBus2], ~sourceGrp);
y = Synth.new(\reverb, [\in, ~reverbBus2], ~fxGrp);

x.free;
y.free;
s.freeAll;

(
SynthDef.new(\blip, {
	arg out, fund=300, dens=2, decay=0.2;
	var freq, trig, sig;
	freq = LFNoise0.kr(3).exprange(fund, fund*4).round(fund);
	sig = SinOsc.ar(freq) * 0.25;
	trig = Dust.kr(dens);
	sig = sig * EnvGen.kr(Env.perc(0.01, decay), trig);
	Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
	arg in, out=0;
	var sig;
	sig = In.ar(in, 2);
	sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2)!2;
	Out.ar(out, sig);
}).add;
)

// favorite
~sourceGrp = Group.new;
~fxGrp = Group.after(~sourceGrp);

(
8.do{
	Synth.new(
		\blip,
		[
			\out, ~reverbBus2,
			\fund, exprand(60, 300).round(30)
		],
		~sourceGrp
	);
}
)

~sourceGrp.set(\decay, 0.03);
~sourceGrp.set(\dens, 16);
~sourceGrp.set(\dens, 0.25);
~sourceGrp.set(\decay, 1.2);

~sourceGrp.freeAll;
s.freeAll;

~b0 = Buffer.read(s, "/Users/igram/Desktop/sounds/car1.aiff");

~b0.play;

~b0.zero;

~b0.read("/Users/igram/Desktop/sounds/car1.aiff");

~b0.free;

Buffer.freeAll;

~b0 = Buffer.read(s, "/Users/igram/Desktop/sounds/car1.aiff");
~b1 = Buffer.read(s, "/Users/igram/Desktop/sounds/car2.aiff");
~b2 = Buffer.read(s, "/Users/igram/Desktop/sounds/car3.aiff");
~b3 = Buffer.read(s, "/Users/igram/Desktop/sounds/bike.aiff");

~b0.play;
~b1.play;
~b2.play;
~b3.play;

// frames
~b0.numFrames;

// channels
~b0.numChannels;

numSamples = numFrames * numChannels;

~b4 = Buffer.readChannels(s, "/Users/igram/Desktop/sounds/bike.aiff", channels:[1]);

s.meter;

~b0.play;
~b4.numChannels;
~b4.play;

// duration
~b2.duration;

// buffer numbers (bufnums)
~b0.bufnum;
~b1.bufnum;
~b2.bufnum;
~b3.bufnum;

// buffer sample rate
~b0.sampleRate;
s.sampleRate;

// summary
~b0.query;

~b3.play;

~b3_part0 = Buffer.read(s, "/Users/igram/Desktop/sounds/bike.aiff", 0, s.sampleRate/2);

~b3_part0.play;

~b3.numFrames;

~b3_part1 = Buffer.read(s, "/Users/igram/Desktop/sounds/bike.aiff", 223555, ~b3.numFrames - 223556);

~b3_part1.play;

~bells = Array.new;
~folder = PathName.new("/Users/igram/Desktop/sounds/bells/");
(
~folder.entries.do({
	arg path;
	~bells = ~bells.add(Buffer.read(s, path.fullPath));
});
)

~bells.at(0).play;
~bells.at(4).play;
~bells.at(7).play;
~bells[12].play;

s.options.numBuffers = 2000;

(
SynthDef.new(\playbuf_test, {
	arg amp=1, out=0, buf;
	var sig;
	sig = PlayBuf.ar(2, buf);
	sig = sig * amp'
	Out.ar(out, sig);
}).add;
)

Synth.new(\playbuf_test, [\buf, ~b4.bufnum]);

s.plotTree;

(
SynthDef.new(\playbuf_test, {
	arg amp=1, out=0, buf, rate=1, da=2;
	var sig;
	sig = PlayBuf.ar(2, buf, rate, doneAction:da);
	sig = sig * amp'
	Out.ar(out, sig);
}).add;
)

Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \rate, 0.5]);
Synth.new(\playbuf_test, [\buf, ~b0_96k.bufnum, \rate, 1]);

(
SynthDef.new(\playbuf_test, {
	arg amp=1, out=0, buf, rate=1, da=2;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf) * rate, doneAction:da);
	sig = sig * amp'
	Out.ar(out, sig);
}).add;
)

Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \rate, 1.5]);
Synth.new(\playbuf_test, [\buf, ~b0_96k.bufnum, \rate, 1.5]);

(
SynthDef.new(\playbuf_test, {
	arg amp=1, out=0, buf, rate=1, t_trig=1, start=0, da=2;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf) * rate, t_trig, start, doneAction:da);
	sig = sig * amp'
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \start, s.sampleRate/2. \da, 0]);

x.set(\t_trig, 1);
x.free;

(
SynthDef.new(\playbuf_test, {
	arg amp=1, out=0, buf, rate=1, t_trig=1, start=0, loop=0, da=2;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf) * rate, t_trig, start, loop, doneAction:da);
	sig = sig * amp'
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \loop, 1]);

x.set(\loop, 0);

x = Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \rate, -1, \start, ~b0.numFrames - 2]);

12.midiratio;
-12.midiratio;
7.midiratio;

Synth.new(\playbuf_test, [\buf, ~bells[0].bufnum, \rate, -7.midiratio]);
Synth.new(\playbuf_test, [\buf, ~bells[0].bufnum, \rate, -10.midiratio]);
Synth.new(\playbuf_test, [\buf, ~bells[0].bufnum, \rate, -13.midiratio]);
Synth.new(\playbuf_test, [\buf, ~bells[0].bufnum, \rate, -15.midiratio]);

g = Group.new;

(
x = Synth.new(\playbuf_test, [\buf, ~b0.bufnum, \rate, 1.5, \loop, 1, \amp, 0.5], g);
y = Synth.new(\playbuf_test, [\buf, ~b1.bufnum, \rate, 1.2, \loop, 1, \amp, 0.5], g);
z = Synth.new(\playbuf_test, [\buf, ~b2.bufnum, \rate, 2.1, \loop, 1, \amp, 0.5], g);
)

g.set(\rate, 0.8);
g.set(\rate, 0.5);
g.set(\buf, ~b3_part11.bufnum);
z.set(\rate, exprand(0.2, 2.0));
g.set(\loop, 0);
g.free;

(
SynthDef.new(\bufrd_test, {
	arg amp=1, out=0, buf;
	var sig, ptr;
	ptr = Line.ar(0, BufFrames.kr(buf)-1, BufDur.kr(buf), doneAction:2);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

Synth.new(\bufrd_test, [\buf, ~b2.bufnum]);

(
SynthDef.new(\bufrd_test, {
	arg amp=1, out=0, buf, start, end;
	var sig, ptr;
	ptr = Line.ar(start, end, BufDur.kr( buf), doneAction:2);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

SynthDef.new(\bufrd_test, [\buf, ~b2.bufnum, \start, ~b2.numFrames-1, \end, 0]);

(
SynthDef.new(\bufrd_loop, {
	arg amp=1, out=0, buf, start, end, rate=1;
	var sig, ptr;
	ptr = Phasor.ar(0, BufRateScale.kr(buf)*rate, start, end);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = SynthDef.new(\bufrd_loop, [\buf, ~b2.bufnum, \start, 0, \end, ~b2.numFrames-1]);

x.set(\start, ~b2.numFrames/2, \end, ~b2.numFrames-1);
x.set(\start, 2000. \end, 26000);
x.set(\rate, -7.midiratio);
x.free;

// favorite
(
SynthDef.new(\bufrd_sine, {
	arg amp=1, out=0, buf, start, end, rate=1;
	var sig, ptr;
	ptr = SinOsc.ar(freq, 3pi/2).range(start, end);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = SynthDef.new(\bufrd_sine, [\buf, ~b2.bufnum, \start, 0, \end, ~b2.numFrames-1]);

x.free;

(
SynthDef.new(\bufrd_noise, {
	arg amp=1, out=0, buf, start, end, rate=1;
	var sig, ptr;
	ptr = LFDNoise1.ar(freq).range(start, end);
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

w = SynthDef.new(\bufrd_noise, [\buf, ~b0.bufnum, \start, 0, \end, ~b0.numFrames-1, \freq, 0.6, \amp, 0.5]);
x = SynthDef.new(\bufrd_noise, [\buf, ~b1.bufnum, \start, 0, \end, ~b1.numFrames-1, \freq, 0.8, \amp, 0.5]);
y = SynthDef.new(\bufrd_noise, [\buf, ~b2.bufnum, \start, 0, \end, ~b2.numFrames-1, \freq, 0.7, \amp, 0.5]);
z = SynthDef.new(\bufrd_noise, [\buf, ~b3.bufnum, \start, 0, \end, ~b3.numFrames-1, \freq, 0.5, \amp, 0.2]);

s.freeAll;

g = Group.new;

w = SynthDef.new(\bufrd_noise, [\buf, ~b0.bufnum, \start, 0, \end, ~b0.numFrames-1, \freq, 0.6, \amp, 0.5], g);
x = SynthDef.new(\bufrd_noise, [\buf, ~b1.bufnum, \start, 0, \end, ~b1.numFrames-1, \freq, 0.8, \amp, 0.5], g);
y = SynthDef.new(\bufrd_noise, [\buf, ~b2.bufnum, \start, 0, \end, ~b2.numFrames-1, \freq, 0.7, \amp, 0.5], g);
z = SynthDef.new(\bufrd_noise, [\buf, ~b3.bufnum, \start, 0, \end, ~b3.numFrames-1, \freq, 0.5, \amp, 0.2], g);

g.set(\freq, 12);
g.set(\freq, 50);
g.set(\freq, 200);

s.freeAll;

// midi
MIDIClient.init;

MIDIIn.connectAll;

MIDIClient.sources;
MIDIIn.connect(0);
MIDIIn.connect(1);
MIDIIn.connect(2);

MIDIdef.noteOn(\noteOnTest, {"key down".postln});

MIDIdef(\noteOnTest).disable;

MIDIdef(\noteOnTest).enable;

MIDIdef(\noteOnTest).free;

MIDIdef.freeAll;

// command period off:true on:false
MIDIdef.noteOn(\noteOnTest, {"key down".postln}).permanent_(true);
MIDIdef.noteOn(\noteOnTest).permanent_(false);

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn, chan, src].postln;
});
)

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn].postln;
	{
		var sig, env;
		sig = SinOsc.ar(nn.midicps)!2;
		env = EnvGen.kr(Env.perc, doneAction:2);
		sig = sig * env * vel.linexp(1, 127, 0.01, 0.3);
	}.play;
});
)

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn].postln;
	{
		var sig, env;
		sig = LFTri.ar(nn.midicps)!2;
		env = EnvGen.kr(Env.perc, doneAction:2);
		sig = sig * env * vel.linexp(1, 127, 0.01, 0.3);
	}.play;
});
)

s.boot;

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn].postln;
	Synth.new(\tone, [\freq, nn.midicps, \amp, vel.linexp(1, 127, 0.01, 0.3)]);
});
)

(
SynthDef.new(\tone, {
	arg freq=440, amp=0.3, gate=0, bend=0;
	var sig, env;
	sig = LFTri.ar(freq * bend.midiratio)!2;
	env = EnvGen.kr(Env.adsr, gate, doneAction:2);
	sig = sig * env * amp;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\tone, [\gate, 1]);
x.set(\gate, 0);

~notes = Array.newClear(128);

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn].postln;
	~notes[nn] = Synth.new(
		\tone,
		[
			\freq, nn.midicps,
			\amp, vel.linexp(1, 127, 0.01, 0.3),
			\gate, 1,
			\bend, ~bend.linlin(0, 16383, -2, 2),
		]
	);
});

MIDIdef.noteOff(\noteOffTest, {
	arg vel, nn;
	[vel, nn].postln;
	~notes[nn].set(\gate, 0);
	~notes[nn] = nil;
});

MIDIdef.bend(\bendTest, {
	arg val, chan, src;
	[val, chan, src].postln;
	~bend = val;
	~notes.do{arg synth; synth.set(\bend, val.linlin(0, 16383, -2, 2))};
}, chan:0);
)

~bend = 8192;

nil.set(\freq, 880);

s.boot;

(
SynthDef.new(\sine, {
	arg freq=440, atk=0.005, rel=0.3, amp=1, pan=0;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel], [1, -1]), doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = sig * env;
	Out.ar(0, sig);
}).add;
)

Synth.new(\sine);

(
p = Pbind(
	\type, \note,
	\instrument, \sine,
).play;
)

p.stop;

s.plotTree;

(
p = Pbind(
	\instrument, \sine,
	\dur, 0.1,
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf).trace,
).play;
)

p.stop;

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf).trace,
	\freq, Pseq([330, 247, 370], inf).trace;
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], 4).trace,
	\freq, Pseq([330, 247, 370, 220], 2).trace;
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf).trace,
	\freq, Pseq([60, 65, 67, 74].midicps, inf).trace;
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf).trace,
	\midinote, Pseq([60, 65, 67, 74], inf).trace;
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf).trace,
	\freq, Pexprand(50, 4000),
).play;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf),
	\freq, Pexprand(50, 4000).trace,
	\atk, Pwhite(2.0, 3.0, inf),
	\rel, Pwhite(5.0, 10.0, inf),
	\amp, Pwhite(0.01, 0.2, inf),
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)

// favorite
(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf),
	\freq, Pexprand(50, 4000).round(55).trace,
	\atk, Pwhite(2.0, 3.0, inf),
	\rel, Pwhite(5.0, 10.0, inf),
	\amp, Pwhite(0.01, 0.2, inf),
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)

// favorite
(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf),
	\midinote, 33,
	\harmonic, Pexprand(1, 80, inf).round.trace,
	\atk, Pwhite(2.0, 3.0, inf),
	\rel, Pwhite(5.0, 10.0, inf),
	\amp, Pwhite(0.01, 0.2, inf),
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)

// favorite
(
p = Pbind(
	\instrument, \sine,
	\dur, Pwhite(0.05, 0.5, inf),
	\midinote, 33,
	\harmonic, Pexprand(1, 80, inf).round.trace,
	\atk, Pwhite(2.0, 3.0, inf),
	\rel, Pwhite(5.0, 10.0, inf),
	\amp, Pkey(\harmonic).reciprocal * 0.3,
	\pan, Pwhite(-0.8, 0.8, inf),
).play;
)

// favorite
(
Pdef(
	\sinepat,
	Pbind(
		\instrument, \sine,
		\dur, Pwhite(0.05, 0.5, inf),
		\midinote, Pseq([29], inf).trace,
		\harmonic, Pexprand(1, 80, inf).round,
		\atk, Pwhite(2.0, 3.0, inf),
		\rel, Pwhite(5.0, 10.0, inf),
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).play;
)

// favorite
(
Pdef(
	\sinepat,
	Pbind(
		\instrument, \sine,
		\dur, Pwhite(0.05, 0.5, inf),
		\midinote, Pseq([35], inf).trace,
		\harmonic, Pexprand(1, 20, inf).round,
		\atk, Pwhite(0.005, 0.01, inf),
		\rel, Pwhite(2.0, 3.0, inf),
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).play;
)

(
Pdef(
	\sinepat,
	Pbind(
		\instrument, \sine,
		\dur, Pwhite(0.05, 0.5, inf),
		\midinote, Pseq([35], inf).trace,
		\harmonic, Pexprand(1, 20, inf).round,
		\atk, Pwhite(0.005, 0.01, inf),
		\rel, Pwhite(0.2, 1.0, inf),
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).play;
)

(
d = Dictionary.new;
d.add(\l ->
	PathName("/Users/igram/Desktop/knocks/low").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
d.add(\m ->
	PathName("/Users/igram/Desktop/knocks/mid").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
d.add(\h ->
	PathName("/Users/igram/Desktop/knocks/high").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
)

d[\h].choose.play;

(
SynthDef.new(\bufplay, {
	arg buf=0, rate=1, amp=1;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.ir(buf) * rate, doneAction:2);
	sig = sig * amp;
	Out.ar(0, sig);
}).add;
)

Synth.new(\bufplay, [\buf, d[\m].choose.bufnum]);

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([0.12], inf),
		\buf, Prand(d[\h], inf),
		\rate, 1,
		\amp, 0.5,
	);
).play;
)

// tempo: 128
(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 60/128 * 4,
		\buf, Prand(d[\h]++d[\m]++d[l], inf),
		\rate, 1,
		\amp, 0.5,
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pxrand(d[\h]++d[\m]++d[l], inf),
		\rate, 1,
		\amp, 0.5,
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pwrand(d[\h][0], d[\m][0], d[\l][0], [0.8, 0.15, 0.05], inf),
		\rate, 1,
		\amp, 0.5,
	);
).play;
)

// favorite
(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pwrand(d[\h][0], d[\m][0], d[\l][0], [8,2,1].normalizeSum.postln, inf),
		\rate, 1,
		\amp, 0.5,
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Prand(d[\h]++d[\m]++d[\l], inf),
		\rate, 1,
		\amp, Pseq([0.8, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], inf),
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Prand(d[\h]++d[\m]++d[\l], inf),
		\rate, 1,
		\amp, Pseq([0.8]++(0.1!7), inf),
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Prand(d[\h]++d[\m]++d[\l], inf),
		\rate, 1,
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).play;
)

// favorite
(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pseq(
			[
				Prand(d[\l], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
				Prand(d[\h], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
			], inf
		),
		\rate, 1,
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).play;
)

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pseq(
			[
				Prand(d[\l], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
				Prand(d[\h], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
			], inf
		),
		\rate, 1,
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).play(quant:1.875);
)

// quantize
(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pseq(
			[
				Prand(d[\l], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
				Prand(d[\h], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
			], inf
		),
		\rate, 1,
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).quant_(1.875);
)

// favorite
(
Pdef(
	\sinepat,
	Pbind(
		\instrument, \sine,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\note, Pxrand([0, 3, 5, 9, 10, 12], inf),
		\gtranspose, -7,
		\atk, 0.005,
		\rel, Pexprand(0.01, 0.5, inf),
		\amp, Pexprand(0.05, 0.5, inf),
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).quant_(1.875);

Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufplay,
		\dur, Pseq([1/16], inf),
		\stretch, 1.875,
		\buf, Pseq(
			[
				Prand(d[\l], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
				Prand(d[\h], 1)
				Prand(d[\h]++d[\m]++d[\l], 7)
			], inf
		),
		\rate, Pexprand(3.5, 4.0, inf),
		\amp, Pseq([0.8, Pexprand(0.005, 0.2, 7)], inf),
	);
).quant_(1.875);
)

Pdef(\ryhthm).stop;
Pdef(\sinepat).stop;

// osc

s.boot;

NetAddr.langPort;

// TouchOSC setting
// port(outgoing): 57120
// port(incoming): 9000
(
OSCdef.new(
	\toggle,
	{
		arg msg, time, addr, port;
		[msg, time, addr, port].postln;
	},
	'/main/toggle1' // send from TouchOSC's toggle
);
)

(
OSCdef.new(
	\toggle,
	{
		arg msg, time, addr, port;
		msg[1].postln;
	},
	'/main/toggle1'
);
OSCdef.new(
	\fader1,
	{
		arg msg, time, addr, port;
		msg[1].postln;
	},
	'/main/fader1'
);
OSCdef.new(
	\fader2,
	{
		arg msg, time, addr, port;
		msg[1].postln;
	},
	'/main/fader2'
);
OSCdef.new(
	\rotary1,
	{
		arg msg, time, addr, port;
		msg[1].postln;
	},
	'/main/rotary1'
);
)

(
SynthDef.new(\tone, {
	arg freq=40, nharm=12, detune=0.2, gate=0, pan=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr(0.05, 0.1, 0.5, 3), gate);
	sig = Blip.ar(
		freq *
		LFNoise1.kr(0.2!16).bipolar(detune.neg, detune).midiratio,
		nharm
	);
	sig = sig * LFNoise1.kr(0.5!16).exprange(0.1, 1);
	sig = Splay.ar(sig);
	sig = Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add
)

x = Synth.new(\tone, [\gate, 1]);

x.set(\freq, 50);
x.set(\freq, 60);
x.set(\freq, 70);
x.set(\pan, -1);
x.set(\pan, 1);
x.set(\pan, 0);
x.set(\nharm, 24);
x.set(\nharm, 48);
x.set(\nharm, 100);
x.set(\nharm, 10);
x.set(\detune, 1);
x.set(\detune, 2);
x.set(\detune, 12);
x.set(\detune, 0.1);
x.set(\amp, 0.1);
x.set(\amp, 0.2);
x.set(\amp, 0.4);
x.set(\amp, 0.8);
x.set(\gate, 0);

x.free;

(
OSCdef.new(
	\toggle,
	{
		arg msg, time, addr, port;
		x.set(\gate, msg[1]);
	},
	'/main/toggle1'
);
OSCdef.new(
	\fader1,
	{
		arg msg, time, addr, port;
		x.set(\freq, msg[1].linexp(0, 1, 20, 500));
	},
	'/main/fader1'
);
OSCdef.new(
	\fader2,
	{
		arg msg, time, addr, port;
		x.set(\nharm, msg[1].linexp(0, 1, 1, 50));
	},
	'/main/fader2'
);
OSCdef.new(
	\accxyz,
	{
		arg msg, time, addr, port;
		x.set(\nharm, msg[1].linexp(0, 1, 1, 50));
	},
	'/accxyz'
);
OSCdef.new(
	\fader3,
	{
		arg msg, time, addr, port;
		x.set(\amp, msg[1].linexp(0, 1, 0.001, 1));
	},
	'/main/fader3'
);
OSCdef.new(
	\rotary1,
	{
		arg msg, time, addr, port;
		x.set(\pan, msg[1].linlin(0, 1, -1, 1));
	},
	'/main/rotary1'
);
OSCdef.new(
	\rotary4,
	{
		arg msg, time, addr, port;
		x.set(\detune, msg[1].linexp(0, 1, 0.01, 12));
	},
	'/main/rotary4'
);
)

x = Synth.new(\tone);

// Nintendo Wiimote
// OSC Routing 127.0.0.1:57120 (OSculator)

s.boot;

(
OSCdef.new(
	\pitch,
	{
		arg msg;
		msg[1].postln;
	},
	'/wii/1/accel/pry/0'
);
)

OSCdef(\pitch).disable;

(
OSCdef.new(
	\prya,
	{
		arg msg;
		msg[1..4].postln;
	},
	'/wii/1/accel/pry'
);
)

OSCdef(\prya).disable;

(
OSCdef.new(
	\abutton,
	{
		arg msg;
		msg[1..4].postln;
	},
	'/a'
);
)

OSCdef(\abutton).disable;

OSCdef.freeAll;

(
SynthDef.new(\foldsaw, {
	arg freq=4, detune=1, atk=0.01, dec=0.3, rel=3, c1=1, c2=(-1), gate=1, mincf=40, maxcf=12000, minrq=0.002, maxrq=0.2, boost=1.25, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr(atk, dec, 0.5, rel), gate, doneAction:2);
	sig = Saw.ar(
		freq +
		LFNoise1.kr(LFNoise1.kr(0.5!8).range(0.1, 1)).bipolar(detune)
	);
	5.do{sig = (sig * boost).fold(-1.0, 1.0)};
	sig = BPF.ar(
		sig,
		LFNoise1.kr({ExpRand(0.005, 0.05)}!8).exprange(mincf, maxcf),
		LFNoise1.kr({ExpRand(0.1, 0.75)}!8).range(minrq, maxrq)
	);
	sig = Splay.ar(sig) * env * amp * 2;
	Out.ar(out, sig);
}).add;
)

x = Synth.new(\foldsaw);

x.set(\gate, 0);

(
g = Group.new;
a = [];
OSCdef.new(\prya, {
	arg msg;
	g.set(
		\detune, msg[1].linexp(0.1, 0.001, 80),
		\maxrq, msg[2].linexp(0.1, 0.01, 0.5),
		\boost, msg[4].linlin(0.2, 1, 1, 16)
	);
}, '/wii/1/accel/pry'
);
OSCdef.new(\abutton, {
	arg msg;
	if(
		msg[1]==1,
		{
			a = a.add(
				Synth.new(
					\foldsaw,
					[
						\freq, exprand(1, 8),
						\atk, exprand(2, 8),
						\rel, exprand(2, 8)
					],
					g
				)
			)
		}
	);
}, '/a'
);
OSCdef.new(\bbutton, {
	arg msg;
	if(
		msg[1]==1 && (a.size>0),
		{
			a[0].set(\gate, 0);
			a.removeAt(0);
		}
	);
}, '/b'
);
)

s.plotTree;

// xbox kinect

s.boot;

// download: synapsekinect.tumblr.com

/*
recv -> 12346
send -> 12345 || 12347
loopback IP 0> 127.0.0.1
*/

~synapse = NetAddr.new("127.0.0.1", 12346);

~synapse.sendMsg("/righthand_trackjointpos", 2);

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand_pos_world',
	nil,
	12345
);
)

// world

(
~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;
)

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand_pos_world',
	nil,
	12345
);
)

(
OSCdef.freeAll;
~trackRH.stop;
)

// body

(
~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 1);
		2.wait;
	}.loop;
}).play;
)

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand_pos_body',
	nil,
	12345
);
)

(
OSCdef.freeAll;
~trackRH.stop;
)

// screen

(
~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 3);
		2.wait;
	}.loop;
}).play;
)

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand_pos_screen',
	nil,
	12345
);
)

(
OSCdef.freeAll;
~trackRH.stop;
)

// righthand

(
~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;
)

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand',
	nil,
	12345
);
)

// requiredlength, poithistorysize

~synapse.sendMsg("/righthand_requiredlength", 20.0);
~synapse.sendMsg("/righthand_poithistorysize", 60);


(
~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;
)

(
OSCdef.new(
	\trackRH,
	{
		arg msg;
		msg.postln;
	},
	'righthand',
	nil,
	12345
);
)

// pinknoise

(
~noise = {
	arg freq=440, gate=1;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq.lag(0.05), 0.3);
	sig = sig * EnvGen.kr(Env.adsr(5, 0, 1, 2, 1, 1), gate, doneAction:2);
}.play;
)

~noise.set(\freq, 50.linexp(0, 640, 100, 3000).postln);
~noise.set(\freq, 100.linexp(0, 640, 100, 3000).postln);
~noise.set(\freq, 500.linexp(0, 640, 100, 3000).postln);
~noise.set(\freq, 1000.linexp(0, 640, 100, 3000).postln);
~noise.set(\freq, 1500.linexp(0, 640, 100, 3000).postln);
~noise.set(\gate, 0);

(
~noise = {
	arg freq=440, gate=1, amp=0;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq.lag(0.05), 0.3);
	sig = sig * amp;
	sig = sig * EnvGen.kr(Env.adsr(5, 0, 1, 2, 1, 1), gate, doneAction:2);
}.play;
)

~noise.set(\amp, 800.linlin(0, 480, 0, -40).postln.dbamp);
~noise.set(\amp, 400.linlin(0, 480, 0, -40).postln.dbamp);
~noise.set(\amp, 200.linlin(0, 480, 0, -40).postln.dbamp);
~noise.set(\amp, 100.linlin(0, 480, 0, -40).postln.dbamp);
~noise.set(\gate, 0);

// favorite

(
~noise = {
	arg freq=440, gate=1, amp=0;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq.lag(0.05), 0.3);
	sig = sig * amp;
	sig = sig * EnvGen.kr(Env.adsr(5, 0, 1, 2, 1, 1), gate, doneAction:2);
}.play;

~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;

OSCdef.new(
	\trackRH,
	{
		arg msg;
		~noise.set(\freq, msg[1].linexp(0, 640, 100, 3000),
			\amp, msg[2].linlin(0, 480, 0 -40).postln.dbamp
		);
	},
	'/righthand_pos_screen',
	nil,
	12345
);

OSCdef.new(
	\trackRHhit,
	{
		arg msg;
		msg.postln;
		if(msg[1] == \forward,
			{~noise.set(\gate, 0)}
		);
	},
	'righthand',
	nil,
	12345
);
)

(
~noise.set(\gate, 0);
OSCdef.freeAll;
~trackRH.stop;
)

// group

(
g = Group.new;

{
	arg freq=440, gate=1, amp=0;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq.lag(0.05), 0.3);
	sig = sig * amp;
	sig = sig * EnvGen.kr(Env.adsr(5, 0, 1, 2, 1, 1), gate, doneAction:2);
}.play(g);

~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;

OSCdef.new(
	\trackRH,
	{
		arg msg;
		g.set(\freq, msg[1].linexp(0, 640, 100, 3000),
			\amp, msg[2].linlin(0, 480, 0 -40).postln.dbamp
		);
	},
	'/righthand_pos_screen',
	nil,
	12345
);

OSCdef.new(
	\trackRHhit,
	{
		arg msg;
		msg.postln;
		if(msg[1] == \forward,
			{g.set(\gate, 0)}
		);
	},
	'righthand',
	nil,
	12345
);
)

(
~noise.set(\gate, 0);
OSCdef.freeAll;
~trackRH.stop;
)

// forward, back

(
g = Group.new;

~trackRH = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 2);
		2.wait;
	}.loop;
}).play;

OSCdef.new(
	\trackRH,
	{
		arg msg;
		g.set(\freq, msg[1].linexp(0, 640, 100, 3000),
			\amp, msg[2].linlin(0, 480, 0 -40).postln.dbamp
		);
	},
	'/righthand_pos_screen',
	nil,
	12345
);

OSCdef.new(
	\trackRHhit,
	{
		arg msg;
		msg.postln;
		if(msg[1] == \forward,
			{g.set(\gate, 0)}
		);
		ifmsg[1] == \back,
		{
			{
				arg freq=440, gate=1, amp=0;
				var sig;
				sig = PinkNoise.ar(1!2);
				sig = BPF.ar(sig, freq.lag(0.05), 0.3);
				sig = sig * amp;
				sig = sig * EnvGen.kr(Env.adsr(0.05, 0, 1, 0.05, 1, 1), gate, doneAction:2);
			}.play(g);
		}
	},
	'righthand',
	nil,
	12345
);
)

(
~noise.set(\gate, 0);
OSCdef.freeAll;
~trackRH.stop;
)

// favorite

// grain sound

(
~engine = Buffer.read(s, "Users/igram/Desktop/ounds/engineStart.aiff");
~glass = Buffer.read(s, "Users/igram/Desktop/ounds/glassRub.aiff");


SynthDef.new(\grain, {
	arg buf=0, trnsp=0, spos=0, atk=0.01, sus=0.03, rel=0.01, pan=0, amp=1, out=0;
	var sig, env;
	sig = PlayBuf.ar(1, buf, BufRateScale.ir(buf) * trnsp.midiratio, startPos:spos, doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	env = EnvGen.kr(Env.new([0, 1, 1, 0], [atk, sus, rel], [1, 0, -1]), doneAction:2);
	sig = sig * env;
	Out.ar(out, sig);
}).add;

SynthDef.new(\echo, {
	arg in, t_fxtrig=0, out=0;
	var sig, fx, mix;
	sig = In.ar(in, 2);
	fx = In.ar(in, 2);
	3.do{fx = CombL.ar(fx, 0.25, LFNoise1.kr(0.05).range(0.04, 0.25), 4, 0.65)};
	mix = EnvGen.kr(Env.new([-0.9, 0.75, -0.9], [0.1, 5], \lin), t_fxtrig);
	sig = XFade2.ar(sig, fx, mix);
	Out.ar(out, sig);
}).add;

~fxbus = Bus.audio(s, 2);
~grainGrp = Group.new;
~fxGrp = Group.after(~grainGrp);
)

(
~enginePat = Pbind(
	\instrument, \grain,
	\dur, Pexprand(0.01, 0.2),
	\buf, ~engine.bufnum,
	\sus, Pexprand(0.01, 0.1),
	\trnsp, Pwhite(-3.0, 3.0),
	\spos, Pwhite(0, ~engine.numFrames-1),
	\pan, Pwhite(-1.0, 1.0),
	\amp, Pexprand(0.05, 0.2),
	\group, ~grainGrp,
	\out, ~fxbus
);

~glassPat = Pbind(
	\instrument, \grain,
	\dur, Pexprand(0.01, 0.2),
	\buf, ~glass.bufnum,
	\sus, Pexprand(0.01, 0.1),
	\trnsp, Pwhite(-3.0, 3.0),
	\spos, Pwhite(0, ~glass.numFrames-1),
	\pan, Pwhite(-1.0, 1.0),
	\amp, Pexprand(0.1, 0.25),
	\group, ~grainGrp,
	\out, ~fxbus
);

Synth.new(\echo, [\in, ~fxbus, \out, 0], ~fxGrp);
)

(
~engineStream = ~enginePat.play;
~glassStream = ~glassPat.play;

~fxGrp.set(\t_fxtrig, 1);

~engineStream.stop;
~glassStream.stop;
)

// custom for kinect

(
~enginePat = Pbind(
	\instrument, \grain,
	\dur, Pdefn(\durEngine, 0.1),
	\buf, ~engine.bufnum,
	\sus, Pexprand(0.01, 0.1),
	\trnsp, Pdefn(\trnspEngine, Pwhite(0, 0)),
	\spos, Pdefn(\sposEngine, 0),
	\pan, Pwhite(-1.0, 1.0),
	\amp, Pdefn(\ampEngine, 0.1),
	\group, ~grainGrp,
	\out, ~fxbus
);

~glassPat = Pbind(
	\instrument, \grain,
	\dur, Pdefn(\durGlass, 0.1),
	\buf, ~glass.bufnum,
	\sus, Pexprand(0.01, 0.1),
	\trnsp, Pdefn(\trnspGlass, Pwhite(0, 0)),
	\spos, Pdefn(\sposGlass, 0),
	\pan, Pwhite(-1.0, 1.0),
	\amp, Pdefn(\ampGlass, 0.1),
	\group, ~grainGrp,
	\out, ~fxbus
);

Synth.new(\echo, [\in, ~fxbus, \out, 0], ~fxGrp);
)

(
~trackHands = Task.new({
	{
		~synapse.sendMsg("/righthand_trackjointpos", 3);
		~synapse.sendMsg("/lefthand_trackjointpos", 3);
		2.wait;
	}.loop;
}).play;

OSCdef.new(
	\trackLHpos,
	{
		arg msg;
		Pfedn(\sposEngine, msg[1].linkin(0, 640, 0, ~engine.numFrames-1));
		Pfedn(\durEngine, msg[2].linexp(0, 480, 0.002, 1.5));
		Pfedn(\ampEngine, Pexprand(msg[2].linlin(0, 480, -16, -36).dbamp, 0.25));
		Pfedn(\trnspEngine, Pwhite(msg[3].linlin(800, 2500, 0, -36), msg[3].linlin(800, 2500, 0, 36)));
	},
	'/lefthand_pos_screen',
	nil,
	12345
);

OSCdef.new(
	\trackRHpos,
	{
		arg msg;
		Pfedn(\sposGlass, msg[1].linkin(0, 640, 0, ~glass.numFrames-1));
		Pfedn(\durGlass, msg[2].linexp(0, 480, 0.002, 1.5));
		Pfedn(\ampGlass, Pexprand(msg[2].linlin(0, 480, -16, -36).dbamp, 0.25));
		Pfedn(\trnspGlass, Pwhite(msg[3].linlin(800, 2500, 0, -36), msg[3].linlin(800, 2500, 0, 36)));
	},
	'/righthand_pos_screen',
	nil,
	12345
);

OSCdef.new(
	\trackLHhit,
	{
		argmsg;
		if(
			msg[1] == \forward,
			{~fxGrp.set(\t_fxtrig, 1)}
		);
	},
	'/lefthand',
	nil,
	12345
);

OSCdef.new(
	\trackRHhit,
	{
		argmsg;
		if(
			msg[1] == \forward,
			{~fxGrp.set(\t_fxtrig, 1)}
		);
	},
	'/righthand',
	nil,
	12345
);
)

(
~engineStream = ~enginePat.play;
~glassStream = ~glassPat.play;

~engineStream.stop;
~glassStream.stop;
)

// gui

w = Window.new;
w.front;
w.alwaysOnTop;
w.alwaysOnTop = true;
w.alwaysOnTop_(true); // syntax shortcuts
w.close;

(
w = Window.new
.front
.alwaysOnTop_(true);
)

GUI.current; // QtGUI

Window.closeAll;

w.bounds;

w.bounds_(Rect.new(1000, 400, 200, 200));
w.close;

Window.screenBounds;

(
w = Window.new("gui", Rect.new(
	Window.screenBounds.width/2-100,
	Window.screenBounds.height/2-100,
	200,
	200
))
.front
.alwaysOnTop_(true)
)

// favorite

(
w = Window.new("gui", Rect.new(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider.new(w.view, Rect.new(20, 20, 150, 30))
)

~slider.parent;

w.view.children;

~slider.visible_(true);
~slider.bounds_(Rect.new(40, 40, 200, 20));
~slider.enabled_(false);
~slider.enabled_(true);
~slider.remove;
w.view.children;

(
w = Window.new("gui", Rect.new(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect.new(20, 20, 150, 30))
)

~slider.value;
~slider.value_(0.25);
~slider.value_(0.8);
~slider.value;

~slider.action;
~slider.action_({"I am a slider".postln});

(
~slider.action_({
	arg obj;
	obj.value.postln;
});
)

~slider.value_(rrand(0.0, 1.0));

~slider.valueAction_(rrand(0.0, 1.0));

~slider.background;

~slider.background_(Color(1, 0.5, 0)); // orange
~slider.background_(Color.green);
~slider.background_(Color.magenta);
~slider.background_(Color.magenta(0.8));
~slider.background_(Color.magenta(0.0));
~slider.background_(Color.rand);

(
~slider.action_({
	arg obj;
	w.view.background_(Color.rand);
	obj.value.postln;
});
)

(
~slider.action_({
	arg obj;
	w.view.background_(Color(obj.value*0.3+0.7, 0.8, 0.4));
	obj.value.postln;
});
)

(
w = Window.new("gui", Rect.new(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect.new(20, 20, 150, 30))
.background_(Color(0.2, 0.75, 0.95));
)

~slider.knobColor_(Color.white);
~slider.knobColor_(Color.black);
~slider.thumbSize_(40);
~slider.thumbSize_(20);

// SuperCollider Tutorial: 14. GUI 16:00

s.boot;
s.plotTree;
s.meter;

(
SynthDef.new(\simplebpf, {
	arg freq=440;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq, 0.2);
	Out.ar(0, sig);
}).add;
)

(
Window.closeAll;
w = Window("gui", Rect(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20, 20, 150, 30))
.background_(Color(0.2, 0.75, 0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0, 1, 100, 4000).postln;
	x.set(\freq, cf);
});
)

x = Synth.new(\simplebpf);
x.free;

// favorite
(
SynthDef.new(\simplebpf, {
	arg freq=440;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(sig, freq.lag(0.5), 0.2);
	Out.ar(0, sig);
}).add;
)

(
x = Synth.new(
	\simplebpf,
	[
		\freq, ~slider.value.linexp(0, 1, 100, 4000)

	]
);
)

x.free;

// button
(
Window.closeAll;
w = Window("gui", Rect(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20, 20, 150, 30))
.background_(Color(0.2, 0.75, 0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0, 1, 100, 4000).postln;
	x.set(\freq, cf);
});

~button = Button(w, Rect(430, 20, 50, 30))
.states_([
	["OFF", Color.black, Color.gray(0.8)],
	["ON", Color.white, Color(0.2, 0.75, 0.95)]
])
.font_(Font("Monaco", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth.new(
				\simplebpf,
				[
					\freq, ~slider.value.linexp(0, 1, 100, 4000)
				]
			);
		},
		{x.free}
	);
})
)

// register
(
Window.closeAll;
w = Window("gui", Rect(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20, 20, 150, 30))
.background_(Color(0.2, 0.75, 0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0, 1, 100, 4000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
});

~button = Button(w, Rect(430, 20, 50, 30))
.states_([
	["OFF", Color.black, Color.gray(0.8)],
	["ON", Color.white, Color(0.2, 0.75, 0.95)]
])
.font_(Font("Monaco", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth.new(
				\simplebpf,
				[
					\freq, ~slider.value.linexp(0, 1, 100, 4000)
				]
			).register;
		},
		{x.free}
	);
})
)

// knob
(
SynthDef.new(\simplebpf, {
	arg freq=440, rq=0.2;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(
		sig,
		freq.lag(0.5),
		rq.lag(0.5),
		1/rq.sqrt.lag(0.5)
	);
	Out.ar(0, sig);
}).add;
)

(
Window.closeAll;
w = Window("gui", Rect(750, 50, 500, 200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20, 20, 150, 30))
.background_(Color(0.2, 0.75, 0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0, 1, 100, 4000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
});

~numberBox = NumberBox(w, Rect(180, 20, 80, 30))
.value_(100)
.clipLo_(100)
.clipHi_(4000)
.font_(Font("Monaco", 16))
.decimals_(2)
.action_({
	arg obj;
	~slider.valueAction_(obj.value.explin(100, 4000, 0, 1))
});

~knob = Knob(w, Rect(270, 20, 30, 30))
.action_({
	arg obj;
	var qual;
	qual = obj.value.linexp(0, 1, 1, 100).reciprocal;
	if(
		x.isPlaying,
		{x.set(\rq, qual)}
	);

});

~freqLabel = StaticText(w, Rect(180, 50, 80, 20))
.string_("freq")
.font_(Font("Monaco", 14))
.align_(\center);

~button = Button(w, Rect(430, 20, 50, 30))
.states_([
	["OFF", Color.black, Color.gray(0.8)],
	["ON", Color.white, Color(0.2, 0.75, 0.95)]
])
.font_(Font("Monaco", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth.new(
				\simplebpf,
				[
					\freq, ~slider.value.linexp(0, 1, 100, 4000),
					\rq, ~knob.value.linexp(0, 1, 1, 100).reciprocal
				]
			).register;
		},
		{x.free}
	);
})
)

(
~obj.remove;
~obj = PopUpMenu(w, Rect(20, 100, 120, 30))
.items_(["", "one", "two", "three"]);
)

(
~obj.remove;
~obj = RangeSlider(w, Rect(20, 100, 120, 30));
)

(
~obj.remove;
~obj = TextField(w, Rect(20, 100, 120, 30));
)

(
~obj.remove;
~obj = TextView(w, Rect(20, 100, 120, 80));
)

(
~obj.remove;
~obj = Slider2D(w, Rect(20, 100, 120, 80));
)

(
~obj.remove;
~obj = MultiSliderView(w, Rect(20, 100, 120, 80))
.size_(9);
)

// soundfileview
// To zoom in/out: Shift + right-click + mouse-up/down
// To scroll: right-click + mouse-left/right
(
w = Window.new("soundfile test", Rect(200, 300, 740, 100));
a = SoundFileView.new(w, Rect(20,20, 700, 60));

f = SoundFile.new;
f.openRead(Platform.resourceDir +/+ "sounds/a11wlk01.wav");
f.inspect;

a.soundfile = f;
a.read(0, f.numFrames);

a.timeCursorOn = true;
a.timeCursorColor = Color.red;
a.timeCursorPosition = 2050;
a.drawsWaveForm = true;
a.gridOn = true;
a.gridResolution = 0.2;

w.front;
)

// look up documentation for: shift + cmd + d

(
Window.closeAll;
w = Window("flow", Rect(850, 50, 400, 400))
.front
.alwaysOnTop_(true);

w.view.decorator_(FlowLayout(w.bounds, Point(15, 15), Point(7, 7)));
)

(
Window.closeAll;
w = Window("flow", Rect(850, 50, 400, 400))
.front
.alwaysOnTop_(true);

w.view.decorator_(FlowLayout(w.bounds, 15@15, 7@7)));
)

w.view.decorator.nextLine;
20.do{Knob(w, 40@40)};

w.view.children.collect(_.value_(rrand(0.0, 1.0)));

w.view.children.collect(_.remove);

w.view.decorator.reset;
Knob(w, 40@40);

w.close;

// composite view
(
Window.closeAll;
w = Window("nested", Rect(750, 50, 500, 500))
.front
.alwaysOnTop_(true);

w.view.decorator_(FlowLayout(w.bounds, 30@30, 30@30));

c = Array.fill(4, {
	arg view;
	view = CompositeView(w, 200@200)
	.background_(Color.rand);

	view.decorator_(FlowLayout(view.bounds, 5@5, 5@5));
});

Array.fill(5, {Slider(c[0], 30@150)});
Array.fill(5, {Knob(c[1], 40@40)});
)

c[0].children[2].value_(0.5);
c[1].children.collect(_.value_(0.75));

// composition

s.boot;
s.meter;
s.plotTree;

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq);
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

Synth(\bpfsaw);

(
[58, 65, 68, 73].midicps.do{
	arg f;
	Synth(
		\bpfsaw,
		[
			\freq, f,
			\amp, 0.25,
			\cf, f * exprand(1, 12),
			\rq, exprand(0.01, 0.5),
		]
	);
};
)

(
[58, 65, 68, 73].midicps.do{
	arg f;
	Synth(
		\bpfsaw,
		[
			\freq, exprand(100, 1000),
			\amp, 0.25,
			\cf, exprand(200, 5000),
			\rq, exprand(0.01, 0.5),
		]
	);
};
)

Scale.directory;

Scale.major;
Scale.minor;
Scale.chromatic;

(
4.do{
	arg f;
	Synth(
		\bpfsaw,
		[
			\freq, (Scale.minor.degrees+60).midicps.choose,
			\amp, 0.25,
			\cf, exprand(200, 5000),
			\rq, exprand(0.01, 0.5),
		]
	);
};
)

(
(1..6).choose.do{
	arg f;
	Synth(
		\bpfsaw,
		[
			\freq, (Scale.minor.degrees+60).midicps.choose,
			\amp, 0.25,
			\cf, exprand(200, 5000),
			\rq, exprand(0.01, 0.5),
		]
	);
};
)

// favorite

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5)); // detune
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5).range(detune.neg, detune)); // detune: range
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5).bipolar(detune)); // detune: range = bipolar (same thing, more convenient)
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, cf=1500, rq=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio); // midiratio
	sig = BPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

Synth(\bpfsaw);

2.do{Synth(\bpfsaw, [\amp, 0.5])};

10.do{Synth(\bpfsaw, [\amp, 0.2])};

10.do{Synth(\bpfsaw, [\amp, 0.2, \detune, 0])};

10.do{Synth(\bpfsaw, [\amp, 0.2, \detune, 3])};

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio); // midiratio
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.2,
		],
	);
};
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.2,
			\cfmin, 50*2, // center frequency
			\cfmax, 50*50,
		],
	);
};
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.2,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.8,
			\rqmax, 1,
		],
	);
};
)

// favorite

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.2,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.005,
			\rqmax, 0.03,
		],
	);
};
)

// stereo

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio);
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = Pan2.ar(sig, pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio);
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = sig * env * amp;
	Out.ar(out, sig!2);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.4,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.005,
			\rqmax, 0.03,
			\pan, rrand(-1.0, 1.0),
		],
	);
};
)

rrand(0, 100)!4;
{rrand(0, 100)}!4;

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(0.2).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
	);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.4,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.005,
			\rqmax, 0.03,
		],
	);
};
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(0.2).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
	);
	sig = Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.4,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.005,
			\rqmax, 0.03,
			\pan, 0, // L:-1 R:1
		],
	);
};
)

s.options.numOutputBusChannels_(8);
s.reboot;
s.meter;

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio);
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = PanAz.ar(8, sig, pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 20,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 20*40,
			\cfmax, 20*50,
			\pan, 0.5,
		],
	);
};
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio);
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = PanAz.ar(8, sig, LFSaw.kr(0.5));
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 20,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 20*40,
			\cfmax, 20*50,
		],
	);
};
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * LFNoise1.kr(0.5, detune).midiratio);
	sig = BPF.ar(
		sig,
		LFNoise1.kr(0.2).exprange(cfmin, cfmax),
		LFNoise1.kr(0.1).exprange(rqmin, rqmax)
	);
	sig = PanAz.ar(8, sig, LFNoise1.kr(1));
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 20,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 20*40,
			\cfmax, 20*50,
		],
	);
};
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(0.2).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
	);
	sig =Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

{SinOsc.ar(440, 0, 0.2!2)}.play;
{SinOsc.ar(LFNoise0.kr(8).exprange(200, 800), 0, 0.2!2)}.play;
{SinOsc.ar(LFNoise0.kr(LFNoise0.kr(8).exprange(2, 30)).exprange(200, 800), 0, 0.2!2)}.play;

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 20,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 20*40,
			\cfmax, 20*50,
		],
	);
};
)

// favorite

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(
			LFNoise1.kr(4).exprange(cfhzmin, cfhzmax)
		).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
	);
	sig =Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.01,
			\rqmax, 0.05,
		],
	);
};
)

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.01,
			\rqmax, 0.05,
			\cfhzmin, 1,
			\cfhzmax, 6,
		],
	);
};
)

// favorite

(
10.do{
	Synth(
		\bpfsaw,
		[
			\freq, 50,
			\amp, 0.5,
			\detune, 1,
			\cfmin, 50*2,
			\cfmax, 50*50,
			\rqmin, 0.01,
			\rqmax, 0.05,
			\cfhzmin, 5, // bubble
			\cfhzmax, 40, // bubble
		],
	);
};
)

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, lsf=200, ldb=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(
			LFNoise1.kr(4).exprange(cfhzmin, cfhzmax)
		).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
	);
	sig = BLowShelf.ar(sig, lsf, 0.5, ldb);
	sig =Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

// favorite

(
Pbind(
	\instrument, \bpfsaw,
	\dur, 2,
	\midinote, Pseq([54, 61, 56], 1),
	\detune, 0.08,
	\cfmin, 100,
	\cfmax, 1500,
	\atk, 1,
	\ldb, 6,
	\amp, 0.2,
	\out, 0,
).play;
)

// favorite

(
Pbind(
	\instrument, \bpfsaw,
	\dur, 5,
	\midinote, Pseq([
		[23, 35, 54, 63, 64],
		[45, 52, 54, 59, 61, 64],
		[28, 40, 47, 56, 59, 63],
	], 1),
	\detune, 0.08,
	\cfmin, 100,
	\cfmax, 1500,
	\atk, 2,
	\rel, 8,
	\ldb, 6,
	\amp, 0.2,
	\out, 0,
).play;
)

(
Pbind(
	\instrument, \bpfsaw,
	\dur, 5,
	\midinote, Pxrand([
		[23, 35, 54, 63, 64],
		[45, 52, 54, 59, 61, 64],
		[28, 40, 47, 56, 59, 63],
		[42, 52, 57, 61, 63]
	], 1),
	\detune, 0.08,
	\cfmin, 100,
	\cfmax, 1500,
	\atk, 2,
	\rel, 8,
	\ldb, 6,
	\amp, 0.2,
	\out, 0,
).play;
)

// favorite

(
~chords = Pbind(
	\instrument, \bpfsaw,
	\dur, Pwhite(4, 5, 7, 0, inf),
	\midinote, Pxrand([
		[23, 35, 54, 63, 64],
		[45, 52, 54, 59, 61, 64],
		[28, 40, 47, 56, 59, 63],
		[42, 52, 57, 61, 63]
	], inf),
	\detune, Pexprand(0.05, 0.2, inf),
	\cfmin, 100,
	\cfmax, 1500,
	\atk, Pwhite(2.0, 2.5, inf),
	\rel, Pwhite(6.5, 10.0, inf),
	\ldb, 6,
	\amp, 0.2,
	\out, 0,
).play;
)

~chords.stop;

(
Synth.new(
	\bpfsaw,
	[
		\freq, 2,
		\atk, 0,
		\rqmin, 0.02,
		\rqmax, 0.05,
	]
);
)

(
Synth.new(
	\bpfsaw,
	[
		\freq, 2,
		\atk, 0,
		\rqmin, 0.005,
		\rqmax, 0.008,
	]
);
)

(
Synth.new(
	\bpfsaw,
	[
		\freq, 2,
		\atk, 0,
		\rqmin, 0.005,
		\rqmax, 0.008,
		\cfmin, 880,
		\cfmax, 880,
	]
);
)

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1, 1, inf),
	\freq, Pexprand(0.25, 9, inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, 150,
	\cfmax, 1500,
	\amp, 1,
	\out, 0,
).play;
)

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1, 1, inf),
	\freq, Pexprand(0.25, 9, inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Pexprand(150, 1500, inf),
	\cfmax, Pkey(\cfmin),
	\amp, 1,
	\out, 0,
).play;
)

// favorite

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1, 1, inf),
	\freq, Pexprand(0.25, 9, inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf),
	\cfmax, Pkey(\cfmin),
	\amp, 1,
	\out, 0,
).play;
)

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1, 1, inf),
	\freq, Pexprand(0.25, 9, inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
	\cfmax, Pkey(\cfmin),
	\amp, 1,
	\out, 0,
).play;
)

// favorite

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Prand([1, 0.5], inf),
	\freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf), // beautiful!
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
	\cfmax, Pkey(\cfmin),
	\amp, 1,
	\out, 0,
).play;
)

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Prand([1, 0.5], inf),
	\freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
	\cfmax, Pkey(\cfmin),
	\atk, 3,
	\sus, 1,
	\rel, 5,
	\amp, 1,
	\out, 0,
).play;
)

~marimba.stop;

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Prand([1, 0.5], inf),
	\freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
	\cfmax, Pkey(\cfmin) * Pwhite(1.008, 1.025, inf),
	\atk, 3,
	\sus, 1,
	\rel, 5,
	\amp, 1,
	\out, 0,
).play;
)

// favorite
(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Prand([1, 0.5], inf),
	\freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf),
	\detune, Pwhite(0, 0.1, inf), // detune
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
	\cfmax, Pkey(\cfmin) * Pwhite(1.008, 1.025, inf),
	\atk, 3,
	\sus, 1,
	\rel, 5,
	\amp, 1,
	\out, 0,
).play;

~chords = Pbind(
	\instrument, \bpfsaw,
	\dur, Pwhite(4, 5, 7, 0, inf),
	\midinote, Pxrand([
		[23, 35, 54, 63, 64],
		[45, 52, 54, 59, 61, 64],
		[28, 40, 47, 56, 59, 63],
		[42, 52, 57, 61, 63]
	], inf),
	\detune, Pexprand(0.05, 0.2, inf),
	\cfmin, 100,
	\cfmax, 1500,
	\atk, Pwhite(2.0, 2.5, inf),
	\rel, Pwhite(6.5, 10.0, inf),
	\ldb, 6,
	\amp, 0.2,
	\out, 0,
).play;
)

~chords.stop;
~marimba.stop;

// composition II

~b1 = Buffer.read(s, "/Users/igram/Desktop/supercollider/buffers/shakers/shakerSustain.aiff");
~b2 = Buffer.read(s, "/Users/igram/Desktop/supercollider/buffers/shakers/shakerSustain.aiff");
~b3 = Buffer.read(s, "/Users/igram/Desktop/supercollider/buffers/shakers/shakerSustain.aiff");

SynthDef(\bpfbuf, {
	arg atk=0, sus=0, rel=3, c1=1, c2=(-1), buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0, pan=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
	sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf), startPos:spos);
	sig = XFade2.ar(sig, BPF.ar(sig, freq, rq, 1/rq.sqrt), bpfmix*2-1);
	sig = sig * env;
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
)

Synth(\bpfbuf, [\buf, ~b2.bufnum]);
Synth(\bpfbuf, [\buf, ~b2]);

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\rel, 0.1,
		\spos, rrand(0, ~b2.numFrames/2),
	]
);
)


(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/20,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/50,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/150,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/400,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/400,
		\rate, 0.5,
	]
);
)

(
Synth(
	\bpfbuf,
	[
		\buf, ~b2,
		\atk, 2,
		\sus, 1,
		\rel, 2,
		\bpfmix, 1,
		\freq, 2000,
		\rq, 1/400,
		\rate, 0.25,
	]
);
)

// favorite

(
Synth(
	\bpfbuf,
	[
		\buf, [~b1, ~b2, ~b3].choose,
		\atk, exprand(2, 3),
		\sus, 1,
		\rel, exprand(2, 3),
		\bpfmix, 1,
		\freq, (Scale.lydian.degrees+69).choose.midicps * [1, 2].choose,
		\rq, exprand(0.001, 0.008),
		\rate, exprand(0.6, 1.2),
		\pan, rrand(-0.5, 0.5),
		\amp, exprand(4, 6),
	]
);
)

// favorite

(
rrand(4, 10).do{
	Synth(
		\bpfbuf,
		[
			\buf, [~b1, ~b2, ~b3].choose,
			\atk, exprand(2, 3),
			\sus, 1,
			\rel, exprand(2, 3),
			\bpfmix, 1,
			\freq, (Scale.lydian.degrees+69).choose.midicps * [1, 2].choose,
			\rq, exprand(0.001, 0.008),
			\rate, exprand(0.6, 1.2),
			\pan, rrand(-0.5, 0.5),
			\amp, exprand(4, 6),
		]
	);
}
)

// set "buffers" folder in project root directory

Buffer.read

// dictionary

d = Dictionary.new;

d.add(\foo -> 10);
d.add(\bar -> 20);
d[\bar];


Buffer.freeAll;

(
b = Dictionary.new;
)

b[\shakers][0];
b[\crotales][2];

(
b = Dictionary.new;
PathName("/Users/igram/Desktop/supercollider/buffers/").entries.do{
	arg subfolder;
	b.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
				Buffer.read(s, subfolder.entries[i].fullPath);
			}
		)
	);
};
)

b.class;
b.size;
b.keys; // symbols

b[\crotales][2].play;
b[\deskBells][8].play;
b[\deskBells][10].play;
b[\deskBells][12].play;
b[\shakers][2].play;
b[\shakers][3].play;
b[\shakers][4].play;

// favorite

(
rrand(4, 10).do{
	Synth(
		\bpfbuf,
		[
			\buf, b[\shakers][[5, 6, 7].choose],
			\atk, exprand(2, 3),
			\sus, 1,
			\rel, exprand(2, 3),
			\bpfmix, 1,
			\freq, (Scale.lydian.degrees+69).choose.midicps * [1, 2].choose,
			\rq, exprand(0.001, 0.008),
			\rate, exprand(0.6, 1.2),
			\pan, rrand(-0.5, 0.5),
			\amp, exprand(4, 6),
		]
	);
}
)

(
5.do{
	Synth(
		\bpfbuf,
		[
			\buf, b[\crotales][2],
			\atk, 2,
			\rel, 2,
			\spos, rrand(30000, 35000),
			\rate, 0.5 * exprand(0.98, 1.02),
		],
	);
}
)

// reverb

(
Synth(
	\bpfbuf,
	[
		\buf, [~b1, ~b2, ~b3].choose,
		\atk, exprand(2, 3),
		\sus, 1,
		\rel, exprand(2, 3),
		\bpfmix, 1,
		\freq, (Scale.lydian.degrees+69).choose.midicps * [1, 2].choose,
		\rq, exprand(0.001, 0.008),
		\rate, exprand(0.6, 1.2),
		\pan, rrand(-0.5, 0.5),
		\amp, exprand(4, 6),
	]
);

SynthDef(\reverb, {
	arg in, predelay=0.1, revtime=1.8, lpf=4500, mix=0.15, amp=1, out=0;
	var dry, wet, temp, sig;
	dry = In.ar(in, 2);
	temp = In.ar(in, 2);
	wet = 0; // DC.ar(0)!2 or Silent.ar(2), but 0 is fine.
	temp= DelayN.ar(temp, 0.2, predelay);
	16.do{
		temp = AllpassN.ar(temp, 0.05, {Rand(0.001, 0.05)}!2, revtime);
		temp = LPF.ar(temp, lpf);
		wet = wet + temp;
	};
	sig = XFade2.ar(dry, wet, mix*2-1, amp);
	Out.ar(out, sig);
}).add;
)

~reverbBus = Bus.audio(s, 2);
~reverbSynth = Synth(\reverb, [\in, ~reverbBus]);

(
Synth(
	\bpfbuf,
	[
		\buf, b[\shakers][(0..4).choose],
		\rel, rrand(0.15, 0.25),
		\rate, rrand(-2.0, 2.0).midiratio,
		\out, ~reverbBus,
	]
);
)

(
p = Pbind(
	\instrument, \bpfbuf,
	\dur, Pexprand(0.1, 1),
	\buf, Pxrand(b[\shakers][(5..7)]++b[\deskBells][(0..2)], inf),
	\rel, Pexprand(0.01, 0.5),
	\spos, Pwhite(10000, 40000),
	\rate, Pwhite(-7.0, 7.0).midiratio,
	\amp, Pexprand(0.5, 0.9),
	\out, ~reverbBus,
).play;
)

p.stop;

// favorite

(
p = Pbind(
	\instrument, \bpfbuf,
	\dur, Pexprand(0.1, 1),
	\buf, Pxrand(b[\shakers][(5..7)]++b[\deskBells][(0..2)], inf),
	\rel, Pexprand(0.01, 0.5),
	\spos, Pwhite(10000, 40000),
	\rate, Pwhite(-7.0, 7.0).midiratio,
	\amp, Pexprand(0.5, 0.9),
	\out, Prand([~reverbBus, 0], inf),
).play;
)

~reverbSynth.set(\mix, 1);

p.stop;

// server tree

(
p = Pbind(
	\instrument, \bpfbuf,
	\dur, Pexprand(0.1, 1),
	\buf, Pxrand(b[\shakers][(5..7)]++b[\deskBells][(0..2)], inf),
	\rel, Pexprand(0.01, 0.5),
	\spos, Pwhite(10000, 40000),
	\rate, Pwhite(-7.0, 7.0).midiratio,
	\amp, Pexprand(0.5, 0.9),
	\out, ~reverbBus,
).play;
)

~createReverb = {~reverbSynth = Synth(\reverb, [\in, ~revebBus])};
ServerTree.add(~createReverb);
ServerTree.removeAll;

// composition III

// 1. server config

(
s = Server.local;
s.options.outDevice_("Scarlett 18i20 USB");
s.options.numOutputBusChannels_(2);
s.options.inDevice_("Scarlett 18i20 USB");
s.options.sampleRate_(44100);
s.options.memSize_(2.pow(20));
s.newBusAllocators;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;

/*
10.do{{DelayN.ar(PinkNoise.ar(0.02), 1, 1)}.play;}
50.do{{DelayN.ar(PinkNoise.ar(0.02), 1, 1)}.play;} // server's memory allocation

s.options.memSize; // realtime memory
// 1 sample = 4 bytes
44100 * 4 / 1000 // kb
44100 * 4 / 1000 * 50 // 50 second delay
2.pow(20) // gigabyte

s.quit;
s.boot;
s.meter;
s.

ServerOptions.devices;
*/

// 2. initialize global variables

~out = 0;
~path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";

/*
{Out.ar(0, PinkNoise.ar(0.2))}.play;
Synth.new(\sound, [\out, 0]);

{Out.ar(~out, PinkNoise.ar(0.2))}.play;
Synth.new(\sound, [\out, ~out]);
*/

// 3. define piece-specific functions

~makeBuffers = {
	b = Dictionary.new;
	PathName(~path).entries.do{
		arg subfolder;
		b.add(
		subfolder.folderName.asSymbol ->
			Array.fill(
				subfolder.entries.size,
				{
					arg i;
					Buffer.read(s, subfolder.entries[i].fullPath);
				}
			)
		);
	};
};

~makeBusses = {
	~bus = Dictionary.new;
	~bus.add(\reverb -> Bus.audio(s, 2));
};

~cleanUp = {
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

~makeNodes = {
	s.bind({
		~mainGrp = Group.new;
		~reverbGrp = Group.after(~mainGrp);
		~reverbSynth = Synth.new(
			\reverb,
			[
				\amp, 1,
				\predeley, 0.1,
				\revtime, 1.8,
				\lpf, 4500,
				\mix, 0.35,
				\in, ~bus[\reverb],
				\out, ~out,
			],
			~reverbGrp
		);
	});
};

~makeEvents = {
	MIDIIn.connectAll;
	e = Dictionary.new;
	e.add(\event1 -> {"event1.postln"});
	e.add(\event2 -> {"event2.postln"});
	e.add(\event3 -> {"event3.postln"});

	MIDIdef.cc(\controller,  {nil});
};

/*
~makeBuffers = {
b = Dictionary.new;
PathName("/Users/igram/Desktop/Tutorial Piece/buffers/").entries.do{
	arg subfolder;
	b.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
				Buffer.read(s, subfolder.entries[1].fullPath);
			}
		)
	);
};
}

s.options.numAudioBusChannels;
*/

// 4. register functions width server boot/quit/tree

ServerBoot.add(~makeBuffers);
ServerBoot.add(~makeBusses);
ServerQuit.add(~cleanUp);

/*
b;
b[\shakers][0].play;
b[\shakers][1].play;
b[\shakers][2].play;
b[\shakers][3].play;
Buffer.freeAll;
s.quit;

true;
false;
thisProcess;
thisProcess.nowExecutingPath;
*/

// 5. boot server

s.waitForBoot({
	s.sync;

	// 6a. synth defs
	SynthDef(\bpfsaw, {
		arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, lsf=200, ldb=0, amp=1, out=0;
		var sig, env;
		env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
		sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
		sig = BPF.ar(
			sig,
			{LFNoise1.kr(
				LFNoise1.kr(4).exprange(cfhzmin, cfhzmax)
			).exprange(cfmin, cfmax)}!2,
			{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
		);
		sig = BLowShelf.ar(sig, lsf, 0.5, ldb);
		sig =Balance2.ar(sig[0], sig[1], pan);
		sig = sig * env * amp;
		Out.ar(out, sig);
	}).add;

	SynthDef(\bpfbuf, {
		arg atk=0, sus=0, rel=3, c1=1, c2=(-1), buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0, pan=0, amp=1, out=0;
		var sig, env;
		env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf), startPos:spos);
		sig = XFade2.ar(sig, BPF.ar(sig, freq, rq, 1/rq.sqrt), bpfmix*2-1);
		sig = sig * env;
		sig = Pan2.ar(sig, pan, amp);
		Out.ar(out, sig);
	}).add;

	SynthDef(\reverb, {
		arg in, predelay=0.1, revtime=1.8, lpf=4500, mix=0.15, amp=1, out=0;
		var dry, wet, temp, sig;
		dry = In.ar(in, 2);
		temp = In.ar(in, 2);
		wet = 0; // DC.ar(0)!2 or Silent.ar(2), but 0 is fine.
		temp= DelayN.ar(temp, 0.2, predelay);
		16.do{
			temp = AllpassN.ar(temp, 0.05, {Rand(0.001, 0.05)}!2, revtime);
			temp = LPF.ar(temp, lpf);
			wet = wet + temp;
		};
		sig = XFade2.ar(dry, wet, mix*2-1, amp);
		Out.ar(out, sig);
	}).add;

	s.sync;

	// 6b. register remaining functions
	ServerTree.add(~makeNodes);
	ServerTree.add(~makeEvents);
	s.freeAll;

	s.sync;

	"done".postln;
});
)

s.quit;

b;
b[\shakers][0].play;


/*
s.boot;

(
SynthDef(\synctest0001, {
	var sig;
	sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
	sig = sig.sum;
	sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
	Out.ar(0, sig!2);
}).add;

1.wait;

Synth(\synctest0001);
)

(
SynthDef(\synctest0002, {
	var sig;
	sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
	sig = sig.sum;
	sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
	Out.ar(0, sig!2);
}).add;

1.wait;

Synth(\synctest0002);
)

(
Routine({
	~win = Window.new.front;
	{SinOsc.ar(440!2) * Line.kr(0.5, 0, 1, doneAction:2)}.play;
	2.wait;
	{SinOsc.ar(660!2) * Line.kr(0.5, 0, 1, doneAction:2)}.play;
}).play;
)

// app clock
// tempo clock
// system clock

(
Routine({
	~win = Window.new.front;
	{SinOsc.ar(440!2) * Line.kr(0.5, 0, 1, doneAction:2)}.play;
	2.wait;
	{SinOsc.ar(660!2) * Line.kr(0.5, 0, 1, doneAction:2)}.play;
}).play(AppClock);
)

(
Routine({
	SynthDef(\synctest0003, {
		var sig;
		sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
		sig = sig.sum;
		sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
		Out.ar(0, sig!2);
	}).add;

	1.wait;

	Synth(\synctest0003);
}).play(AppClock);
)

(
Routine({
	SynthDef(\synctest0004, {
		var sig;
		sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
		sig = sig.sum;
		sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
		Out.ar(0, sig!2);
	}).add;

	s.sync;

	Synth(\synctest0004);
}).play(AppClock);
)

(
s.waitForBoot({
	SynthDef(\synctest0005, {
		var sig;
		sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
		sig = sig.sum;
		sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
		Out.ar(0, sig!2);
	}).add;

	s.sync;

	Synth(\synctest0005);
});
)

(
s.waitForBoot({
	~win = Window.new.front;
	SynthDef(\synctest0005, {
		var sig;
		sig = {SinOsc.ar(ExpRand(300, 3000), 0, 0.02)}!50;
		sig = sig.sum;
		sig = sig * EnvGen.kr(Env([0, 1, 0],[2, 2],[1, -1]), doneAction:2);
		Out.ar(0, sig!2);
	}).add;

	s.sync;

	Synth(\synctest0005);
});
)
*/

// favorite

// start up (final edition)

s.quit;

(
// 1. server config
s = Server.local;
s.options.outDevice_("Scarlett 18i20 USB");
s.options.numOutputBusChannels_(2);
s.options.inDevice_("Scarlett 18i20 USB");
s.options.sampleRate_(44100);
s.options.memSize_(2.pow(20));
s.newBusAllocators;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;

// 2. initialize global variables
~out = 0;
~path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";

// 3. define piece-specific functions
~makeBuffers = {
	b = Dictionary.new;
	PathName(~path).entries.do{
		arg subfolder;
		b.add(
		subfolder.folderName.asSymbol ->
			Array.fill(
				subfolder.entries.size,
				{
					arg i;
					Buffer.read(s, subfolder.entries[i].fullPath);
				}
			)
		);
	};
};

~makeBusses = {
	~bus = Dictionary.new;
	~bus.add(\reverb -> Bus.audio(s, 2));
};

~cleanUp = {
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

~makeNodes = {
	s.bind({
		~mainGrp = Group.new;
		~reverbGrp = Group.after(~mainGrp);
		~reverbSynth = Synth.new(
			\reverb,
			[
				\amp, 1,
				\predeley, 0.1,
				\revtime, 1.8,
				\lpf, 4500,
				\mix, 0.35,
				\in, ~bus[\reverb],
				\out, ~out,
			],
			~reverbGrp
		);
	});
};

~makeEvents = {
	MIDIIn.connectAll;
	e = Dictionary.new;
	e.add(\event1 -> {

		~shakersustain = Pbind(
			\instrument, \bpfbuf,
			\dur, Pwhite(0.2, 0.7),
			\atk, Pexprand(2, 4),
			\rel, Pexprand(3, 5),
			\buf, b[\shakers][13].bufnum,
			\rate, Pwhite(-7.0, -4.0).midiratio,
			\spos, Pwhite(0, b[\shakers][13].numFrames/2),
			\amp, Pexprand(0.17, 0.25),
			\freq, {rrand(85.0, 105.0).midicps}!3,
			\rq, 0.005,
			\bpfmix, 0.97,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;

		~drone = Pbind(
			\instrument, \bpfsaw,
			\dur, 1,
			\freq, 26.midicps,
			\detunes, Pwhite(0.03, 0.2),
			\rqmin, 0.08,
			\rqmax, 0.12,
			\cfmin, 50,
			\cfmax, 400,
			\atk, 2,
			\sus, 0.1,
			\rel, 2,
			\amp, 0.5,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;

	});
	e.add(\event2 -> {

		Routine({
			~bellCloud = Pbind(
				\instrument, \bpfbuf,
				\dur, Pexprand(0.2, 2),
				\atk, Pexprand(0.5, 2),
				\rel, Pexprand(2, 6),
				\buf, b[\deskBells][0],
				\rate, Pwhite(-7.5, -5.5).midiratio,
				\spos, Pwhite(5000, 80000),
				\amp, Pexprand(2, 5),
				\bpfmix, 0,
				\group, ~mainGrp,
				\out, ~bus[\reverb],
			).play;

			~bubbles = Pbind(
				\instrument, \bpfsaw,
				\dur, Pwhite(0.1, 0.5),
				\freq, Pexprand(1, 25),
				\detune, Pwhite(0.03, 0.2, inf),
				\rqmin, 0.1,
				\rqwmax, 0.5,
				\cfmin, 0.1,
				\cfmax, 2000,
				\atk, 2,
				\sus, 0,
				\rel, Pexprand(3, 8),
				\pan, Pwhite(-0.9, 0.9),
				\amp, Pexprand(0.05, 0.1),
				\group, ~mainGrp,
				\out, ~bus[\reverb],
			).play;

			4.wait;

			~shakersustain.stop;
			~drone.stop;
		}).play(AppClock);
	});
	e.add(\event3 -> {
		~bellCloud.stop;
		~bubbles.stop;

		~bellTone = Pbind(
			\instrument, \bpfbuf,
			\dur, Pexprand(0.5, 3),
			\atk, 2,
			\rel, 2,
			\buf, b[\deskBells][11],
			\rate, Pwhite(-0.08, 0.08).midiratio,
			\spos, Pwhite(5000, 20000),
			\amp, Pexprand(2, 3.5),
			\bpfmix, 0,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;

		~simpleMarimba = Pbind(
			\instrument, \bpfsaw,
			\dur, Prand([0.5, 1, 2, 3], inf),
			\freq, Prand([1/2, 3/4, 1, 3/2, 2], inf),
			\detune, Pwhite(0, 0.002),
			\rqmin, 0.005,
			\rqmax, 0.008,
			\cfmin, Prand([61, 71, 78, 85, 95].midicps, inf),
			\cfmax, Pkey(\cfmin) * Pwhite(1.008, 1.025, inf),
			\atk, 3,
			\sus, 1,
			\rel, 5,
			\amp, 1,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;
	});
	e.add(\event4 -> {
		~bellTone.stop;
		~simpleMarimba.stop;

		~marimba = Pbind(
			\instrument, \bpfsaw,
			\dur, Prand([1, 0.5], inf),
			\freq, Prand([1/2, 2/3, 1, 4/3, 2, 5/2, 3, 4, 6, 8], inf),
			\detune, Pwhite(0, 0.1, inf), // detune
			\rqmin, 0.005,
			\rqmax, 0.008,
			\cfmin, Prand((Scale.major.degrees+64).midicps, inf) * Prand([0.5, 1, 2, 4], inf),
			\cfmax, Pkey(\cfmin) * Pwhite(1.008, 1.025, inf),
			\atk, 3,
			\sus, 1,
			\rel, 5,
			\amp, 1,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;

		~chords = Pbind(
			\instrument, \bpfsaw,
			\dur, Pwhite(4, 5, 7, 0, inf),
			\midinote, Pxrand([
				[23, 35, 54, 63, 64],
				[45, 52, 54, 59, 61, 64],
				[28, 40, 47, 56, 59, 63],
				[42, 52, 57, 61, 63]
			], inf),
			\detune, Pexprand(0.05, 0.2, inf),
			\cfmin, 100,
			\cfmax, 1500,
			\atk, Pwhite(2.0, 2.5, inf),
			\rel, Pwhite(6.5, 10.0, inf),
			\ldb, 6,
			\amp, 0.2,
			\group, ~mainGrp,
			\out, ~bus[\reverb],
		).play;
	});
	e.add(\event5 -> {
		~marimba.stop;
		~chords.stop;
	});

	e.add(\oneshot1 -> {
		12.do{
			Synth(
				\bpfsaw,
				[
					\atk, exprand(0.5, 1.5),
					\rel, exprand(2.0, 8.0),
					\c1, exprand(4, 10.0),
					\c2, exprand(2.0, 5).neg,
					\freq, exprand(8, 60),
					\detune, rrand(0.1, 4),
					\cfmin, 30,
					\cfmax, 400,
					\rqmin, 0.02,
					\rqmax, 0.08,
					\amp, exprand(0.5, 0.9),
					\pan, rrand(-0.5, 0.5),
					\out, ~bus[\reverb],
				],
				~mainGrp
			);
		};
	});

	e.add(\oneshot2 -> {
		15.do{
			Synth(
				\bpfbuf,
				[
					\atk, rrand(0.2, 3.0),
					\sus, rrand(0.2, 2.0),
					\rel, exprand(1.0, 6.0),
					\c1, exprand(1, 8),
					\c2, exprand(-8, -1),
					\buf, b[\shakers][13].bufnum,
					\rate, exprand(0.4, 2.0),
					\bpfmix, 0,
					\amp, exprand(0.2, 0.5),
					\spos, rrand(0, 100000),
					\out, ~bus[\reverb],
				],
				~mainGrp
			);
		};
	});

	e.add(\oneshot3 -> {
		// favorite
		15.do{
			Synth(
				\bpfbuf,
				[
					\atk, rrand(0.1, 2.0),
					\sus, rrand(2.5, 6.0),
					\rel, exprand(1.0, 5.0),
					\c1, exprand(1, 8),
					\c2, exprand(-8, -1),
					\buf, b[\shakers][13].bufnum,
					\rate, exprand(0.3, 1.2),
					\freq, (Scale.major.degrees.choose+64 + [-12, 0, 12, 24].choose).midicps,
					\rq, exprand(0.002, 0.02),
					\bpfmix, 1,
					\amp, exprand(0.2, 1.5),
					\spos, rrand(0, 100000),
					\out, ~bus[\reverb],
				],
				~mainGrp
			);
		};
	});

	MIDIdef.cc(\controller,  {
		arg val, num;
		// [val, num].postln;
		case
		{num==32 && val==127} {e[\event1].value;"event1".postln;}
		{num==33 && val==127} {e[\event2].value;"event2".postln;}
		{num==34 && val==127} {e[\event3].value;"event3".postln;}
		{num==35 && val==127} {e[\event4].value;"event4".postln;}
		{num==36 && val==127} {e[\event5].value;"event5".postln;}
		{num==48 && val==127} {e[\oneshot1].value;"oneshot1".postln;}
		{num==49 && val==127} {e[\oneshot2].value;"oneshot2".postln;}
		{num==50 && val==127} {e[\oneshot3].value;"oneshot3".postln;}
		{true} {nil};
	});

	// MIDIdef.noteOn(\noteon, {nil});
};

// 4. register functions width server boot/quit/tree
ServerBoot.add(~makeBuffers);
ServerBoot.add(~makeBusses);
ServerQuit.add(~cleanUp);

// 5. boot server
s.waitForBoot({
	s.sync;

	// 6a. synth defs
	SynthDef(\bpfsaw, {
		arg atk=2, sus=0, rel=3, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, lsf=200, ldb=0, amp=1, out=0;
		var sig, env;
		env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
		sig = Saw.ar(freq * {LFNoise1.kr(0.5, detune).midiratio}!2);
		sig = BPF.ar(
			sig,
			{LFNoise1.kr(
				LFNoise1.kr(4).exprange(cfhzmin, cfhzmax)
			).exprange(cfmin, cfmax)}!2,
			{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2
		);
		sig = BLowShelf.ar(sig, lsf, 0.5, ldb);
		sig =Balance2.ar(sig[0], sig[1], pan);
		sig = sig * env * amp;
		Out.ar(out, sig);
	}).add;

	SynthDef(\bpfbuf, {
		arg atk=0, sus=0, rel=3, c1=1, c2=(-1), buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0, pan=0, amp=1, out=0;
		var sig, env;
		env = EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel], [c1, 0, c2]), doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf), startPos:spos);
		sig = XFade2.ar(sig, BPF.ar(sig, freq, rq, 1/rq.sqrt), bpfmix*2-1);
		sig = sig * env;
		sig = Pan2.ar(sig, pan, amp);
		Out.ar(out, sig);
	}).add;

	SynthDef(\reverb, {
		arg in, predelay=0.1, revtime=1.8, lpf=4500, mix=0.15, amp=1, out=0;
		var dry, wet, temp, sig;
		dry = In.ar(in, 2);
		temp = In.ar(in, 2);
		wet = 0;
		temp= DelayN.ar(temp, 0.2, predelay);
		16.do{
			temp = AllpassN.ar(temp, 0.05, {Rand(0.001, 0.05)}!2, revtime);
			temp = LPF.ar(temp, lpf);
			wet = wet + temp;
		};
		sig = XFade2.ar(dry, wet, mix*2-1, amp);
		Out.ar(out, sig);
	}).add;

	s.sync;

	// 6b. register remaining functions
	ServerTree.add(~makeNodes);
	ServerTree.add(~makeEvents);
	s.freeAll;

	s.sync;

	"done".postln;
});
)

e[\event4].value;
e[\oneshot2].value;
e[\oneshot3].value;
e[\event5].value;

// MIDI

MIDIClient.init;

/*
Audio MIDI Setup
> Window menu
> Show MIDI Studio
> IAC Driver double click
> Device is Online checked
> MIDIClient.init; // reload
*/

MIDIClient.init;
MIDIClient.destinations;

// DAW's MIDI Ch.1 == SuperCollider Ch.0
m = MIDIOut.new(0);

m.latency;
m.latency = 0;

m.noteOn(0, 60, 30);
m.noteOff(0, 60);

(
[35, 49, 56, 63, 66, 73].do{
	arg nn;
	m.noteOn(0, nn, 25);
};
)

(
[35, 49, 56, 63, 66, 73].do{
	arg nn;
	m.noteOff(0, nn);
};
)

(
Routine({
	[35, 49, 56, 63, 66, 73].do{
		arg nn;
		m.noteOn(0, nn, 25);
		0.5.wait;
	};
}).play;
)

(
Routine({
	[35, 49, 56, 63, 66, 73].reverse.do{
		arg nn;
		m.noteOff(0, nn, 25);
		0.5.wait;
	};
}).play;
)

(
Routine({
	[35, 49, 56, 63, 66, 73].do{
		arg nn;
		m.noteOn(0, nn, 25);
		0.1.wait;
		m.noteOff(0, nn, 25);
		0.2.wait;
	};
}).play;
)

(
r = Routine({
	{
		[35, 49, 56, 63, 66, 73].do{
			arg nn;
			m.noteOn(0, nn, 25);
			0.1.wait;
			m.noteOff(0, nn, 25);
			0.2.wait;
		};
	}.loop;
}).play;
)

r.stop;

m.allNotesOff(0); // does not work

m.noteOn(0, rrand(30, 90), 30);

// https://www.midi.org/specifications-old/item/table-3-control-change-messages-data-bytes-2

m.control(0, 7, 127);

CmdPeriod.add({(0..127).do{arg n; m.noteOff(0, n)}});

// DAW: control change assign

m.noteOn(0, rrand(30, 90), 30);
m.control(0, 20, rrand(0, 100));

(
r = Routine({
	{
		[30, 40, 30, 45].do{
			var note;
			note = rrand(28, 40);
			m.noteOn(0, note, 60);
			(30, 40..100).scramble.do{
				arg val;
				m.control(0, 20, val.postln);
				0.15.wait;
			};
			m.noteOff(0, note);
		};
	}.loop;
}).play;
)

r.stop;

s.boot;

(
SynthDef.new(\basic, {
	arg freq=440;
	var sig;
	sig = SinOsc.ar(freq)!2;
	sig = sig * XLine.kr(0.2, 0.01, 0.3, doneAction:2);
	Out.ar(0, sig);
}).add;
)

// favorite

(
p = Pbind(
	\type, \note,
	\instrument, \basic,
	\dur, 0.15,
	\midinote, Pseq([50, 55, 57, 60, 67], inf),
).play;
)

p.stop;

(
~prophet1 = Pbind(
	\type, \midi,
	\midicmd, \noteOn,
	\midiout, m,
	\chan, 0,
	\mininote, Pwrand([62, 74, 86, 98],[0.1, 0.8, 0.08, 0.2], inf),
	\amp, Pexprand(5, 100, inf)/127,
	\sustain, 0.02,
	\dur, 0.15,
).play;
)

~prophet1.stop;

(
~prophet1 = Pbind(
	\type, \midi,
	\midicmd, \noteOn,
	\midiout, m,
	\chan, 0,
	\midinote, Pwrand([62, 74, 86, 98],[0.1, 0.8, 0.08, 0.2], inf),
	/*
	\midinote, Pwrand([62, 74, 86, 98],[0.1, 0.8, 0.08, 0.2], inf)-2,
	\midinote, Pwrand([62, 74, 86, 98],[0.1, 0.8, 0.08, 0.2], inf)+5,
	*/
	\amp, Pexprand(5, 100, inf)/127,
	\sustain, 0.02,
	\dur, 1/16,
	\stretch, 4*60/108
).play(quant:4*60/108);

~prophet5 = Pbind(
	\type, \midi,
	\midicmd, \noteOn,
	\midiout, m,
	\chan, 1,
	\midinote, Pxrand([
		[38, 50, 72, 77, 81],
		[43, 55, 70, 77, 79],
		[46, 58, 69, 74, 77, 84],
	], inf),
	\amp, Pwhite(15, 30, inf),
	\sustain, Pexprand(4, 8, inf),
	\dur, Prand([4, 6, 8], inf),
	\stretch, 4*60/108
).play(quant:4*60/108);
)

(
~prophet1_cc20 = Pbind(
	\type, \midi,
	\midicmd, \control,
	\midiout, m,
	\chan, 0,
	\ctlNum, 20,
	\control, Pexprand(32, 127, inf).round,
	\dur, 1/16,
	\stretch, 4*60/108
).play;
)

~prophet1_cc20.stop;
m.control(0, 20, 80);
~prophet5.stop;
~prophet1.stop;

m.noteOn(0, 58, 60);
m.noteOff(0, 58, 60);

Pdef(\prophet1_cc20).stop;
Pdef(\prophet5).stop;
Pdef(\prophet1).stop;

// arduino
// value = analogRead(0);
// Serial.print(value);
// Serial.print('a');
// detay(1);

SerialPort.devices;
~port = SerialPort.new("/dev/tty.usbmidem1421", 115200);

30.do{~port.read.postln};

91.asAscii;

(
x = [ ];
30.do{x = x.add(~port.read)};
)

x.collect(_.asAscii);

~port.close;

(
x = [ ];
30.do{x = x.add(~port.read)};
x.collect(_.asAscii);
)

x.collect(_.close);

// success

(
~charArray = [ ];
~getValues = Routine.new({
	var ascii;
	{
		ascii = ~port.read.asAscii;
		if(ascii.isDigit, {~charArray = ~charArray.add(ascii)});
		if(ascii == $a, {
			~val = ~charArray.collect(_.digit).converDigits;
			~charArray = [ ];
		});
	}.loop;
}).play;
)

~getValues.stop;

$a.isAlpha;
$4.isAlpha;

[$4, $6, $1];
[$4, $6, $1].collect(_.digit).convertDigits;

(
r = Routine.new({
	{
		rrand(0, 9).postln;
		// 0.25.wait;
	}
}).play;
)

~r.stop;

// read, next

SerialPort.devices;
~port = SerialPort.new("/dev/tty.usbmidem1421", 115200);

(
~charArray = [ ];
~getValues = Routine.new({
	var ascii;
	{
		ascii = ~port.read.asAscii;
		if(ascii.isDigit, {~charArray = ~charArray.add(ascii)});
		if(ascii == $a, {
			~val = ~charArray.collect(_.digit).converDigits;
			~charArray = [ ];
		});
	}.loop;
}).play;
)

// lag

(
SynthDef.new(\saw, {
	arg cutoff=1000;
	var sig;
	sig = Saw.ar([50, 51]);
	sig = RLPF.ar(sig, cutoff.lag(0.02), 0.25, 0.2);
	Out.ar(0, sig);
}).add;
)

~synth = Synth(\saw, [\cutoff, 200]);
~synth.set(\cutoff, 400);
~synth.set(\cutoff, 600);
~synth.set(\cutoff, 800);
~synth.set(\cutoff, 1000);
~synth.set(\cutoff, 2000);
~synth.free;

(
~control = Routine.new({
	{
		~synth.set(\cutoff, ~val.linexp(0, 1023, 80, 4000));
		0.01.wait;
	}.loop;
}).play;
)

~control.stop;
~synth.free;

// microphones and sound in

s.boot;
s.plotTree;
s.meter;

x = {SoundIn.ar(0)}.play;
x.free;

x = {SoundIn.ar([0!2])}.play;
x.free;

(
x = {
	var sig, rmod;
	sig = SoundIn.ar(0!2);
	rmod = sig * SinOsc.ar(700);
	(sig + rmod) * 0.5;
}.play;
)

x.free;

(
x = {
	var sig;
	sig = In.ar(2!2);
	Out.ar(0, sig);
}.play;
)

x.free;

(
x = {
	var sig;
	sig = In.ar(2!2); // regular input is bus 2
	Out.ar(0, sig);
}.play;
)

x.free;

// same

(
x = {
	var sig;
	sig = In.ar(2!2);
}.play;
)

x.free;

// 8 out 8 in

(
s.options.numOutputBusChannels = 8;
s.options.numInputBusChannels = 8;
s.reboot;
)

(
x = {
	var sig;
	sig = In.ar(8!2);
}.play;
)

x.free;

// sound in

ServerOptions.devices;

(
s.options.inDevice = "Scarlett 18i20 USB";
s.options.outDevice = "Scarlett 18i20 USB";
)

(
s.options.device = "Scarlett 18i20 USB";
s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;
s.reboot;
)

s.meter;
s.plotTree;

(
SynthDef.new(\mic, {
	arg in=0, out=0, amp=1;
	var sig;
	sig = SoundIn.ar(in!2) * amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef.new(\mic, {
	arg in=0, out=0, deltime=0.3, mix=(-0.5), amp=1;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = DelayL.ar(sig, 0.5, deltime);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

(
SynthDef.new(\mic, {
	arg in=0, out=0, deltime=0.3, mix=(-0.5), decay=3, amp=1;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = CombL.ar(sig, 0.5, deltime, decay);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

// favorite

(
SynthDef.new(\mic, {
	arg in=0, out=0, mix=(-0.5), decay=3, amp=1;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = CombL.ar(sig, 0.5, SinOsc.kr(0.3).exprange(0.1, 0.4), decay);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

// stereophonic

(
SynthDef.new(\mic, {
	arg in=0, out=0, mix=(-0.5), decay=3, amp=1;
	var sig, delay;
	sig = SoundIn.ar(in!2) * amp;
	delay = CombL.ar(sig, 0.5, SinOsc.kr([0.32, 0.3]).exprange(0.1, 0.4), decay);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

x = Synth(\mic);

x.free;

// bus

(
SynthDef.new(\mic, {
	arg in=0, out=0, amp=1;
	var sig;
	sig = SoundIn.ar(in!2) * amp;
	Out.ar(out, sig);
}).add;

SynthDef.new(\delay, {
	arg in=0, out=0, mix=(-0.5), decay=3, amp=1, delHz=0.25, delMin=0.1, delMax=0.4;
	var sig, delay;
	sig = In.ar(in!2);
	delay = CombL.ar(
		sig,
		0.5,
		SinOsc.kr([delHz, delHz*0.9]).exprange(0.1, 0.4),
		decay
	);
	sig = XFade2.ar(sig, delay, mix);
	Out.ar(out, sig);
}).add;
)

~delBus = Bus.audio(s, 2);

(
~minGrp = Group.new;
~delGrp = Group.after(~minGrp);

~micSynth = Synth(\mic, [\in, 0, \out, ~delBus], ~minGrp);
~delSynth = Synth(\delay, [\in, ~delBus, \out, 0], ~delGrp);
)

// reberb = swirling, pitch-shifting effect, or something?

(
~micGrp = Group.new;
~delGrp = Group.after(~micGrp);

~micSynthDirect = Synth(\mic, [\in, 0, \out, 0], ~micGrp);
~micSynthEffect = Synth(\mic, [\in, 0, \out, ~delBus], ~micGrp);
6.do({
	Synth(\delay, [
		\in, ~delBus,
		\out, 0,
		\mix, 1,
		\amp, 1/6,
		\delHz, exprand(0.02, 0.08),
		\delMin, exprand(0.05, 0.1),
		\delMax, exprand(0.101, 0.2),
		\decay, rrand(3.0, 6.0),
	], ~delGrp);
});
)

ServerOptions.devices;
(
s.options.device = "Scarlett 18i20 USB";
s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;
s.options.memSize = 2.pow(20); // 1 giga byte
s.reboot;
)

s.meter;
s.plotTree;

(
~micGrp = Group.new;
~delGrp = Group.after(~micGrp);

~micSynthDirect = Synth(\mic, [\in, 0, \out, 0], ~micGrp);
~micSynthEffect = Synth(\mic, [\in, 0, \out, ~delBus], ~micGrp);
20.do({
	Synth(\delay, [
		\in, ~delBus,
		\out, 0,
		\mix, 1,
		\amp, 1/20,
		\delHz, exprand(0.02, 0.08),
		\delMin, exprand(0.05, 0.1),
		\delMax, exprand(0.101, 0.2),
		\decay, rrand(3.0, 6.0),
	], ~delGrp);
});
)

s.freeAll;

// FM Synthesis I

s.boot;
s.meter;
s.plotTree;

s.scope;
FreqScope.new;

{SinOsc.ar(500) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(1)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(1, mul:20)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(1, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(2, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(4, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(8, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(MouseX.kr(1, 2000, 1,).poll, mul:400)) * 0.2!2}.play;

{SinOsc.ar(MouseY.kr(200, 5000, 1).poll + SinOsc.ar(MouseX.kr(1, 2000, 1).poll, mul:400)) * 0.2!2}.play;

{SinOsc.ar(MouseY.kr(200, 5000, 1).poll + SinOsc.ar(MouseX.kr(1, 2000, 1).poll, mul:LFNoise0.kr(8).range(20, 10000))) * 0.2!2}.play;

(
SynthDef.new(\fm, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\pan, 0, \amp, 0.3,  \carHz, 200, \modHz, 200]);

(
Synth(\fm, [
	\carHz, exprand(20, 10000),
	\modHz, exprand(20, 10000),
	\modAmp, rrand(0, 10000),
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel, exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
]);
)

(
p = Pbind(
	\instrument, \fm,
	\dur, 1/8,
	\carHz, exprand(20, 10000),
	\modHz, exprand(20, 10000),
	\modAmp, rrand(0, 10000),
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel, exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
).play;
)

(
p = Pbind(
	\instrument, \fm,
	\dur, 1/8,
	\carHz, Pexprand(20, 10000),
	\modHz, Pexprand(20, 10000),
	\modAmp, Pwhite(0, 10000),
	\amp, Pexprand(0.1, 0.5),
	\atk, Pexprand(0.001, 0.05),
	\rel, Pexprand(0.05, 1.2),
	\pan, Pwhite(-1.0, 1.0),
).play;
)

p.stop;

// FM Synthesis II

s.boot;
s.plotTree;
s.meter;
s.scope;
FreqScope.new;

{SinOsc.ar(800 + SinOsc.ar(200, mul:0)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(200, mul:MouseY.kr(0, 400).poll)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(MouseX.kr(200, 1200).poll, mul:MouseY.kr(0, 400).poll)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(200, mul:400)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(300, mul:400)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(MouseX.kr(200, 1200).poll, mul:400)) * 0.2!2}.play;

{SinOsc.ar(800 + SinOsc.ar(350, mul:400)) * 0.2!2}.play;

{SinOsc.ar(MouseX.kr(800, 3000, 1).poll + SinOsc.ar(350, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(MouseX.kr(1, 2000, 1).poll, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(100, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(250, mul:400)) * 0.2!2}.play;

{SinOsc.ar(500 + SinOsc.ar(2000, mul:400)) * 0.2!2}.play;

(
SynthDef.new(\fm, {
	arg freq=500, mRatio=1, cRatio=1, modAmp=200, atk=0.01, rel=3, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(freq * mRatio, mul:modAmp);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm);

Synth(\fm, [\freq, 600]);
Synth(\fm, [\freq, 700]);
Synth(\fm, [\freq, 800]);
Synth(\fm, [\freq, 900]);

Synth(\fm, [\freq, 60.midicps]);
Synth(\fm, [\freq, 62.midicps]);
Synth(\fm, [\freq, 64.midicps]);
Synth(\fm, [\freq, 66.midicps]);

Synth(\fm, [\freq, 66.midicps, \cRatio, 2]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 3]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 4]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 5]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 6]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 7]);

Synth(\fm, [\freq, 66.midicps, \cRatio, 2.1]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 2.2]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 2.7]);

Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 1]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 2]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 3]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 4]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 5]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 6]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 7]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 8]);

Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 3.6]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 3.7]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 3.8]);
Synth(\fm, [\freq, 66.midicps, \cRatio, 1, \mRatio, 3.9]);

Synth(\fm, [\freq, 66.midicps, \cRatio, 5, \mRatio, 2]);

// index = modAmp/modHz
(
SynthDef.new(\fm, {
	arg freq=500, mRatio=1, cRatio=1, index=1, atk=0.01, rel=3, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(freq * mRatio, mul:freq * mRatio * index);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 66.midicps, \index, 0]);
Synth(\fm, [\freq, 66.midicps, \index, 1]);
Synth(\fm, [\freq, 66.midicps, \index, 2]);
Synth(\fm, [\freq, 66.midicps, \index, 3]);
Synth(\fm, [\freq, 66.midicps, \index, 4]);
Synth(\fm, [\freq, 66.midicps, \index, 5]);
Synth(\fm, [\freq, 66.midicps, \index, 10]);
Synth(\fm, [\freq, 66.midicps, \index, 20]);
Synth(\fm, [\freq, 66.midicps, \index, 30]);

(
SynthDef.new(\fm, {
	arg freq=500, mRatio=1, cRatio=1, index=1, iScale=5, amp=0.2, atk=0.01, rel=3, cAtk=4, cRel=(-4), pan=0;
	var car, mod, env, iEnv;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve:[cAtk, cRel]),
		doneAction:2
	);
	mod = SinOsc.ar(freq * mRatio, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 40.midicps]);
Synth(\fm, [\freq, 42.midicps]);
Synth(\fm, [\freq, 45.midicps]);
Synth(\fm, [\freq, 47.midicps]);

Synth(\fm, [\freq, 47.midicps, \rel, 1]);
Synth(\fm, [\freq, 47.midicps, \rel, 1, \iScale, 10]);
Synth(\fm, [\freq, 47.midicps, \rel, 1, \iScale, 10, \cRel, -8]);
Synth(\fm, [\freq, 47.midicps, \rel, 1, \iScale, 10, \cRel, -12]);
Synth(\fm, [\freq, 47.midicps, \rel, 1, \iScale, 10, \cRel, -16]);

// slap bass
Synth(\fm, [\freq, 35.midicps, \rel, 1, \iScale, 10, \cRel, -16]);
Synth(\fm, [\freq, 47.midicps, \rel, 1, \iScale, 10, \cRel, -16]);

Synth(\fm, [\freq, 47.midicps, \rel, 4, \index, 20, \iScale, 0.5]);
Synth(\fm, [\freq, 47.midicps, \rel, 4, \index, 20, \iScale, 0.25]);
Synth(\fm, [\freq, 47.midicps, \rel, 4, \index, 20, \iScale, 0.05]);

// favorite
Synth(\fm, [\freq, 38.midicps, \rel, 4, \index, 20, \iScale, 0.05]);
Synth(\fm, [\freq, 40.midicps, \rel, 4, \index, 20, \iScale, 0.05]);
Synth(\fm, [\freq, 35.midicps, \rel, 4, \index, 20, \iScale, 0.05]);

Synth(\fm, [\freq, 35.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 2]);
Synth(\fm, [\freq, 35.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 5]);
Synth(\fm, [\freq, 35.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 10]);
Synth(\fm, [\freq, 35.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 0.5]);

{SinOsc.ar(500 + SinOsc.ar(4, mul:4*10)) * 0.2!2}.play;
{SinOsc.ar(500, SinOsc.ar(4, mul:10)) * 0.2!2}.play;
{PMOsc.ar(500, 4, 10) * 0.2!2}.play;

// different
{PMOsc.ar(500, 4, 50) * 0.2!2}.play;
{SinOsc.ar(500 + SinOsc.ar(4, mul:4*50)) * 0.2!2}.play;

// PMOsc
// shift + cmd + i
// .mod(2pi)
// Language > Recompile Class Library

(
SynthDef.new(\fm, {
	arg freq=500, mRatio=1, cRatio=1, index=1, iScale=5, amp=0.2, atk=0.01, rel=3, cAtk=4, cRel=(-4), pan=0;
	var car, mod, env, iEnv;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve:[cAtk, cRel]),
		doneAction:2
	);
	mod = SinOsc.ar(freq * mRatio, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

s.boot;
s.plotTree;
s.meter;
s.scope;
FreqScope.new;

// perfectly!
{SinOsc.ar(500 + SinOsc.ar(4, mul:4*50)) * 0.2!2}.play;
{PMOsc.ar(500, 4, 50) * 0.2!2}.play;

(
SynthDef.new(\fm, {
	arg freq=500, mRatio=1, cRatio=1, index=1, iScale=5, amp=0.2, atk=0.01, rel=3, cAtk=4, cRel=(-4), pan=0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve:[cAtk, cRel]),
		doneAction:2
	);
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);
	mod = SinOsc.ar(freq * mRatio + mod2, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp!2;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\rel, 3]);

// Wavetable Synthesis I

(
~sig = Signal.sineFill(1024, [1], [0]);
~sig.plot;
~wt = ~sig.asWavetable;
~wt.plot("wavetable");
)

(
~sig = Signal.sineFill(1024, [1], [0]);
~sig.plot("signal");
~wt = ~sig.asWavetable;
~wt.collect({arg n; n}).plot("wavetable");
)

~sig.size;
~wt.size;

(
~sig = Signal.sineFill(128, [1], [0]);
~sig.plot("signal");
~wt = ~sig.asWavetable;
~wt.collect({arg n; n}).plot("wavetable");
)

s.boot;
s.scope;
FreqScope.new;

b = Buffer.alloc(s, 2048);

(
~sig = Signal.sineFill(1024, [1], [0]);
~wt = ~sig.asWavetable;
b.loadCollection(~wt);
)

// favorite
(
~sig = Signal.sineFill(1024, [1], [0]);
~wt = ~sig.asWavetable;
b.loadCollection(~sig);
)

b.plot;

{Osc.ar(b, MouseX.kr(100, 1000, 1), mul:0.2!2)}.play;

(
~sig = Signal.sineFill(
	1024,
	[1, 1/4, 1/6, 1/2],
	[0]
);
~wt = ~sig.asWavetable;
b.loadCollection(~wt);
)

b.plot;

(
~amps = [1] ++ ({[0, exprand(0.05, 0.5)].choose}!31);
~sig = Signal.sineFill(
	1024,
	~amps,
	0!32
);
~wt = ~sig.asWavetable;
b.loadCollection(~wt);
)

~sig.plot;

{Osc.ar(b, MouseX.kr(100, 1000, 1), mul:0.2!2)}.play;

{SinOsc.ar(MouseX.kr(100, 1000, 1) * (1..32), 0, ~amps*0.1).sum!2}.play;

b.sine3([1], [1], [0], asWavetable:false).plot;
b.sine3([1], [1], [0], asWavetable:true).plot;

b.sine3([1], [1], [0], asWavetable:true);

{Osc.ar(b, MouseX.kr(100, 1000, 1), mul:0.2!2)}.play;

// favorite
b.sine3([1.25], [1], [0], asWavetable:false).plot;
b.sine3([1.25], [1], [0], asWavetable:true);

{Osc.ar(b, MouseX.kr(100, 10000, 1), mul:0.2!2)}.play;

// favorite
b.sine3([1.50], [1,1], [0,0], asWavetable:true);

{Osc.ar(b, MouseX.kr(100, 10000, 1), mul:0.2!2)}.play;

(
b.sine3(
	({exprand(0.75, 40)}!16).sort,
	({exprand(0.05, 0.9)}!16).sort.reverse,
	{rrand(0, 2pi)}!16,
	asWavetable:false
).plot;
)

(
b.sine3(
	({exprand(0.75, 40)}!16).sort,
	({exprand(0.05, 0.9)}!16).sort.reverse,
	{rrand(0, 2pi)}!16,
	asWavetable:true
);
)

{Osc.ar(b, MouseX.kr(100, 10000, 1), mul:0.2!2)}.play;

{Osc.ar(b, MouseX.kr(10, 10000, 1) * [1, 2.01], mul:0.2!2)}.play;

// env

b = Buffer.alloc(s, 2048);

Env([0, 0.6, -0.9, 0.3, 0], [4, 3, 2, 1], \lin).plot;

(
var env, sig, wt;
env = Env([0, 0.6, -0.9, 0.3, 0], [4, 3, 2, 1], \lin);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
)

(
var env, sig, wt;
env = Env([0, 0.6, -0.9, 0.3, 0], [4, 3, 2, 1], \sine);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
)

(
var env, sig, wt;
env = Env([0, 0.6, -0.9, 0.3, 0], [4, 3, 2, 1], {rrand(-20, 20)}!4);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
)

(
var env, sig, wt, numSegs;
numSegs = rrand(4, 20);
env = Env(
	{rrand(-1.0, 1.0)}!(numSegs+1),
	{exprand(1, 20)}!numSegs,
	{rrand(-20, 20)}!numSegs
);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
)

[0,1,2,3,4,5,6,7,8,9] * [1, -1];

({rrand(0.0, 1.0)}!10) * [1, -1];
(({rrand(0.0, 1.0)}!10) * [1, -1]).scramble;


b.plot;

{Osc.ar(b, MouseX.kr(10, 10000, 1) * [1, 2.01], mul:0.2!2)}.play;

// favorite
(
var env, sig, wt, numSegs;
numSegs = rrand(4, 20);
env = Env(
	(({rrand(0.0, 1.0)}!(numSegs+1)) * [1, -1]).scramble,
	{exprand(1, 20)}!numSegs,
	{rrand(-20, 20)}!numSegs
);
sig = env.asSignal(1024);
wt = sig.asWavetable;
b.loadCollection(wt);
)

sig = LeakDC.ar(sig);

{Osc.ar(b, MouseX.kr(10, 10000, 1) * [1, 2.01], mul:0.2!2)}.play;

(
var sig, wt;
sig = Signal.newClear(1024);
sig.waveFill({
	arg x, old, i;
	sin(x);
}, 0, 2pi);
// wt = sig.asWavetable;
// b.loadCollection(wt);
sig.plot;
)

(
var sig, wt;
sig = Signal.newClear(1024);
sig.waveFill({
	arg x, old, i;
	sin(x.pow(1.5));
}, 0, 2pi);
// wt = sig.asWavetable;
// b.loadCollection(wt);
sig.plot;
)

(
var sig, wt;
sig = Signal.newClear(1024);
sig.waveFill({
	arg x, old, i;
	var out;
	out = sin(x.pow(1.5));
	out = out * 1.5;
	out = out.fold(-1, 1);
	out = out.cubed;
}, 0, 2pi);
// wt = sig.asWavetable;
// b.loadCollection(wt);
sig.plot;
)

(
var sig, wt;
sig = Signal.newClear(1024);
sig.waveFill({
	arg x, old, i;
	var out;
	out = sin(x.pow(1.5));
	out = out * 1.5;
	out = out.fold(-1, 1);
	out = out.cubed;
}, 0, 2pi);
wt = sig.asWavetable;
b.loadCollection(wt);
// sig.plot;
)

{Osc.ar(b, MouseX.kr(10, 10000, 1) * [1, 2.01], mul:0.2!2)}.play;

// Signal.sineFill
// b.sine1/2/3
// Env().asSignal
// Signal.waveFill

// example
// http://sccode.org/1-5bF

(
//cleanup
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);
~wt_buf.do(_.free);
t.stop;
ServerTree.remove(~add_reverb);

//initialization
s = Server.local;
t = TempoClock.new(90/60).permanent_(true);
s.newBusAllocators;
~rbus = Bus.audio(s,2);

s.waitForBoot({

	//10 wavetables with increasing complexity
	~wt_sig = 10.collect({
		arg i;

		//random number of envelope segments
		var numSegs = i.linexp(0,9,4,40).round;

		Env(
			//env always begins and ends with zero
			//inner points are random from -1.0 to 1.0
			[0]++({1.0.rand}.dup(numSegs-1) * [1,-1]).scramble++[0],

			//greater segment duration variety in higher-index wavetables
			{exprand(1,i.linexp(0,9,1,50))}.dup(numSegs),

			//low-index wavetables tend to be sinusoidal
			//high index wavetables tend to have sharp angles and corners
			{[\sine,0,exprand(1,20) * [1,-1].choose].wchoose([9-i,3,i].normalizeSum)}.dup(numSegs)
		).asSignal(1024);
	});

	//load into 10 buffers in wavetable format
	~wt_buf = Buffer.allocConsecutive(10, s, 2048, 1, {
		arg buf, index;
		buf.setnMsg(0, ~wt_sig[index].asWavetable);
	});

	SynthDef(\osc, {
		arg buf=0, freq=200, detune=0.2,
		amp=0.2, pan=0, out=0, rout=0, rsend=(-20),
		atk=0.01, sus=1, rel=0.01, c0=1, c1=(-1);
		var sig, env, detuneCtrl;
		env = EnvGen.ar(
			Env([0,1,1,0],[atk,sus,rel],[c0,0,c1]),
			doneAction:2
		);

		//array of eight Oscs with uniquely detune frequencies
		//and unique initial phase offsets
		detuneCtrl = LFNoise1.kr(0.1!8).bipolar(detune).midiratio;
		sig = Osc.ar(buf, freq * detuneCtrl, {Rand(0,2pi)}!8);

		sig = Splay.ar(sig); //spread 8 signals over stereo field
		sig = LeakDC.ar(sig); //remove DC bias
		sig = Balance2.ar(sig[0], sig[1], pan, amp); //L/R balance (pan)
		sig = sig * env;
		Out.ar(out, sig);
		Out.ar(rout, sig * rsend.dbamp); //"post-fader" send to reverb
	}).add;

	SynthDef(\reverb, {
		arg in=0, out=0, dec=4, lpf=1500;
		var sig;
		sig = In.ar(in, 2).sum;
		sig = DelayN.ar(sig, 0.03, 0.03);
		sig = CombN.ar(sig, 0.1, {Rand(0.01,0.099)}!32, dec);
		sig = SplayAz.ar(2, sig);
		sig = LPF.ar(sig, lpf);
		5.do{sig = AllpassN.ar(sig, 0.1, {Rand(0.01,0.099)}!2, 3)};
		sig = LPF.ar(sig, lpf);
		sig = LeakDC.ar(sig);
		Out.ar(out, sig);
	}).add;

	s.sync;

	//instantiate reverb and re-instantiate when cmd-period is pressed
	~add_reverb = {Synth(\reverb, [\in, ~rbus])};
	ServerTree.add(~add_reverb);
	s.freeAll;

	s.sync;

	//background pad using simple wavetables
	Pbindef(\pad,
		\instrument, \osc,
		\dur, Pwrand([1,4,6,9,12],[0.35,0.25,0.2,0.15,0.05],inf),
		\atk, Pexprand(3,6),
		\sus, 0,
		\rel, Pexprand(5,10),
		\c0, Pexprand(1,2),
		\c1, Pexprand(1,2).neg,
		\detune, Pfunc({rrand(0.15,0.4)}!3),
		\buf, Prand(~wt_buf[0..3], inf),
		\scale, Scale.minorPentatonic,
		\degree, Pfunc({
			(-12,-10..12).scramble[0..rrand(1,3)]
		}),
		\amp, Pexprand(0.05,0.07),
		\pan, Pwhite(-0.4,0.4),
		\out, 0,
		\rout, ~rbus,
		\rsend, -10,
	).play;

	//arpeggiated bass pulse using mid/high complexity wavetables
	Pbindef(\pulse,
		\instrument, \osc,
		\dur, Pseq([
			Pstutter(24,Pseq([1/4],1)),
			Prand([1,2,4,6,12],1)
		],inf),
		\atk, 0.001,
		\sus, 0,
		\rel, Pexprand(0.4,1),
		\c0, 0,
		\c1, Pwhite(5,10).neg,
		\detune, 0.3,
		\buf, Prand(~wt_buf[4..9], inf),
		\scale, Scale.minorPentatonic,
		\degree, Pseq([Prand([-15,-10,-5],24), Pseq([\],1)],inf)
		+ Pstutter(25,Pwrand([0,2,-1],[0.78,0.1,0.12],inf)),
		\amp, Pseq([Pgeom(0.45,-1.dbamp,25)],inf),
		\pan, Pwhite(0.01,0.3) * Pseq([1,-1],inf),
		\out, 0,
		\rout, ~rbus,
		\rsend, -10,
	).play(t, quant:1);

	//minimal melody using simple wavetables
	Pbindef(\melody,
		\instrument, \osc,
		\dur, Prand([
			Pseq([Prand([12,16,20]),2,1.5,0.5],1),
			Pseq([Prand([12,16,20]),1.5,1,1.5],1),
		],inf),
		\atk, 0.01,
		\sus, 0.3,
		\rel, 1.5,
		\c0, -2,
		\c1, -2,
		\detune, Pexprand(0.18,0.25),
		\buf, Pwrand([
			Pseq([~wt_buf[0]],4),
			Pseq([~wt_buf[1]],4),
			Pseq([~wt_buf[2]],4),
		],[9,3,1].normalizeSum,inf),
		\midinote, Pxrand([
			Pseq([\,67,60,Prand([58,70,\])],1),
			Pseq([\,67,58,Prand([57,63,\])],1),
			Pseq([\,70,72,Prand([65,79,\])],1)
		],inf),
		\amp, Pseq([0,0.18,0.24,0.28],inf),
		\out, 0,
		\rout, ~rbus,
		\rsend, -6,
	).play(t, quant:1);

	//infinite sequence of various finite rhythmic patterns
	//all very short envelopes
	Pdef(\rhythms,
		Pwrand([
			Pbind(
				\instrument, \osc,
				\dur,Pseq([1/8],4),
				\freq, Pstutter(4, Prand([
					Pexprand(10000,20000,1),
					Pexprand(100,200,1),
					Pexprand(1,2,1)
				],inf)),
				\detune, 100,
				\buf, Pstutter(4, Prand(~wt_buf[5..9],inf)),
				\atk, 0,
				\sus, 0,
				\rel, Pstutter(2, Pexprand(0.01,0.06)),
				\c1, exprand(8,20).neg,
				\amp, Pgeom(0.9, -6.dbamp, 4) * Pstutter(4,Pexprand(0.3,1)),
				\pan, Pwhite(-0.6,0.6),
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-30,-15),
			),

			Pbind(
				\instrument, \osc,
				\dur, Pseq([1/4],2),
				\freq, Pstutter(2, Pexprand(1,200)),
				\detune, Pstutter(2, Pexprand(1,100)),
				\buf, Pstutter(2, Prand(~wt_buf[8..9],inf)),
				\atk, 0,
				\sus, 0,
				\rel, Pstutter(2, Pexprand(0.01,0.2)),
				\c1, -10,
				\amp, Pgeom(0.4, -3.dbamp, 2)  * Pexprand(0.4,1),
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-30,-15),
			),

			Pbind(
				\instrument, \osc,
				\dur, Pseq([1/2,1/4,1/4],1),
				\freq, Pstutter(6, Pexprand(1000,2000)),
				\detune, 100,
				\buf, Pstutter(6, Prand(~wt_buf[2..5],inf)),
				\atk, 0,
				\sus, Pseq([1/3,0,0],1),
				\rel, Pseq([0,Pexprand(0.01,0.3,2)],1),
				\c1, -12,
				\amp, Pseq([0.1,0.5,0.3],1),
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-30,-18),
			),

			Pbind(
				\instrument, \osc,
				\dur, Pseq([1/4,1/2,1/4],1),
				\freq, Pstutter(6, Pexprand(1000,2000)),
				\detune, 100,
				\buf, Pstutter(6, Prand(~wt_buf[2..5],inf)),
				\atk, 0,
				\sus, Pseq([0,1/3,0],1),
				\rel, Pseq([Pexprand(0.01,0.3,1),0,Pexprand(0.01,0.3,1)],1),
				\c1, -12,
				\amp, Pseq([0.5,0.1,0.4],1),
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-30,-18),
			),

			Pbind(
				\instrument, \osc,
				\dur, Pseq([1/6],6),
				\freq, Pstutter(6, Pexprand(1,200)),
				\detune, Pstutter(6, Pexprand(1,100)),
				\buf, Pstutter(6, Prand(~wt_buf[8..9],inf)),
				\atk, 0,
				\sus, 0,
				\rel, Pstutter(6, Pexprand(0.01,0.1)),
				\c1, -10,
				\amp, Pgeom(0.7, -4.dbamp, 6)  * Pexprand(0.4,1),
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-30,-18),
			),

			Pbind(
				\instrument, \osc,
				\dur, Prand([
					Pseq([1/2],2),
					Pseq([1],2),
					Pseq([1,1/2,1/2],1),
					Pseq([2],1),
				],1),
				\freq, Pstutter(2, Pexprand(1,200)),
				\detune, Pstutter(2, Pexprand(1,100)),
				\buf, Pstutter(2, Prand(~wt_buf[8..9],inf)),
				\atk, 0,
				\sus, 0,
				\rel, Pstutter(2, Pexprand(0.01,0.2)),
				\c1, -10,
				\amp, 0.5,
				\out, 0,
				\rout, ~rbus,
				\rsend, Pwhite(-20,-10),
			),

			Pbind(
				\instrument, \osc,
				\dur, Prand([
					Pseq([1/16],16),
					Pseq([1/16],8)
				],1),
				\freq, Pstutter(16,Pexprand(1000,20000,inf)),
				\detune, 0,
				\buf, Pstutter(16, Prand(~wt_buf[0..9],inf)),
				\atk, 0,
				\sus, 0,
				\rel, Pexprand(0.02,0.04),
				\c1, -4,
				\amp, 0.13,
				\pan, Pseq([1,-1],inf),
				\out, 0,
				\rout, ~rbus,
				\rsend, -30,
			)
		],
		[40,18,3,3,15,25,5].normalizeSum, inf)
	).play(t,quant:1);
});
)

//view wavetables
~wt_sig.reverseDo(_.plot);

(
//can stop individually or all at once
Pdef(\rhythms).stop;
Pbindef(\melody).stop;
Pbindef(\pad).stop;
Pbindef(\pulse).stop;
)

// granular sysnthesis I

s.boot;

(
s.meter;
s.plotTree;
s.scope;
)

b = Buffer.read(s, "/Users/igram/Desktop/sample.aif");
b.play;

Signal.hanningWindow(1024).plot;

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar(10),
		0.09,
		b,
		1,
		0.5,
		2,
		0,
		-1,
		512
	);
}.play
)

b = Buffer.read(s, "/Users/igram/Desktop/sample_stereo.aif");
b.play;

b.numChannels;
b.free;

// no sound output
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(10),
		0.09,
		b,
		1,
		0.5,
		2,
		0,
		-1,
		512
	);
}.play
)

b = Buffer.readChannel(s, "/Users/igram/Desktop/sample_stereo.aif", channels:[0]);
b.play;

b.duration/5;

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(MouseX.kr(1,200,1).poll),
		0.09,
		b,
		1,
		0.5,
		2,
		0,
		-1,
		512
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(MouseX.kr(1,200,1).poll),
		0.09,
		b,
		1,
		0.5,
		2,
		0,
		-1,
		512
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(2.2),
		2,
		b,
		1,
		0.5,
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar([60,60.5]),
		0.02,
		b,
		1,
		0.23,
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar([60,60.5]),
		MouseX.kr(0.0002,0.1,1).poll,
		b,
		1,
		0.23,
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar([60,60.5]),
		LFNoise1.kr(0.3!12).exprange(0.002,0.1),
		b,
		1,
		0.23,
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Dust.ar(20!2),
		LFNoise1.kr(0.3!12).exprange(0.002,0.1),
		b,
		1,
		0.23,
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(10),
		0.09,
		b,
		1,
		LFNoise1.ar(500).range(0.1),
		2,
		0,
		-1,
		512
	);
}.play
)

// favorite
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(10),
		0.09,
		b,
		1,
		LFNoise1.ar(0.1).range(0.1),
		2,
		0,
		-1,
		512
	);
}.play
)

// favorite
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(40),
		0.5,
		b,
		1,
		LFNoise1.ar(0.1).range(0.1),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(40),
		0.01,
		b,
		1,
		LFNoise1.ar(500).range(0.1),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

// favorite
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		0.01,
		b,
		1,
		Line.ar(0, 1 ,BufDur.ir(b), doneAction:2),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		0.001,
		b,
		1,
		Line.ar(0, 1, BufDur.ir(b), doneAction:2),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		Line.ar(0, 1, BufDur.ir(b), doneAction:2),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Line.ar(0, BufSamples.ir(b)-1, BufDur.ir(b), doneAction:2)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Line.ar(0, BufSamples.ir(b)-1, BufDur.ir(b), doneAction:2)
			+ LFNoise1.ar(100).bipolar(0.5 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Line.ar(0, BufSamples.ir(b)-1, BufDur.ir(b) * 4, doneAction:2)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

// favorite
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Line.ar(BufSamples.ir(b)-1, 0, BufDur.ir(b) * 4, doneAction:2)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			LFSaw.ar(1/BufDur.ir(b)).range(0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			LFSaw.ar(1/BufDur.ir(b), 1).range(0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			LFSaw.ar(2/BufDur.ir(b), 1).range(0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)


(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Sweep.ar(Impulse.ar(1/BufDur.ir(b)), 1 * BufRateScale.ir(b))
			* SampleRate.ir
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		1,
		(
			Phasor.ar(0, 0.1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		2,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(40),
		1/20,
		b,
		0.5,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.5;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		0.7,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		-4.midiratio,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		30.midiratio,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		0.8,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

FreqScope.new;

// favorite
(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		MouseX.kr(0.5, 2, 1).poll, // 0 is linear, 1 is exponential
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

{LFSaw.ar(10)}.plot(0.2);
{LFSaw.ar(10, 1)}.plot(0.2);

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(100),
		0.2,
		b,
		MouseX.kr(0.5, 2, 1).poll, // 0 is linear, 1 is exponential
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(100),
		0.2,
		b,
		MouseX.kr(0.5, 2, 1).poll, // 0 is linear, 1 is exponential
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.01 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(100),
		0.2,
		b,
		MouseX.kr(0.5, 2, 1).poll, // 0 is linear, 1 is exponential
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(100),
		0.2,
		b,
		MouseX.kr(0.5, 2, 1).poll, // 0 is linear, 1 is exponential
		(
			Phasor.ar(0, MouseY.kr(0.1, 2, 1) * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(400),
		0.1,
		b,
		0.7,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		1,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(400),
		0.1,
		b,
		0.7,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		4,
		0,
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(40),
		0.05,
		b,
		1,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		LFNoise1.kr(100).range(-1, 1),
		-1,
		512
	);
	sig = sig * 0.4;
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(1),
		0.75,
		b,
		1,
		0.45,
		2,
		0,
		~grainEnv,
		512
	);
	sig = sig * 0.4;
}.play
)

(
e = Env.new([0, 1, 0],[0.01, 1],[0, -4]);
~grainEnv = Buffer.sendCollection(s, e.discretize(8192));
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(MouseX.kr(1, 200, 1).poll),
		0.3,
		b,
		1,
		0.2,
		2,
		0,
		-1,
		512
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(0.5),
		2,
		b,
		1,
		0.85,
		2,
		0,
		-1,
		512
	);
}.play
)

b.duration * 0.85;

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(0.8),
		2.2,
		b,
		1,
		0.2,
		2,
		0,
		-1,
		512
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Impulse.ar(0.8),
		2.2,
		b,
		-1,
		0.2,
		2,
		0,
		-1,
		512
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(40),
		0.4,
		b,
		1,
		0.2,
		2,
		0,
		-1,
		12 // Too many grains!
	);
}.play
)

(
{
	var sig;
	sig = GrainBuf.ar(
		2,
		Dust.ar(40),
		0.4,
		b,
		1,
		0.2,
		2,
		0,
		-1,
		512
	);
}.play
)

// synth def

(
SynthDef.new(\gs, {
	arg sync=1, dens=20, dur=0.1, durRand=1, buf=0, rate=1, pos=0, posSpeed=1, posRand=0, grainEnv=(-1), pan=0, panHz=0.1, panRand=0, atk=1, sus=2, rel=1, c0=1, c1=(-1), amp=1, out=0;

	var sig, env, densCtrl, durCtrl, posCtrl, panCtrl;

	env = EnvGen.ar(Env.new([0, 1, 1, 0],[atk, sus, rel],[c0, c1]), doneAction:2);

	densCtrl = Select.ar(sync, [Dust.ar(dens), Impulse.ar(dens)]);

	durCtrl = dur * LFNoise1.kr(100).exprange(1/durRand, durRand);

	posCtrl = Phasor.ar(0, posSpeed * BufRateScale.ir(buf), 0, BufSamples.ir(buf)-1);
	posCtrl = posCtrl + LFNoise1.kr(100).bipolar(posRand * SampleRate.ir);
	posCtrl = posCtrl / BufSamples.ir(buf);
	posCtrl = posCtrl + pos;

	panCtrl = pan + LFNoise1.kr(panHz).bipolar(panRand);

	sig = GrainBuf.ar(
		2,
		densCtrl,
		durCtrl,
		buf,
		rate,
		posCtrl,
		2,
		panCtrl,
		grainEnv
	);

	sig = sig * env * amp;

	Out.ar(out, sig);
}).add;
)

(
Synth.new(\gs, [
	\buf, b,
	\sync, 1,
	\dens, 100,
	\dur, 0.3,
	\posSpeed, 0,
	\pos, 0.2,
	\amp, 0.3
]);
)

(
Synth.new(\gs, [
	\buf, b,
	\sync, 1,
	\dens, 47.midicps, // 52 -> 50 -> 47
	\dur, 0.3,
	\posSpeed, 0,
	\pos, 0.2,
	\amp, 0.3
]);
)

(
Synth.new(\gs, [
	\buf, b,
	\sync, 0,
	\dens, 47.midicps, // 52 -> 50 -> 47
	\dur, 0.3,
	\posSpeed, 0,
	\pos, 0.2,
	\amp, 0.3
]);
)

(
Synth.new(\gs, [
	\buf, b,
	\sync, 0,
	\dens, 400,
	\dur, 0.2,
	\posSpeed, 0.25,
	\pos, 0,
	\amp, 0.3
]);
)

(
Synth.new(\gs, [
	\buf, b,
	\sync, 0,
	\dens, 400,
	\dur, 0.2,
	\posSpeed, 0.25,
	\pos, 0,
	\rate, -7.midiratio,
	\amp, 0.3,
	\sus, 5,
]);
)

// routine
(
~r0 = Routine.new({
	loop{
		(1..8).choose.do({
			var rate = [0, 2, 3, 7, 9, 10].choose + 70;
			rate = rate.midicps * [2, 1, 0.5, 0.25].choose;
			4.do({
				Synth.new(\gs, [
					\buf, b,
					\sync, 1,
					\dens, rate * rrand(-0.15, 0.15).midiratio,
					\dur, 0.02,
					\pos, [0.3, 0.4, 0.5, 0.6].choose,
					\posSpeed, 0,
					\amp, exprand(0.05, 0.15),
					\atk, exprand(1, 4),
					\sus, 0,
					\rel, exprand(3, 6),
					\rel, exprand(3, 6),
					\pan, rrand(-0.8, 0.8),
				]);
			});
			exprand(0.1, 8).wait;
		});
	};
}).play;

~r1 = Routine.new({
	loop{
		(2..5).do({
			Synth.new(\gs, [
				\buf, b,
				\sync, 1,
				\dens, [0.25, 0.5, 1, 2, 4, 8].choose,
				\dur, exprand(0.001, 0.025),
				\pos, [0.1, 0.206, 0.398, 0.877].choose,
				\posSpeed, 0,
				\rate, [-2, 0, 12].choose.midiratio,
				\pamRand, 0.8,
				\atk, 3,
				\sus, 1,
				\rel, 3,
				\amp, exprand(0.25, 0.6),
			]);
		});
		exprand(0.5, 4).round(0.5).wait;
	};
}).play;

~r2 = Routine.new({
	loop{
		Synth.new(\gs, [
			\buf, b,
			\sync, 0,
			\dens, exprand(0.2, 1),
			\dur, exprand(0.5, 2),
			\pos, rrand(0.0, 1.0),
			\posSpeed, rrand(-0.9, 0.9),
			\rate, rrand(-10.0, -2.0).midiratio.neg,
			\panHz, 0.1,
			\panRand, 0.5,
			\amp, exprand(0.15, 0.4),
			\atk, 4,
			\sus, 0,
			\rel, 4,
		]);
		exprand(4, 15).wait;
	};
}).play;
)

(
~r0.stop;
~r1.stop;
~r2.stop;
)

// writing class and methods

144.tempodur;  // not defined
60.midicps;
0.5.ampdb;

(144/60).reciprocal;
60/144;

TempoClock.new(144/60).beatDur;

(
~tempodur = {
	arg bpm;
	60/bpm;
};
)

~tempodur.(144);

Platform.userExtensionDir;
Platform.systemExtensionDir;

a = Array.series(8,1,3);
a.series; // not defined
a = a.reverse;
Array.reverse;

s.boot; // and recompile class library

144.tempodur;
108.tempodur;
112.5.tempodur; // not working

5.isPrime;
5.1.isPrime;

Object.browse;

0.8.durtempo;
75.tempodur;

(
var env, numSegs=16;
env = Env.new(
	{rrand(-1.0, 1.0)}!(numSegs+1),
	{exprand(1, 10)}!numSegs,
	{rrand(-4.0, 4.0)}!numSegs
);
env.plot;
)

Env.rand(16);
Env.browse;

3.squared;
3.pow(4);

Env.rand(20).duration;

Env.rand(5, 2, true).plot;
Env.rand(7, 3, false).plot;

s.boot;

{SinOsc.ar(60.midicps) * EnvGen.ar(Env.perc(0.001, 0.2), doneAction:2) * 0.5!2}.play;

60.play;
67.play;
72.play;

Window.new;
Window.closeAll;

(
SynthDef.new(\reverb, {
	arg in=0, dec=3.5, mix=0.08, lpf1=2000, lpf2=6000, predel=0.025, out=0;
	var dry, wet, sig;
	dry = In.ar(in, 2);
	wet = In.ar(in, 2);
	wet = DelayN.ar(wet, 0.5, predel.clip(0.0001, 0.5));
	wet = 16.collect{
		var temp;
		temp = CombL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02, 0.04)}!2).exprange(0.02, 0.099),
			dec
		);
		temp = LPF.ar(temp, lpf1);
	}.sum * 0.25;
	8.do{
		wet = AllpassL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02, 0.04)}!2).exprange(0.02, 0.099),
			dec
		);
	};
	wet = LeakDC.ar(wet);
	wet = LPF.ar(wet, lpf2, 0.5);
	sig = dry.blend(wet, mix);
	Out.ar(out, sig);
}).add;
)

s.boot;
b = Bus.audio(s, 2);
r = Synth.new(\reverb, [\in, b]);
86.play;
86.play(b);

s.boot;

72.play;

(
SynthDef.new(\reverb, {
	arg in=0, dec=3.5, mix=0.08, lpf1=2000, lpf2=6000, predel=0.025, out=0;
	var sig;
	sig = In.ar(in, 2);
	sig = VerbEF.ar(sig, dec, mix, lpf1, lpf2, predel);
	Out.ar(out, sig);
}).add;
)

b = Bus.audio(s, 2);
r = Synth.new(\reverb, [\in, b]);

r.set(\mix, 0.6);
r.set(\dec, 10);
r.set(\lpf2, 400);
86.play(b);

(
var win;
win = Window.new("", Window.screenBounds, false, false);
win.view.background_(Color.black);
win.view.keyDownAction_({
	arg view, cjar, mod, uni;
	if(uni == 27, {win.close});
});
win.front;
)

Window.blackout;
