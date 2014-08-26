//
//  Factory.h
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 25.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pirate.h"
#import "Boss.h"

@interface Factory : NSObject

-(NSArray *)tiles;
-(Pirate *)pirate;
-(Boss *)boss;

@end
