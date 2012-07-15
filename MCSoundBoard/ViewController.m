//
//  ViewController.m
//  MCSoundBoard
//
//  Created by Baglan Dosmagambetov on 7/14/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCSoundBoard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [MCSoundBoard addSoundAtPath:[[NSBundle mainBundle] pathForResource:@"ding.wav" ofType:nil] forKey:@"ding"];
    
    [MCSoundBoard addAudioAtPath:[[NSBundle mainBundle] pathForResource:@"play.mp3" ofType:nil] forKey:@"play"];
    
    [MCSoundBoard addAudioAtPath:[[NSBundle mainBundle] pathForResource:@"loop.mp3" ofType:nil] forKey:@"loop"];
    AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"loop"];
    player.numberOfLoops = -1;  // Endless
    [MCSoundBoard playAudioForKey:@"loop" fadeInInterval:2.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)playSound:(id)sender
{
    [MCSoundBoard playSoundForKey:@"ding"];
}

- (IBAction)playAudio:(id)sender
{
    [MCSoundBoard playAudioForKey:@"play"];
}

- (IBAction)loopAudio:(id)sender
{
    AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"loop"];
    if (player.playing) {
        [MCSoundBoard pauseAudioForKey:@"loop" fadeOutInterval:2.0];
    } else {
        [MCSoundBoard playAudioForKey:@"loop" fadeInInterval:2.0];
    }
}

@end
