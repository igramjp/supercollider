/**
 * SuperCollider #001
 */
"Hello, World!"

2 + 3

Server.default = s = Server.internal.boot

play({SinOsc.ar(LFNoise0.kr(12, mul: 600, add: 1000), 0.3)})

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





