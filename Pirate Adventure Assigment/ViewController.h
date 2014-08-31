//
//  ViewController.h
//  Pirate Adventure Assigment
//
//  Created by David Pirih on 24.08.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pirate.h"
#import "Boss.h"

@interface ViewController : UIViewController

// Vars
@property (nonatomic) CGPoint currentPosition;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Pirate *pirate;
@property (strong, nonatomic) Boss *boss;

// IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *tileCapacityLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPositionLabel;
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
@property (weak, nonatomic) IBOutlet UILabel *armorLabel;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet UIButton *northButton;
@property (weak, nonatomic) IBOutlet UIButton *southButton;
@property (weak, nonatomic) IBOutlet UIButton *westButton;
@property (weak, nonatomic) IBOutlet UIButton *eastButton;

// IBActions
- (IBAction)performAction:(UIButton *)sender;
- (IBAction)resetGame:(UIButton *)sender;
- (IBAction)moveNorth:(UIButton *)sender;
- (IBAction)moveSouth:(UIButton *)sender;
- (IBAction)moveWest:(UIButton *)sender;
- (IBAction)moveEast:(UIButton *)sender;

@end

