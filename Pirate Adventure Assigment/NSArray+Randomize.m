//
//  NSArray+Randomize.m
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 27.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "NSArray+Randomize.h"

@implementation NSArray (Randomize)

-(NSArray *)randomize
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id anyObject in self) {
        NSUInteger randomIndex = arc4random() % ([tmpArray count] + 1);
        [tmpArray insertObject:anyObject atIndex:randomIndex];
    }
    return [tmpArray copy];
}

@end
