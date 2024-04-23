s.reboot(
	MIDIClient.init; // Initialize MIDI client

	s.options.sampleRate = 44100; // Setup sample rate
	// s.options.numBuffers = 1024 * 256; // Increase this if you nead to load more samples
	// s.options.memSize = 8192 * 16; // Increase this if you get "alloc failed" messages
	// s.options.maxNodes = 1024 * 32; // Increase this is you are getting dropouts and the message "too many nodes"
	// s.options.numOutputBusChannels = 2; // Set this to your hardware output channel size
	// s.options.numInputBusChannels = 2; // Set this to your hardware input channel size

	SuperDirt.start; // Start SuperDirt server
	Server.killAll; // Kill all servers

	// Quark.gui; // Open samples folder

	ServerOptions.inDevices; // List all input devices
	ServerOptions.outDevices; // List all outputs devices
	ServerOptions.outDevices[1]; // List specific output device

	MIDIClient.restart; // Restart MIDI client

	s.waitForBoot {
		(
			~midiOut1 = MIDIOut.newByName("IAC Driver", "Bus 1");

			~dirt.loadSoundFiles; // Load SuperDirt Samples
			~dirt.loadSoundFiles("/Users/tun43p/Music/Tidal/samples/*"); // Load samples from the samples folder
			~dirt.soundLibrary.addMIDI(\ableton, ~midiOut1);
		);

		s.latency = 0;  // Increase this if you get "late" messages, example: 0.3
	};
);
