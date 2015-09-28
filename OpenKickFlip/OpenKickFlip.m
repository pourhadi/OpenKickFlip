//
//  OpenKickflipp.m
//
//  Created by Christopher Ballinger on 1/16/14.
//  Copyright (c) 2014 Christopher Ballinger. All rights reserved.
//

#import "OpenKickFlip.h"
#import "KFLog.h"
#import "KFBroadcastViewController.h"
#import "KFS3Stream.h"

@interface OpenKickflip()

@end


@implementation OpenKickflip

+ (void) presentBroadcasterFromViewController:(UIViewController *)viewController
                              s3Configuration:(KFS3Stream*)s3Config
                                        ready:(KFBroadcastReadyBlock)readyBlock
                                   completion:(KFBroadcastCompletionBlock)completionBlock {
    
    KFBroadcastViewController *broadcastViewController = [[KFBroadcastViewController alloc] init];
    broadcastViewController.readyBlock = readyBlock;
    broadcastViewController.completionBlock = completionBlock;
    broadcastViewController.recorder.s3Configuration = s3Config;
    [viewController presentViewController:broadcastViewController animated:YES completion:nil];
    
}

@end
