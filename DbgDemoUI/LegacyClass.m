//
//  LegacyClass.m
//  DbgDemoUI
//
//  Created by Andreas Oetjen on 09.04.21.
//

#import "LegacyClass.h"

@interface LegacyClass()
@property int counter;
@end

@implementation LegacyClass

- (int) legacyMethod:(NSString*)value {
    ++_counter;
    NSLog(@"legacyMethod: %@", value);
    return _counter;
}

@end
