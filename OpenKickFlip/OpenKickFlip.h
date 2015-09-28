//
//  OpenKickFlip.h
//
//  Created by Gaston Morixe on 10/27/15.
//  Copyright (c) 2015 Gaston Morixe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import <KFStream.h>
#import "KFS3Stream.h"


/**
 *  Block executed when stream is ready.
 *
 *  @param streamURL URL to the streamable m3u8
 *  @see presentBroadcasterFromViewController:ready:completion:
 */
typedef void (^KFBroadcastReadyBlock)(KFStream *stream);

/**
 *  Block executed when completed live broadcast
 *
 *  @param success Whether or not broadcast was successful
 *  @param error   Any error that occurred
 *  @see presentBroadcasterFromViewController:ready:completion:
 */
typedef void (^KFBroadcastCompletionBlock)(BOOL success, NSError* error);

/**
 *  Kickflip is the easiest way to broadcast live video. Sign up today at https://kickflip.io
 */
@interface OpenKickflip : NSObject

///-------------------------------
/// @name Broadcast
///-------------------------------

/**
 *  Presents KFBroadcastViewController from your view controller.
 *
 *  @param viewController  Presenting controller
 *  @param s3Configuration  S3 Configuration
 *  @param readyBlock      Called when streamURL is ready
 *  @param completionBlock Called when broadcaster is dismissed
 */
+ (void) presentBroadcasterFromViewController:(UIViewController *)viewController
                              s3Configuration:(KFS3Stream*)s3Config
                                        ready:(KFBroadcastReadyBlock)readyBlock
                                   completion:(KFBroadcastCompletionBlock)completionBlock;

@end
