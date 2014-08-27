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
    
    // Factoring tiles and characters
    Factory *factory = [[Factory alloc] init];
    self.tiles =[factory tiles];
    self.pirate = [factory pirate];
    self.boss = [factory boss];
    
    // initial states
    self.currentPosition = CGPointMake(0, 0);
    self.boss.hasAttacked = NO;
    
    // evaluteValidMove and setup (initial) scene
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
    
    // determine if we are in the final boss fght
    if (currentTile.isTileABossFight){
        self.boss.health = self.boss.health - self.pirate.damage;
        self.boss.hasAttacked = YES;
    }
    
    // avoid performing action again - excepting the boss fight
    if (!currentTile.isTileActionPerformed || currentTile.isTileABossFight){
        [self updateCharacterStatsForArmor:currentTile.armor withWeapon:currentTile.weapon withHealthEffect:currentTile.healthEffect];
    }
    
    // track that action is already performed
    currentTile.isTileActionPerformed = YES;
    
    // check for win or lost
    if(self.pirate.health <=0){
        /* UIAlertView objects take multiple parameters. For now we will only use strings for a title, message and cancel button. Make sure to set other buttons and delegate to nil */
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        [self resetGame:nil];
    }
    /* If the bosses health is below 0 show an alertview that tells the user they won the game */
    else if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        [self resetGame:nil];
    }
    // check for valid move and update stats after moving to another tile
    [self evaluteValidMoves];
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
    // hide button, if tile does not exit in the 4x3 coordinate system
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y+1)];
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x-1, self.currentPosition.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x+1, self.currentPosition.y)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y-1)];
    
    
    // normal tile: disable move buttons, if action is force on this tile
    // boss fight tile: diable move buttons, if boss has at least attack ones (retain fight)
    Tile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    if (currentTile.isTileActionForced){
        self.northButton.enabled = currentTile.isTileActionPerformed;
        self.westButton.enabled = currentTile.isTileActionPerformed;
        self.eastButton.enabled = currentTile.isTileActionPerformed;
        self.southButton.enabled = currentTile.isTileActionPerformed;
    } else if (currentTile.isTileABossFight){
        self.northButton.enabled = self.boss.hasAttacked;
        self.westButton.enabled = self.boss.hasAttacked;
        self.eastButton.enabled = self.boss.hasAttacked;
        self.southButton.enabled = self.boss.hasAttacked;
    }
}

- (BOOL)tileExistsAtPoint:(CGPoint)point {
    // four checks in the 4x3 coordinate system (2x lower and 2x upper bounds)
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else {
        return YES;
    }
}

- (void)updateEnvironment{
    // add a transition animation
    [UIView transitionWithView:self.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        // updating information inside the views
                        Tile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    
                        self.backgroundImage.image = currentTile.tileImage;
                        self.storyLabel.text = currentTile.tileStory;
    
                        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.pirate.health];
                        self.damageLabel.text = [NSString stringWithFormat:@"%i", self.pirate.damage];
                        self.weaponLabel.text = self.pirate.currentWeapon.name;
                        self.armorLabel.text = self.pirate.currentArmor.name;
    
                        [self.actionButton setTitle:currentTile.tileAction forState:UIControlStateNormal];
                    } completion:nil];
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
        // initial run with NO action performed
        self.pirate.health = self.pirate.health + self.pirate.currentArmor.health;
        self.pirate.damage = self.pirate.damage + self.pirate.currentWeapon.damage;
    }
    
}

@end
