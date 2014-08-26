//
//  ViewController.m
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 24.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Factory *factory = [[Factory alloc] init];
    self.tiles =[factory tiles];
    self.pirate = [factory pirate];
    self.boss = [factory boss];
    self.currentPosition = CGPointMake(0, 0);
    
    [self evaluteValidMoves];
    [self updateCharacterStatsForArmor:nil withWeapon:nil withHealthEffect:0];
    [self updateEnvironment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performAction:(UIButton *)sender {
    Tile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    
    if (currentTile.isTileABossFight){
        self.boss.health = self.boss.health - self.pirate.damage;
    }
    
    [self updateCharacterStatsForArmor:currentTile.armor withWeapon:currentTile.weapon withHealthEffect:currentTile.healthEffect];
    
    if(self.pirate.health <=0){
        /* UIAlertView objects take multiple parameters. For now we will only use strings for a title, message and cancel button. Make sure to set other buttons and delegate to nil */
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    /* If the bosses health is below 0 show an alertview that tells the user they won the game */
    else if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateEnvironment];
}

- (IBAction)resetGame:(UIButton *)sender {
    self.pirate = nil;
    self.boss = nil;
    [self viewDidLoad];
}

- (IBAction)moveNorth:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y+1);
    [self evaluteValidMoves];
    [self updateEnvironment];
}

- (IBAction)moveWest:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x-1, self.currentPosition.y);
    [self evaluteValidMoves];
    [self updateEnvironment];
}

- (IBAction)moveEast:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x+1, self.currentPosition.y);
    [self evaluteValidMoves];
    [self updateEnvironment];
}

- (IBAction)moveSouth:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y-1);
    [self evaluteValidMoves];
    [self updateEnvironment];
}


- (void)evaluteValidMoves{
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y+1)];
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x-1, self.currentPosition.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x+1, self.currentPosition.y)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y-1)];

}

- (BOOL)tileExistsAtPoint:(CGPoint)point {
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else {
        return YES;
    }
}

- (void)updateEnvironment{
    Tile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    
    self.backgroundImage.image = currentTile.tileImage;
    self.storyLabel.text = currentTile.tileStory;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.pirate.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.pirate.damage];
    self.weaponLabel.text = self.pirate.currentWeapon.name;
    self.armorLabel.text = self.pirate.currentArmor.name;
    
    [self.actionButton setTitle:currentTile.tileAction forState:UIControlStateNormal];
}

-(void)updateCharacterStatsForArmor:(Armor *)armor withWeapon:(Weapon *)weapon withHealthEffect:(int)healthEffect{
    if (armor != nil){
        self.pirate.health = self.pirate.health - self.pirate.currentArmor.health + armor.health;
        self.pirate.currentArmor = armor;
    }
    else if (weapon != nil){
        self.pirate.damage = self.pirate.damage - self.pirate.currentWeapon.damage + weapon.damage;
        self.pirate.currentWeapon = weapon;
    }
    else if (healthEffect != 0){
        self.pirate.health = self.pirate.health + healthEffect;
    }
    else {
        // initial run with action performed
        self.pirate.health = self.pirate.health + self.pirate.currentArmor.health;
        self.pirate.damage = self.pirate.damage + self.pirate.currentWeapon.damage;
    }
    
}

@end
