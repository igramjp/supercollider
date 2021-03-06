/**
 * SuperCollider #001
 */
"Hello, World!"

2 + 3

Server.default = s = Server.internal.boot

play({SinOsc.ar(LFNoise0.kr(1, mul: 600, add: 0), 0.3)})

// SinOsc Examples
// create an audio-rate sine wave at 200 Hz,
// starting with phase 0 and an amplitude of 0.5
{ SinOsc.ar([200, 800], 0, 0.2) }.plot;
{ SinOsc.ar([125, 125], 2pi, 0.5, 0) }.scope;
{ SinOsc.ar([125, 125], 2pi, 0.5, -0.5) }.scope;

// modulate the frequency with an exponential ramp
{ SinOsc.ar(XLine.kr(2000, 200), 0, 0.5) }.play;

// more complex frequency modulation
{ SinOsc.ar(SinOsc.ar(XLine.kr(1, 1000, 9), 0, 200, 800), 0, 0.25) }.play;

// phase modulation (see also PMOsc)
{ SinOsc.ar(800, SinOsc.ar(XLine.kr(1, 1000, 9), 0, 2pi), 0.25) }.play;



/**
 * SuperCollider #002
 */
play({RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar(1/[3, 4], 1500, 1600), 0.02)});



/**
 * SuperCollider #003
 */
// LFNoise0 Examples
{ LFNoise0.ar(1000, 0.25) }.play;

// modulate frequency
{ LFNoise0.ar(XLine.kr(1000, 10000, 10), 0.25) }.play;

// as frequency modulator
(
{ SinOsc.ar(
        LFNoise0.ar(4, 400, 450),
        0, 0.2
    )
}.play;
)

// freq is the rate of starting points
{ var freq = 1000; [LFNoise0.ar(freq), Impulse.ar(freq)] }.plot

// LFNoise1 Examples
{ LFNoise1.ar(1000, 0.25) }.play;

// modulate frequency
{ LFNoise1.ar(XLine.kr(1000, 10000, 10), 0.25) }.play;

// as frequency modulator
(
{ SinOsc.ar(
        LFNoise1.ar(4, 400, 450),
        0, 0.2
    )
}.play;
)

// freq is the rate of starting points
{ var freq = 1000; [LFNoise1.ar(freq), Impulse.ar(freq)] }.plot

// XLine Examples
play({ SinOsc.ar(XLine.kr(200,17000,10),0,0.1) });

// RLPF Examples
{ RLPF.ar(Saw.ar(200, 0.1), SinOsc.ar(XLine.kr(0.7, 300, 20), 0, 3600, 4000), 0.2) }.play;

(
{ var ctl = RLPF.ar(Saw.ar(5, 0.1), 25, 0.03);
    SinOsc.ar(ctl * 200 + 400) * 0.1;
}.play;
)

(
{ var ctl = RLPF.ar(Saw.ar(5,0.1), MouseX.kr(2, 200, 1), MouseY.kr(0.01, 1, 1));
    SinOsc.ar(ctl * 200 + 400) * 0.1;
}.play;
)

// Dust Examples
(
SynthDef("help-Dust", { arg out=0;
    Out.ar(out,
        Dust.ar(200, 0.5)
    )
}).play;
)

(
SynthDef("help-Dust", { arg out=0;
    Out.ar(out,
        Dust.ar(XLine.kr(20000, 2, 10), 0.5)
    )
}).play;
)

// Saw Examples
// modulating the frequency
{ Saw.ar(XLine.kr(40,4000,6),0.2) }.scope;

// two band limited sawtooth waves through a resonant low pass filter
{ RLPF.ar(Saw.ar([100,250],0.1), XLine.kr(8000,400,5), 0.05) }.play;

// MouseX Examples
{ SinOsc.ar(MouseX.kr(40, 10000, 1), 0, 0.1) }.play;
{ SinOsc.ar(MouseX.kr(500, 10000, 1).poll, 0, 0.1) }.play;

// MouseY Examples
{ SinOsc.ar(MouseY.kr(40, 10000, 1), 0, 0.1) }.play;

// Figure 1.1
play({
	var sines = 5, speed = 6;
	Mix.fill(sines,
		{arg x;
			Pan2.ar(
				SinOsc.ar(x+1*100,
					mul: max(0,
						LFNoise1.kr(speed) +
						Line.kr(1, -1, 30)
					)
                ),
rand2(1.0))})/sines})



/**
 * SuperCollider #004
 */
{SinOsc.ar(4+1*100, mul: max(0, LFNoise1.kr(6) + Line.kr(1, -1, 30)))}.scope
2+1*100.postln
rand2(1.0).postln
rand2(1).postln
rand(1.0).postln
rand(1).postln
exprand(1.0, 10.0).postln

// Pan2 Examples
// hear the difference, LinPan having a slight drop in the middle...
{ LinPan2.ar(SinOsc.ar(440), Line.kr(-1, 1, 5)) }.play

// ... whereas Pan2 is more smooth
{ Pan2.ar(SinOsc.ar(440), Line.kr(-1, 1, 5)) }.play

// other examples
{ Pan2.ar(PinkNoise.ar(0.4), FSinOsc.kr(2), 0.3) }.play;

// LinPan2 Examples
// hear the difference, LinPan having a slight drop in the middle (yeah, it's subtle)...
{ LinPan2.ar(SinOsc.ar(440), Line.kr(-1, 1, 5)) }.play;

// ... whereas Pan2 is more smooth
{ Pan2.ar(SinOsc.ar(440), Line.kr(-1, 1, 5)) }.play;

// other examples
{ LinPan2.ar(PinkNoise.ar(0.4), FSinOsc.kr(2)) }.play;

{ LinPan2.ar(FSinOsc.ar(800, 0, 0.1), FSinOsc.kr(3)) }.play;

// PinkNoise Examples
(
SynthDef("help-PinkNoise", { arg out=0;
    Out.ar(out,
        PinkNoise.ar(0.4)
    )
}).play;
)

// FSinOsc Examples
{ FSinOsc.ar(800) * 0.2 }.play;
{ SinOsc.ar(800) * 0.2 }.play;

{ FSinOsc.ar(XLine.kr(200, 4000, 1)) * 0.2 }.play;

// loses amplitude towards the end
{ FSinOsc.ar(FSinOsc.ar(XLine.kr(4, 401, 8), 0.0, 200, 800)) * 0.2 }.play;



/**
 * SuperCollider #005
 */
rand(100)    // between 0 and 99 (Integer)
rand(100.0)  // between 0.0 and 99.999999.... (Float)
rand2(100)   // between -100 and 100 (Integer)
rand2(100.0) // between -100.0 and 100.0 (Float)
exprand(1.0, 100.0)  // exponential range

thisThread.randSeed = 666; {rand(10.0)} ! 10; // equivalent to dup(n)
￼

// randSeed = 666 (Try a less satanic number (66, 3, 7, 9, 12, 40, etc.)
-> [ 6.9041073322296, 0.41814565658569, 7.9393517971039, 7.0876693725586, 5.9101986885071, 8.4334707260132, 2.2805869579315, 6.4608705043793, 8.627153635025, 1.8073177337646 ]
-> [ 6.9041073322296, 0.41814565658569, 7.9393517971039, 7.0876693725586, 5.9101986885071, 8.4334707260132, 2.2805869579315, 6.4608705043793, 8.627153635025, 1.8073177337646 ]

dup("echo", 20)
"echo" ! 20

round([3.141, 5.9265, 358.98], 0.01)
sort([23, 54, 678, 1, 21, 91, 34, 78])
round(dup({exprand(1, 10)}, 100), 0.1)
sort(round(dup({exprand(1, 10)}, 100), 0.01))
sort(round(dup({exprand(1, 10)}, 100), 0.01)).reverse

(
scope(
	{
		CombN.ar(
			SinOsc.ar(
				midicps(
					LFNoise1.ar(3, 24,
						LFSaw.ar([5, 5.123], 0, 3, 80)
					)
				),
				0, 0.4),
			1, 0.3, 2)
	}
)
)

50.midicps
midicps(50)

444.cpsmidi
cpsmidi(444)

// CombN(Comb delay line with no interpolation) Examples
// ex. CombL(linear interpolation), CombC(cubic interpolation)
// These examples compare the variants, so that you can hear the difference in interpolation

// Comb used as a resonator. The resonant fundamental is equal to
// reciprocal of the delay time.
{ CombN.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), 0.2) }.plot;

{ CombL.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), 0.2) }.scope;

{ CombC.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), 0.2) }.scope;

// with negative feedback:
{ CombN.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), -0.2) }.scope;

{ CombL.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), -0.2) }.scope;

{ CombC.ar(WhiteNoise.ar(0.01).dup, 0.01, XLine.kr(0.0001, 0.01, 20), -0.2) }.scope;

// used as an echo.
{ CombN.ar(Decay.ar(Dust.ar(1,0.5).dup, 0.2, WhiteNoise.ar), 0.2, 0.2, 3) }.scope;

// Whitenoise Examples
(
SynthDef("help-WhiteNoise", { arg out=0;
    Out.ar(out,
        WhiteNoise.ar(0.25).dup
    )
}).play;
)

// Decay Examples
plot({ Decay.ar(Impulse.ar(1), 0.01) });

// used as an envelope
play({ Decay.ar(Impulse.ar(XLine.kr(1,50,20), 0.25).dup, 0.2, PinkNoise.ar, 0) });

// Impulse Examples
{ Impulse.ar(800.dup, 0.0, 0.5, 0) }.play

{ Impulse.ar(XLine.kr(800,100,5).dup, 0.0,  0.5, 0) }.play

// modulate phase:
￼
{ Impulse.ar(4.dup, [0, MouseX.kr(0, 1)], 0.2) }.play;

// an Impulse with frequency 0 returns a single impulse:
￼
SynthDef(\imp, { OffsetOut.ar(0, Impulse.ar(0)); FreeSelf.kr(Impulse.kr(0)); }).add;
fork { (1 / (1..60).scramble).do { |dt| Synth.grain(\imp);  dt.wait } };

// LFSaw Examples
{ LFSaw.ar(500, 1, 0.1) }.play

// used as both Oscillator and LFO:
{ LFSaw.ar(LFSaw.kr(4, 0, 200, 400), 0, 0.1) }.play

// Display the special behaviour of the initial phase parameter:
// three channels, three phases
{ LFSaw.ar(20, [0, 1, 2]) }.plot(0.1)



/**
 * SuperCollider #006
 */
{ SinOsc.ar(440, 0, 0.5) }.plot
{ FSinOsc.ar(440, 0, 0.5) }.plot
{ Saw.ar(440, 1, 0.5) }.play
{ LFSaw.ar(440, 1, 0.5) }.play

5 + 10 * 4
5 + 10.squared
[0, 11, 10, 1, 9, 8, 2, 3, 7, 4, 6, 5].reverse
12 - [0, 11, 10, 1, 9, 8, 2, 3, 7, 4, 6, 5]
12 - [0, 11, 10, 1, 9, 8, 2, 3, 7, 4, 6, 5].reverse
[0, 2, 4, 5, 6, 7, 9, 11].scramble
[60, 62, 64, 67, 69].mirror
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].rotate
[60, 62, 64, 65, 67, 69, 71].midicps.round(0.1)
[1, 0.75, 0.5, 0.25, 0.125].choose
0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6)
dup(rand(1000.0), 5)
dup({rand(1000.0)}, 5)
{LFNoise0.ar}.play
{LFNoise0.ar(10000)}.plot
{LFNoise0.ar(10000)}.scope
{100.rand}.dup(10)
{100.rand} ! 10
{100.rand}.dup(10).postln.plot
{100.rand}.dup(100).sort.plot
{Blip.ar(25, LFNoise0.kr(5, 12, 14), 0.3)}.play
{Blip.ar(25, LFNoise0.kr([5, 10], 12, 14), 0.3)}.play
{Blip.ar(25, LFNoise0.kr([5, 10, 2, 25], 12, 14), 0.3)}.play
{Blip.ar(25, LFNoise0.kr([5, 4, 7, 9, 5, 1, 9, 2], 12, 14), 0.3)}.play

// Blip Examples
// modulate frequency
{ Blip.ar(XLine.kr(20000,200,6).dup,100,0.2) }.play;

// modulate numharmonics
{ Blip.ar(200,Line.kr(1,100,20).dup,0.2) }.play;

{PMOsc.ar(440, 550, 7, 0, 0.1).dup}.play
{PMOsc.ar(440, 550, MouseY.kr(1, 550), MouseX.kr(1, 15), 0.1).dup}.play
{PMOsc.ar(100, 500, 10, 0, 0.1).dup}.play
{PMOsc.ar(carfreq: 100, modfreq: 500, pmindex: 10, mul: 0.1).dup}.play
{PMOsc.ar(carfreq: 100, mul: 0.1, pmindex: 10, modfreq: 500).dup}.play
{SinOsc.ar(mul: MouseX.kr(0, 1.0))}.scope

// PMOsc Examples
play({ PMOsc.ar(Line.kr(600, 900, 5).dup, 600, 3, 0, 0.1) }); // modulate carfreq

play({ PMOsc.ar(300, Line.kr(600, 900, 5).dup, 3, 0, 0.1) }); // modulate modfreq

play({ PMOsc.ar(300, 550, Line.ar(0,20,8).dup, 0, 0.1) }); // modulate index

(
e = Env.linen(2, 5, 2);
Routine.run({
    loop({
        play({
            LinPan2.ar(EnvGen.ar(e) *
                PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1), 1.0.rand2)});
        2.wait;
    })
}))

// Figure1.4
(
{
	Blip.ar(
		TRand.kr(
			100, 1000,
			Impulse.kr(Line.kr(1, 20, 60))), // Trigger
		TRand.kr(
		    1, 10,
			Impulse.kr(Line.kr(1, 20, 60))), // Trigger
		Linen.kr(
			Impulse.kr(Line.kr(1, 20, 60)), // Trigger
		    0, // attack
			0.5, // sustain level
			1/Line.kr(1, 20, 60))
	).dup
}.play
)



/**
 * SuperCollider #007
 */
Env.linen(0.1, 0.2, 0.1, 0.6).test.plot;
Env.linen(1, 2, 3, 0.6).test.plot;
Env.linen(1, 2, 3, 0.6, \sine).test.plot;
Env.linen(1, 2, 3, 0.6, \welch).test.plot;
Env.linen(1, 2, 3, 0.6, \lin).test.plot;
Env.linen(1, 2, 3, 0.6, \exp).test.plot;
Env.linen(1, 2, 3, 0.6, -3).test.plot;
Env.linen(1, 2, 3, 0.6, 3).test.plot;
Env.linen(1, 2, 3, 0.6, [[\sine, \welch, \lin, \exp]]).plot;
Env.linen(2, 5, 2, 0.6).test.plot;

// Routine .wait
c = Condition(false); fork { 0.5.wait; "started ...".postln; c.wait;  "... and finished.".postln };
c.test = true;
c.signal;

// loop
t = Task({ { "I'm loopy".postln; 1.wait;}.loop });
t.start;
t.stop;

e = Env.linen(2, 5, 2);
play({
    LinPan2.ar(EnvGen.ar(e) *
        PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1), 1.0.rand2)})

{PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1)}.play

{EnvGen.ar(e) * PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1)}.play

loop{(play({LinPan2.ar(EnvGen.ar(e) * PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1), 1.0.rand2)}); 2.wait;)}

(Routine.run({loop{(play({LinPan2.ar(EnvGen.ar(e) * PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1), 1.0.rand2)}); 2.wait;)}}))

(
{
	r = MouseX.kr(1/3, 10);
	SinOsc.ar(mul: Linen.kr(Impulse.kr(r), 0, 1, 1/r)).dup
}.play
)

// Figure 1.5
(
// run this first
p = { // make p equal to this function
	r = Line.kr(1, 20, 60); // rate
	// r = LFTri.kr(1/10) * 3 + 7;
	t = Impulse.kr(r); // trigger
	// t = Dust.kr(r);
	e = Linen.kr(t, 0, 0.5, 1/r); // envelope uses r and t
	// f = TRand.kr(1, 10, t); // triggered random also uses t
	f = e + 1 * 4;
	Blip.ar(f * 100, f, e).dup // f, and e uses in Blip
}.scope
)

p.free



/**
 * SuperCollider #008
 */
{ SinOsc.ar(200, 0, 0.2).dup }.scope;
{ FSinOsc.ar(200, 0, 0.2).dup }.scope;

// TRand Examples
(
{
    var trig = Dust.kr(10);
    SinOsc.ar(
            TRand.kr(300, 3000, trig)
        ).dup * 0.1
}.scope;
)

(
{
    var trig = Dust.ar(MouseX.kr(1, 8000, 1).poll);
    SinOsc.ar(
            TRand.ar(300, 3000, trig)
        ).dup * 0.1
}.scope;
)

// Line Examples
// XLine is usually better than Line for frequency
play({ SinOsc.ar(Line.kr(200,17000,10).dup,0,0.05)});


// Linen Examples
// trigged
(
SynthDef("help-Linen",{ arg out = 0;
    Out.ar(out,
        Linen.kr(Impulse.kr(2).dup, 0.01, 0.6, 1.0, doneAction: Done.none).scope * SinOsc.ar(440, 0, 0.1)
    )
}).play;
)

// play once and end the synth
(
SynthDef("help-Linen",{ arg out=0;
    Out.ar(out,
        Linen.kr(Impulse.kr(0).dup, 0.01, 0.6, 1.0, doneAction: Done.freeSelf) * SinOsc.ar(440, 0, 0.1)
    )
}).play;
)

// play once and sustain
(
x = SynthDef("help-Linen",{ arg gate = 1, out = 0; // use gate arg for release
    Out.ar(out,
        Linen.kr(gate.dup, 0.01, 0.6, 1.0, doneAction: Done.freeSelf) * SinOsc.ar(440, 0, 0.1)
    )
}).play;
)
x.release(4); // change the release time

// longer gate, can pass in duration
(
SynthDef("help-Linen",{ arg out = 0, dur = 0.1, gate = 0;
    // gate = Trig.kr(1.0, dur);
    Out.ar(out,
        Linen.kr(gate.dup, 0.01, 0.6, 1.0, doneAction: Done.freeSelf) * SinOsc.ar(440, 0, 0.1)
    )
}).play(nil, [\out, 0, \dur, 2.0, \gate, 1]);
)

// used below in a Routine varying the releaseTime
(
SynthDef("help-Linen",{ arg out=0,freq=440,attackTime=0.01,susLevel=0.6,releaseTime=0.1;
    Out.ar(out,
        Linen.kr(Impulse.kr(0).dup, attackTime, susLevel, releaseTime, doneAction: Done.freeSelf)
            * SinOsc.ar(freq, 0, 0.1)
    )
}).add;
)

(
// debussey sleeping through math class
x = Pbrown(0.01, 2.0, 0.2, inf).asStream;
Routine({
    loop({
        Synth.grain("help-Linen",[\freq, (rrand(20, 50) * 2).midicps, \releaseTime, x.next]);
        0.25.wait;
    })
}).play(TempoClock.default)
)

(
SynthDef("help-Linen",{ arg out = 0;
    Out.ar(out,

        Linen.kr(Impulse.kr(2).dup,
            0.01,
            // sustain level is polled at time of trigger
            FSinOsc.kr(0.1).range(0, 1),
            1.0,
            doneAction: Done.none)

            * SinOsc.ar(440, 0, 0.1)
    )
}).play;
)


// Pbrown Examples
(
var a;
a = Pbrown(0.0, 1.0, 0.1, inf);
c = a.asStream.nextN(500);
w = Window.new("Pbrown", Rect(10, 10, 540, 800));
// plot the values
c.plot(bounds: Rect(10, 10, 520, 380), discrete: true, parent: w);
// a histogram of the values
c.histo(500).plot(bounds: Rect(10, 410, 520, 380), parent: w);
)

(
var a;
a = Pbrown(0.0, 1.0, 0.2, inf);
a.asStream.nextN(1000).plot;
)

// sound example
(
SynthDef(\help_sinegrain,
    { arg out=0, freq=440, sustain=0.05;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction: Done.freeSelf);
        Out.ar(out, SinOsc.ar(freq, 0, env).dup)
    }).add;
)

(
var a;
a = Pbrown(0.0, 1.0, 0.1, inf).asStream;
{
    loop {
        Synth(\help_sinegrain, [\freq, a.next * 600 + 300]);
        0.02.wait;
    }
}.fork;
)

// parallel browninan motions
(
var a, x, f;
a = Pbrown(0.0, 1.0, 0.1, inf);

f = { |pattern, dt=0.02, min=300, max=900|
    {
        var x = pattern.asStream;
        loop {
            Synth.grain(\help_sinegrain, [\freq, x.next.linexp(0, 1, min, max), \sustain, dt]);
            dt.wait;
        }
    }.fork;
}.flop;

// 3 parallel motions
f.(a, [0.02, 0.08, 0.16]);
)

// Figure 1.6
(
{ // carrier and modulator not linked
	r = Impulse.kr(10);
	c = TRand.kr(100, 5000, r);
	m = TRand.kr(100, 5000, r);
	PMOsc.ar(c, m, 12).dup * 0.2
}.scope
)

(
{
	var rate = 4, carrier, modRatio; // declare variables
	carrier = LFNoise0.kr(rate) * 500 + 700;
	modRatio = MouseX.kr(1, 2.0);
	// modulator expressed as ratio, therefore timbre
	PMOsc.ar(carrier.poll, carrier * modRatio, 12).dup * 0.2
}.scope
)



/**
 * SuperCollider #009
 */
// Trig Examples
{ Trig.ar(Dust.ar(1), 0.2) * FSinOsc.ar(800, 0.5) }.play
{ Trig.ar(Dust.ar(4), 0.1) }.play

// Synth.grain
// A convenience method which will create a synth node with an node ID of -1. Such a node cannot be messaged after creation. As such this method does not create an object, and returns nil. For details of its arguments see new above.
// Returns: nil

// asStream Examples
(
{
e = Env.sine.asStream;
5.do({
    e.next.postln;
    0.25.wait;
})}.fork
)

// fork Examples
// an array of routine functions:
(
a = [
    { 1.wait; \done_one.postln },
    { 0.5.wait; \done_two.postln },
    { 0.2.wait; \done_three.postln }
];
)
// join after 0
(
Routine {
    "join = 0.".postcln;
    a.fork(0); \doneAll.postln;
}.play;
)

// join after 1
(
Routine {
    "join = 1.".postcln;
    a.fork(1); \doneAll.postln;
}.play;
)
// join after all
(
Routine {
    "join = a.size (default).".postcln;
    a.fork; \doneAll.postln;
}.play;
)

// flop Examples
[[1, 2, 3], [4, 5, 6]].flop;
[[1, 2, 3], [4, 5, 6], [7, 8]].flop; // shorter array wraps
[].flop; // result is always 2-d.

// range
// Returns maxval - minval.
(
var spec;
spec = [ 100, 18000, \exp].asSpec;
{
    var freq,osc;
    osc = SinOsc.kr(0.1).range(0,1);
	osc.poll;
    freq = spec.map( osc );

    freq.dump;// BinaryOpUGen

    SinOsc.ar(
        freq.poll
    )
}.play
)

{FSinOsc.ar}.play // generates a temp__number synth
SynthDef("sine", {Out.ar(0, FSinOsc.ar)}).play // create a synthdef and play immediately
SynthDef("sine", {Out.ar(1, FSinOsc.ar)}).play // right channel
// or
(
SynthDef("one_tone_only", {
	var out, freq = 440;
	out = FSinOsc.ar(freq);
	Out.ar(0, out);
}).add // makesure SuperCollider knows about this SynthDef
)
// then use it top create a running synth
Synth("one_tone_only");

SynthDef("different_tones", {
	arg freq = 440; // declare an argument and give it a default value
	var out;
	out = SinOsc.ar(freq) * 0.3;
	Out.ar(0, out)
}).play

// Run all four, then stop all
Synth("different_tones", ["freq", 550]);
Synth("different_tones", [\freq, 660]); //same as "freq"
Synth("different_tones", ["freq", 880]);
// If no argument is specified, default are used (440)
Synth("different_tones");

a = Synth("different_tones", ["freq", 64.midicps]);
b = Synth("different_tones", ["freq", 67.midicps]);
c = Synth("different_tones", ["freq", 72.midicps]);
a.set("freq", 65.midicps);
c.set("freq", 71.midicps);
a.set("freq", 64.midicps); c.set("freq", 72.midicps);
a.free;
b.free;
c.free;

// Figure 1.7
(
// run this first
SynthDef("PMCrotale", {
	arg midi = 60, tone = 3, art = 1, amp = 0.8, pan = 0;
	var env, out, mod, freq;

	freq = midi.midicps;
	env = Env.perc(0, art);
	mod = 5 + (1 / IRand(2, 6));

	out = PMOsc.ar(freq, mod * freq,
		pmindex: EnvGen.kr(env, timeScale: art, levelScale: 0.3));

	out = Pan2.ar(out, pan);

	out = out * EnvGen.kr(env, timeScale: 1.3 * art, levelScale: Rand(0.1, 0.5), doneAction: 2);
	Out.ar(0, out); // Out.ar(bus, out);
}).add;
)

// Then run this a bunch of times:
Synth("PMCrotale", ["midi", rrand(48, 72).round(1), "tone", rrand(1, 6)]);



/**
 * SuperCollider #010
 */
Server.default = s = Server.internal.boot
~houston = Buffer.read(s, "/Applications/SuperCollider/sounds/Ambient Effect 1.wav");
~chooston = Buffer.read(s, "/Applications/SuperCollider/sounds/Ambient Effect 2.wav");

{PlayBuf.ar(2, ~houston, loop: 1)}.play
{PlayBuf.ar(2, ~chooston)}.play

// Figure 1.8
[~houston.bufnum, ~houston.numChannels, ~houston.path, ~houston.numFrames];
[~chooston.bufnum, ~chooston.numChannels, ~chooston.path, ~chooston.numFrames];

( // phasing
{
	var rate, trigger, frames;
	frames = ~chooston.numFrames; // or ~chooston.numFrames

	rate = [1, 1.01];
	trigger = Impulse.kr(rate);
	PlayBuf.ar(2, ~chooston, 1, trigger, frames * Line.kr(0, 1, 60)) * EnvGen.kr(Env.linen(0.01, 0.96, 0.01), trigger) * rate;
}.play
)

( // speed and direction change
{
	var speed, direction;
	speed = LFNoise0.kr(12) * 0.2 + 1;
	direction = LFClipNoise.kr(1/3);
	PlayBuf.ar(2, ~chooston, (speed * direction), loop: 1);
}.play
)


(
{
var fund = 220;
Mix.ar(
    [
    FSinOsc.ar(fund*1, mul: max(0, LFNoise1.kr(12))),
    FSinOsc.ar(fund*2, mul: max(0, LFNoise1.kr(12)))*1/2,
    FSinOsc.ar(fund*3, mul: max(0, LFNoise1.kr(12)))*1/3,
    FSinOsc.ar(fund*4, mul: max(0, LFNoise1.kr(12)))*1/4,
    FSinOsc.ar(fund*5, mul: max(0, LFNoise1.kr(12)))*1/5,
    FSinOsc.ar(fund*6, mul: max(0, LFNoise1.kr(12)))*1/6,
    ]
)*0.3
}.play
)

(
{
    var scale, specs, freqs, amps, rings,
    numRes = 5, bells = 20, pan;
    scale = [60, 62, 64, 67, 69].midicps;
    Mix.fill(bells, {
        //周波数
        freqs = Array.fill(numRes, {rrand(1, 15)*(scale.choose)});
        //音量
        amps = Array.fill(numRes, {rrand(0.3, 0.9)});
        //減衰
        rings = Array.fill(numRes, {rrand(1.0, 4.0)});
        //周波数、音量、減衰からKlangのspecs引数を生成
        specs = [freqs, amps, rings].round(0.01);
        //定位
        pan = (LFNoise1.kr(rrand(3, 6))*2).softclip;
        //Klangを生成
        Pan2.ar(
            Klank.ar(`specs, Dust.ar(1/6, 0.03)),
            pan)
    })
}.play;
)

s.record(duration: 12);



/**
 * SuperCollider #011
 */
Server.default = s = Server.internal.boot
~houston = Buffer.read(s, "/Applications/SuperCollider/sounds/Ambient Effect 1.wav");
~chooston = Buffer.read(s, "/Applications/SuperCollider/sounds/Ambient Effect 2.wav");
{PlayBuf.ar(2, ~houston, loop: 1)}.play
{PlayBuf.ar(2, ~chooston)}.play

// Figure 1.9
(
// if these haven't been used they will hold 0
~kbus1 = Bus.control; // a control bus
~kbus2 = Bus.control; // a control bus
{
	var speed, direction;
	speed = In.kr(~kbus1, 2) * 0.2 + 1;
	direction = In.kr(~kbus2);
	PlayBuf.ar(2, ~chooston, (speed * direction), loop: 1);
}.play;
)

(
// now start the controls
{Out.kr(~kbus1, LFNoise0.kr(12))}.play;
{Out.kr(~kbus2, LFClipNoise.kr(1/4))}.play;
)
// Now staqrt the second buffer with the same control input buses,
// but send it to the right channel using Out.ar(1 etc.
(
{
	var speed, direction;
	speed = In.kr(~kbus1, 1) * 0.2 + 1;
	direction = In.kr(~kbus2);
	Out.ar(0, PlayBuf.ar(2, ~houston, (speed * direction), loop: 1));
}.play;
)

~kbus3 = Bus.control; // a control bus
~kbus4 = Bus.control; // a control bus
// run these one at a time, (turn down the speakers!)
{Out.kr(~kbus3, SinOsc.kr(3).scope("out3") * 100)}.play;
{Out.kr(~kbus4, LFPulse.kr(1/3).scope("out4") * 200)}.play;
{Out.ar(0, SinOsc.ar(In.kr(~kbus3) + In.kr(~kbus4) + 440).scope("left"))}.play;
{Out.ar(1, SinOsc.ar(In.kr(~kbus3) + In.kr(~kbus4) + 880).scope("right"))}.play;

// When combined with a SynthDef, the routing can be swapped around in real time.
~kbus3 = Bus.control; // a control bus
~kbus4 = Bus.control; // a control bus
{Out.kr(~kbus3, SinOsc.kr(3).range(340, 540))}.play;
{Out.kr(~kbus4, LFPulse.kr(6).range(240, 640))}.play;
SynthDef("Switch", {arg freq = 440; Out.ar(0, SinOsc.ar(freq, 0, 0.3))}).add;
x = Synth("Switch"); // default
x.map(\freq, ~kbus3);
x.map(\freq, ~kbus4);

// Examples
(
{
    Out.ar(0,
        Pan2.ar( PlayBuf.ar(1, ~houston, loop: 1) *
            SinOsc.ar(LFNoise0.kr(12, mul: 500, add: 600)),
        0.5)
    )
}.play
)

(
{
var source, delay;
    source = PlayBuf.ar(1, ~chooston, loop: 1);
    delay =  AllpassC.ar(source, 2, [0.65, 1.15], 10);
    Out.ar(0,
    Pan2.ar(source) + delay
    )
}.play
)

~delay = Bus.audio(s, 2);
~mod = Bus.audio(s, 2);
~gate = Bus.audio(s, 2);
~k5 = Bus.control;

// コントロールバスを開始
{Out.kr(~k5, LFNoise0.kr(4))}.play;
// 最後の出力に手前でディレイラインを開始
{Out.ar(0, AllpassC.ar(In.ar(~delay, 2), 2, [0.65, 1.15], 10))}.play;
// ディレイの手前で音量のモジュレーションを開始
{Out.ar(~delay, In.ar(~mod, 2) * SinOsc.ar(In.kr(~k5)*500 + 1100))}.play;
// モジュレーションの手前でゲートを設定
{Out.ar([0, ~mod], In.ar(~gate, 2) * max(0, In.kr(~k5)))}.play;
// これで、エフェクトのチェーンの部分はできたのでここに実際にオーディオバッファを再生してみる
{Out.ar(~gate, Pan2.ar(PlayBuf.ar(1, ~houston, loop: 1), 0.5))}.play;
// すると、3つのエフェクトをチェーンにして再生される
// さらに別の音を追加することも可能
{Out.ar(~gate, Pan2.ar(PlayBuf.ar(1, ~chooston, loop: 1), -0.5))}.play;



/**
 * SuperCollider #012
 */
// Arrays, Iteration, and Logical Expression
a = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
a.at(8);
"Item at index 5 is ".post; a.at(5).postln;
"Item at index 0 is ".post; a.at(0).postln;
do(50, {[0, 2, 4, 5, 7, 9, 11].at(7.rand).postln})
do(50, {["C", "D", "E", "F", "G", "A", "B"].at(7.rand).postln})

Task({
	50.do({
		["C", "D", "E", "F", "G", "A", "B"].at(7.rand).postln;
		1.wait;
	});
}).play

Task({
	a = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
	"count, midi, pitch, octave".postln;
	do(50, {arg count;
		p = rrand(36, 72);
		[count, p, a.wrapAt(p), (p/12).round(1) - 1].postln;
	1.wait;
	})
}).play

// This use the PMCritale synth definition
(
a = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
"event, midi, pitch, octave".postln;
r = Task({
	inf.do({arg count;
		var midi, oct, density;
		density = 1.0; // 100% of the time. uncomment below for 70%, etc.
		// density = 0.7;
		// density = 0.3;
		midi = [0, 2, 4, 7, 9].choose;
		// midi = [0, 2, 4, 5, 7, 9, 11].choose;
		// midi = [0, 2, 3, 5, 6, 8, 9, 11].choose;
		// midi = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].choose;
		oct = [48, 60, 72].choose;
		if (density.coin,
			{ // true action
				"".postln;
				[midi + oct, a.wrapAt(midi),
					(oct/12).round(1)].post;
				Synth("PMCrotale",
					["midi", midi + oct, "tone", rrand(1, 7),
						"art", rrand(0.3, 2.0), "amp", rrand(0.1, 0.1), "pan",
						1.0.rand2]);
		}, {["rest"].post}); // false action
		0.2.wait;
	});
}).start
)

r.stop; // run this to stop

if (10 == 10, {"10 is indeed equal to 10"}, {"false"})
if ((1 < 20).and(1.isInteger), {"1 is less than 20"}, {"false"})
10.do({arg count; [count, if(count.odd, {"odd"}, {"even"})].postln})
(
84.do({arg count; if([0, 4, 7].includes(count%12),
	{count.post; " is part of a C triad.".postln},
	{count.post; " is not part of a C triad.".postln})})
)
50.do({if(1.0.rand.round(0.01).post > 0.5, {" > 0.5".postln}, {" < 0.5".postln})})
50.do({if(1.0.rand > 0.5, {"play a note".postln}, {"rest".postln})})
50.do({if(0.5.coin, {"play a note".postln}, {"rest".postln})})
if ((10.odd).or(10 < 20), {"true".postln}, {"false".postln})

Array.fill(100, {wchoose([1, 2, 3, 4], [0.5, 0.3, 0.125, 0.075])}).sort

// How to "Do" Array
[0, 2, 4, 5, 7, 9, 11].do({arg each, count; ["count", count,  "each", each].postln})
// same
[0, 2, 4, 5, 7, 9, 11].do({arg whatever, blech; [blech, whatever].postln})
(
var pc;
pc = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
[0, 2, 4, 5, 7, 9, 11].do({arg each; pc.wrapAt(each).postln;})
)

// Figure 1.14
// Nested do to generate a 12-tone matrix.
(
var row, inversion, pitchClass;
row = Array.series(11, 1).scramble.insert(0, 0);
// or enter your own row, e.g. Webern's Op 27
// row = [0, 11, 8, 2, 1, 7, 9, 10, 4, 3, 5, 6];
row.postln;
inversion = 12 - row;
// I add spaces to the strings for a tidy row
pitchClass = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
inversion.do({arg eachInv;
	var trans;
	trans = (row + eachInv);
	// prints just pitch class
	trans.do({arg scaleDegree; pitchClass.wrapAt(scaleDegree).post});
	// "".postln; // uncomment these line if you want to do both print just numbers
	// trans.do({arg scaleDegree; (scaleDegree%12).post; " ".post});
	"".postln;
});
"".postln
)

// Figure 1.15
// Mix down a few of them tuned to harmonics:
(
{
	var fund = 220;
	Mix.ar(
		[
			SinOsc.ar(220, mul: max(0, LFNoise1.kr(12))),
			SinOsc.ar(440, mul: max(0, LFNoise1.kr(12))) * 1/2,
			SinOsc.ar(660, mul: max(0, LFNoise1.kr(12))) * 1/3,
			SinOsc.ar(880, mul: max(0, LFNoise1.kr(12))) * 1/4,
			SinOsc.ar(1110, mul: max(0, LFNoise1.kr(12))) * 1/5,
			SinOsc.ar(1320, mul: max(0, LFNoise1.kr(12))) * 1/6
		]
	).dup * 0.5
}.play
)

// Figure 1.16
// Try this first
Array.fill(20, {arg cnt; cnt + 1 * 110}); // harmonics built on 110

// And a patch
(
{
	Mix.ar(
		Array.fill(12,
			{arg count;
				var harm;
				harm = count + 1 * 110; // remember precedence; count + 1, then * 110
				harm.postln;
				SinOsc.ar(harm,
					mul: max([0, 0], SinOsc.kr(count + 1/4)) // try these alternatives
				) * 1 / (count + 1)
		})
	) * 0.5
}.play
)
// SinOsc.kr(count + 1/4)
// SinOsc.kr(rrand(1/4, 5/4))
// SinOsc.kr(1/4, 2pi.rand)
// LFNoise1.kr(1)
// LFNoise0.kr(rrand(1, 5))



/**
 * SuperCollider #013
 */
Server.default = s = Server.internal.boot

// Figure 1.18
// Physically modeled bells
// Try this first, to illustrate the array of arrays.
Array.fill(3, {Array.fill(10, {rand(1000)})})
// Then this patch.

(
{
	var scale, specs, freqs, amps, rings, numRes = 5, bells = 20, pan;
	scale = [60, 62, 64, 67, 69].midicps;
	Mix.fill(bells, {
		freqs = Array.fill(numRes, {rrand(1, 15) * (scale.choose)});
		amps = Array.fill(numRes, {rrand(0.3, 0.9)});
		rings = Array.fill(numRes, {rrand(1.0, 4.0)});
		specs = [freqs, amps, rings].round(0.01);
		// specs.postln;
		pan = (LFNoise1.kr(rrand(3, 6)) * 2).softclip;
		Pan2.ar(
            Klank.ar(`specs, Dust.ar(1/6, 0.03)),
            pan, 10.0)
	})
}.play
)
// ` = Ref.new(thing)
// backquote/backtick [alt + ~]

// Figure 1.19
// Array in Sequences
(
// first define the synth
SynthDef.new("SimpleBlip", {
	arg midi = 60, tone = 10, art = 0.125, amp = 0.2, pan = -1;
	var out, temper;
	out = Pan2.ar(
		Blip.ar( // play hte sequence
			midi.midicps,
			tone
		) * EnvGen.kr(Env.perc(0.01, art)),
		pan // pan left, center, or right
	);
	DetectSilence.ar(out, doneAction: 2);
	amp = amp - ((midi - 60) * 0.02);
	Out.ar(0, out * amp)
}).add;
)

(
// Then run this Task
~inst = [0, 0, 0]; // Three containers for tasks
~pSeq = [0, 0, 0]; // Three containers for sequences
~scaleAdd = [4, 5, 11, nil, 10, 3, 6, nil];
~notes = ["C", "C#", "D", "Eb", "E", "F", "F#", "G", "Ab", "A", "Bb", "B"];
~rout = Task({
	inf.do({
		arg cnt1;
		var steps, durSeq, harmSeq;
		steps = rrand(6, 12);
		if(cnt1 % 6 == 0, // every sixth iteration, add a degree
			{~scale = ~scale.add(~scaleAdd.wrapAt((cnt1 / 6).round(1) - 1));});
		"\nIteration: ".post; cnt1.post;
		[" (center) ", " (right) ", " (left) "].wrapAt(cnt1).postln;
		if(cnt1 % 24 == 0, // reset all three
			{~scale = [0, 2, 7, 9];
				3.do({arg cnt2;
					~pSeq.wrapPut(cnt2,
						Array.fill(steps,
							{~scale.choose + [48, 60].choose}))})});
		"scale: ".post; ~scale.postln;