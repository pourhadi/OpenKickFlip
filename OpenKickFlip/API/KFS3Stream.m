//
//  KFS3Stream.m
//  Kickflip
//
//  Created by Christopher Ballinger on 1/16/14.
//  Copyright (c) 2014 Christopher Ballinger. All rights reserved.
//

#import "KFS3Stream.h"
#import "KFDateUtils.h"

NSString * const KFS3StreamType = @"HLS";
static NSString * const KFS3StreamBucketNameKey = @"bucket_name";
static NSString * const KFS3StreamAWSAccessKey = @"aws_access_key";
static NSString * const KFS3StreamAWSSecretKey = @"aws_secret_key";
static NSString * const KFS3StreamAWSSessionTokenKey = @"aws_session_token";
static NSString * const KFS3StreamAWSExpirationDateKey = @"aws_duration";
static NSString * const KFS3StreamAWSRegionKey = @"aws_region";
static NSString * const KFS3StreamAWSPrefix = @"aws_prefix";


@interface KFS3Stream() {
    NSString *_streamID;
}
@end

@implementation KFS3Stream

static const NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

+ (NSDictionary*) JSONKeyPathsByPropertyKey {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[super JSONKeyPathsByPropertyKey]];
    dictionary[NSStringFromSelector(@selector(bucketName))] = KFS3StreamBucketNameKey;
    dictionary[NSStringFromSelector(@selector(awsAccessKey))] = KFS3StreamAWSAccessKey;
    dictionary[NSStringFromSelector(@selector(awsSecretKey))] = KFS3StreamAWSSecretKey;
    dictionary[NSStringFromSelector(@selector(awsPrefix))] = KFS3StreamAWSPrefix;
    dictionary[NSStringFromSelector(@selector(awsSessionToken))] = KFS3StreamAWSSessionTokenKey;
    dictionary[NSStringFromSelector(@selector(awsExpirationDate))] = KFS3StreamAWSExpirationDateKey;
    dictionary[NSStringFromSelector(@selector(awsRegion))] = KFS3StreamAWSRegionKey;
    return dictionary;
}

+ (NSValueTransformer *)awsExpirationDateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [[KFDateUtils utcDateFormatter] dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [[KFDateUtils utcDateFormatter] stringFromDate:date];
    }];
}

- (NSString*)streamID {
    if (!_streamID) {
        _streamID = [[[NSUUID alloc] init] UUIDString];
    }
    return _streamID;
}

- (NSURL*)uploadURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://s3.amazonaws.com/%@", self.bucketName]];
}

@end
