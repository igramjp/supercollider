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
// LFNoise0
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


// LFNoise1
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


// XLine
play({ SinOsc.ar(XLine.kr(200,17000,10),0,0.1) });


// RLPF
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

// Dust
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

// Saw
// modulating the frequency
{ Saw.ar(XLine.kr(40,4000,6),0.2) }.scope;

// two band limited sawtooth waves through a resonant low pass filter
{ RLPF.ar(Saw.ar([100,250],0.1), XLine.kr(8000,400,5), 0.05) }.play;


// MouseX, MouseY
{ SinOsc.ar(MouseX.kr(40, 10000, 1), 0, 0.1) }.play;
{ SinOsc.ar(MouseX.kr(500, 10000, 1).poll, 0, 0.1) }.play;
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


