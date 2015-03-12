//
//  ViewController.m
//  TicTacToe
//
//  Created by Ronald Hernandez on 3/12/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "TicTacToeViewController.h"

@interface TicTacToeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;

@end

@implementation TicTacToeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   



}
- (void) findLabelUsingPoint:(CGPoint)point
{



}

- (IBAction)onLabelTapped:(id)sender {

    NSLog(@"It was tapped");

}



@end
