# MCSoundBoard

## Goal of the project

Create a singleton class to make playing audio extremely within an iOS app simpler.

## License

This code is available under the MIT license.

## Installation

1. Drag files from the Classes folder to your project;
2. Add AudioToolbox and AVFoundation frameworks;
3. \#import "MCSoundBoard.h" wherever you want to use it.

## Usage

Here's how you initialize and play a "short sound" (30s or shorter .caf, .air or .wav snippets):

```
	[MCSoundBoard addSoundAtPath:[[NSBundle mainBundle] pathForResource:@"ding.wav" ofType:nil] forKey:@"ding"];

	[MCSoundBoard playSoundForKey:@"ding"];
```

For longer AAC, MP3 and ALAC (Apple Lossless) audio, use:

```    
    [MCSoundBoard addAudioAtPath:[[NSBundle mainBundle] pathForResource:@"play.mp3" ofType:nil] forKey:@"play"];
    
    [MCSoundBoard playAudioForKey:@"play"];
```
 
For a nice fede in effect, you can use

```
	[MCSoundBoard playAudioForKey:@"play" fadeInInterval:2.0];
```
Similar metods are available for stopping and pausing the audio:

```
	+ (void)stopAudioForKey:(id)key fadeOutInterval:(NSTimeInterval)fadeOutInterval;
	+ (void)stopAudioForKey:(id)key;
	
	+ (void)pauseAudioForKey:(id)key fadeOutInterval:(NSTimeInterval)fadeOutInterval;
	+ (void)pauseAudioForKey:(id)key;
```

For longer audio, this class uses [AVAudioPlayer](http://developer.apple.com/library/ios/#DOCUMENTATION/AVFoundation/Reference/AVAudioPlayerClassReference/Reference/Reference.html) and, if you need to set volume, number of loops and so on, you can get access to the underlying player by calling: 

```    
    AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"play"];
    player.numberOfLoops = -1;  // Endless looping
```