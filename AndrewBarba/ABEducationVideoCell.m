//
//  ABEducationVideoCell.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/30/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABEducationVideoCell.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ABEducationVideoCell()
@property (nonatomic, strong) MPMoviePlayerController *mp;
@end

@implementation ABEducationVideoCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.mp = [[MPMoviePlayerController alloc] init];
    self.mp.controlStyle = MPMovieControlStyleEmbedded;
    self.mp.shouldAutoplay = NO;
    [self.contentView addSubview:self.mp.view];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    self.mp.useApplicationAudioSession = NO; // this is needed so sound plays through speakers
#pragma clang diagnostic pop
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_handleVideoBeganNotification:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:self.mp];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.mp.view.frame = self.contentView.bounds;
}

- (void)setVideoURL:(NSURL *)url
{
    if (!self.mp.contentURL) {
        self.mp.contentURL = url;
        [self.mp prepareToPlay];
    }
}

- (void)_handleVideoBeganNotification:(NSNotification *)notification
{
    if (self.mp.playbackState == MPMoviePlaybackStatePlaying) {
        [[ABTrackingService sharedInstance] trackEvent:@"Video Played" withValue:nil fromSender:@"Education Video Cell"];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.mp];
}

@end
