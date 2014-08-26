//
//  Factory.m
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 25.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"


@implementation Factory

-(NSArray *)tiles
{
    /*
     #######################################################################
     ### Factoring and initialize all tiles in the 3x4 coordinate system ###
     #######################################################################
     
     ToDo: Randomize titles and balance game to solve boss fight only with a certain path towards him (super-duper-xtra-credit). ^^
     */
    
    Tile *tile1 = [[Tile alloc] init];
    tile1.tileImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.tileAction = @"Take the sword";
    tile1.tileStory = @"Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.isTileABossFight = NO;
    tile1.isTileActionForced = NO;
    tile1.isTileActionPerformed = NO;
    
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.tileImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.tileAction = @"Take steel armor";
    tile2.tileStory = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    Armor *steelArmor = [[Armor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.isTileABossFight = NO;
    tile2.isTileActionForced = NO;
    tile2.isTileActionPerformed = NO;
    
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.tileImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.tileAction = @"Stop at the Dock";
    tile3.tileStory = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.healthEffect = 17;
    tile3.isTileABossFight = NO;
    tile3.isTileActionForced = NO;
    tile3.isTileActionPerformed = NO;
    NSArray *column1Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.tileImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.tileAction = @"Adopt Parrot";
    tile4.tileStory = @"You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    Armor *parrotArmor = [[Armor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot Armor";
    tile4.armor = parrotArmor;
    tile4.isTileABossFight = NO;
    tile4.isTileActionForced = NO;
    tile4.isTileActionPerformed = NO;
    
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.tileImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.tileAction = @"Take pistol";
    tile5.tileStory = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    Weapon *pistolWeapon = [[Weapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 12;
    tile5.weapon = pistolWeapon;
    tile5.isTileABossFight = NO;
    tile5.isTileActionForced = NO;
    tile5.isTileActionPerformed = NO;
    
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.tileImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.tileAction = @"Show no fear!";
    tile6.tileStory = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.healthEffect = -22;
    tile6.isTileABossFight = NO;
    tile6.isTileActionForced = YES;
    tile6.isTileActionPerformed = NO;
    NSArray *column2Array = [[NSArray alloc] initWithObjects:tile3, tile5, tile6, nil];
    
    
    
    Tile *tile7 = [[Tile alloc] init];
    tile7.tileImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.tileAction = @"Fight those scum!";
    tile7.tileStory = @"You sight a pirate battle off the coast";
    tile7.healthEffect = -15;
    tile7.isTileABossFight = NO;
    tile7.isTileActionForced = YES;
    tile7.isTileActionPerformed = NO;
    
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.tileImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.tileAction = @"Abandon Ship";
    tile8.tileStory = @"The legend of the deep, the mighty kraken appears";
    tile8.healthEffect = -46;
    tile8.isTileABossFight = NO;
    tile8.isTileActionForced = YES;
    tile8.isTileActionPerformed = NO;
    
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.tileImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.tileAction = @"Take Treasurer";
    tile9.tileStory = @"You stumble upon a hidden cave of pirate treasurer";
    tile9.healthEffect = 20;
    tile9.isTileABossFight = NO;
    tile9.isTileActionForced = NO;
    tile9.isTileActionPerformed = NO;
    NSArray *column3Array = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    
    
    Tile *tile10 = [[Tile alloc] init];
    tile10.tileImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.tileAction = @"Repel the invaders";
    tile10.tileStory = @"A group of pirates attempts to board your ship";
    tile10.healthEffect = 15;
    tile10.isTileABossFight = NO;
    tile10.isTileActionForced = YES;
    tile10.isTileActionPerformed = NO;
    
    
    Tile *tile11 = [[Tile alloc] init];
    tile11.tileImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.tileAction = @"Swim deeper";
    tile11.tileStory = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.healthEffect = -7;
    tile11.isTileABossFight = NO;
    tile11.isTileActionForced = NO;
    tile11.isTileActionPerformed = NO;
    
    
    Tile *tile12 = [[Tile alloc] init];
    tile12.tileImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.tileAction = @"Fight!";
    tile12.tileStory = @"Your final faceoff with the fearsome pirate boss";
    tile12.healthEffect = -15;
    tile12.isTileABossFight = YES;
    tile12.isTileActionForced = YES;
    tile12.isTileActionPerformed = NO;
    NSArray *column4Array = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    return [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array, nil];
}

- (Pirate *)pirate{
    // create the lion-hearted pirate
    Pirate *pirate = [[Pirate alloc] init];
    pirate.health = 100;
    
    // initial armor
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    pirate.currentArmor = armor;
    
    // initial weapon
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    pirate.currentWeapon = weapon;

    return pirate;
}

-(Boss *)boss
{
    // create the final boss
    Boss *boss = [[Boss alloc] init];
    boss.health = 65;
    return boss;
}


@end
