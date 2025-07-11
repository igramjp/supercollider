(
s.options.device = "BlackHole 64ch";
s.options.sampleRate = 192000;
s.options.numBuffers = 1024 * 128;
s.options.memSize = 8192 * 128;
s.options.numWireBufs = 2048;
s.options.maxNodes = 1024 * 32;
s.options.numOutputBusChannels = 16;
s.options.numInputBusChannels = 16;
s.latency_(0.1);

s.waitForBoot{
	~dirt = SuperDirt(2, s);
	~dirt.loadSoundFiles;
	s.sync;
	~dirt.start(57120, Array.series(32,0,2));
	MIDIClient.init;
	~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1");
	~midiOut.latency = Server.default.latency;
	~dirt.soundLibrary.addMIDI(\midi, ~midiOut);
};
)
