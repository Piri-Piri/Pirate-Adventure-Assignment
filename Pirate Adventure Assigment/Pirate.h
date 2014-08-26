//
//  Pirate.h
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 25.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"

@interface Pirate : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic, strong) Weapon *currentWeapon;
@property (nonatomic, strong) Armor *currentArmor;

@end
