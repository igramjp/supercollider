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
