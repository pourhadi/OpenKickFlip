# OpenKickFlip SDK for iOS

This is a fork from the original [Kickflip](http://kickflip.io) opensource project and commercial platform.

OpenKickFlip taks the best of the awesome Kickflip and allows you to directly upload the streaming to your own s3 bucket.

OpenKickFlip provides a complete video broadcasting solution for your iOS application. You can use our pre-built `KFBroadcastViewController` to stream live video with one line of code. 

## Quickstart

```objc
#import <OpenKickFlip/OpenKickFlip.h>

...

- (void) broadcastButtonPressed {
    
    KFS3Stream* s3Config     = [[KFS3Stream alloc] init];
    NSString* random         = [KFS3Stream randomStringWithLength:6];
    s3Config.bucketName      = [@"***YOUR BUCKET NAME HERE***/" stringByAppendingPathComponent:random];
    s3Config.awsAccessKey    = @"*** YOUR AWS TEMPORAL TOKEN***";
    s3Config.awsSecretKey    = @"*** YOUR AWS TEMPORAL SECRET TOKEN***";
    s3Config.awsSessionToken = @"*** YOUR AWS TEMPORAL SESSION TOEKN***";
    s3Config.awsRegion = @"*** YOUR S3 BUCKET REGION ****"; // i.e. "us-east-1"
    s3Config.awsPrefix = @""; /// leave this like this
    NSDate* date = [[NSDate alloc] initWithTimeIntervalSince1970:1443486098];  /// *** YOUR S3 TEMPORAL TOKEN EXPIRATIONS IN EPOCH TIME ***
    s3Config.awsExpirationDate = date;
    
    [OpenKickflip presentBroadcasterFromViewController:self
                                        s3Configuration:s3Config
                                                 ready:^(KFStream *stream) {
        if (stream.streamURL) {
            NSLog(@"Stream is ready at URL: %@", stream.streamURL);
        }
    } completion:^(BOOL success, NSError* error){
        if (!success) {
            NSLog(@"Error setting up stream: %@", error);
        } else {
            NSLog(@"Done broadcasting");
        }
    }];
}

```

## How do I get an AWS S3 Temporal Upload Token?

Using the [aws-sdk-ruby](https://github.com/aws/aws-sdk-ruby) you can do this by
```
    Aws::STS::Client.new(region: '***REGION NAME***', credentials: Aws::Credentials.new('***AWS IAM TOKEN WITH ACCESS TO THE BUCKET***', '***AWS IAM TOKEN SECRET***')).get_session_token(duration_seconds: 1.day)
```

## Cocoapods Setup

You'll need to install [Cocoapods](http://cocoapods.org) first.
    
Add the following line to your `Podfile`:

    pod 'OpenKickFlip'

Then run Cocoapods to install all of the dependencies:

    $ pod install

As with all projects that depend on Cocoapods, make sure to open the new `.xcworkspace` file, not your `.xcodeproj` file.
    
## Documentation

TODO

## Screenshots

[![kickflip app screenshot](https://i.imgur.com/QPtggd9m.jpg)](https://i.imgur.com/QPtggd9.png)
[![kickflip live broadcast screenshot](https://i.imgur.com/VHB6iQQm.jpg)](https://i.imgur.com/VHB6iQQ.png)
[![kickflip live consumption screenshot](https://i.imgur.com/IZbiyhRm.jpg)](https://i.imgur.com/IZbiyhR.png)

[Screenshots Gallery](http://imgur.com/a/IwuZ7)

    
## License

TODO TOASK TOREV

Apache 2.0

	Copyright 2014 OpenWatch, Inc.
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	    http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
