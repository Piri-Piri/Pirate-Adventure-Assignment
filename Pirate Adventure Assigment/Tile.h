//
//  Tile.h
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 25.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"

@interface Tile : NSObject

@property (nonatomic, strong) UIImage *tileImage;
@property (nonatomic, strong) NSString *tileStory;
@property (nonatomic, strong) NSString *tileAction;
@property (nonatomic) Boolean isTileABossFight;
@property (nonatomic) Boolean isTileActionForced;
@property (nonatomic) Boolean isTileActionPerformed;

@property (nonatomic) int healthEffect;
@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic, strong) Armor *armor;

@end
