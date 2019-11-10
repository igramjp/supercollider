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


