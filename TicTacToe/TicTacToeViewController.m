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
@property  CGPoint originalWhichPlayerLabelCenter;



//player 1 or Player 2.
@property (nonatomic) int player;

//game state - this will keep track
//0 is empty, 1 is circles, 2 is cross

@property (nonatomic) NSArray *gameState;

@property (nonatomic)  NSMutableArray *combinationsforwinning;

@property CGPoint locationTapped;

@end

@implementation TicTacToeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.gameState = @[@0, @0, @0, @0, @0, @0, @0, @0, @0];

    self.originalWhichPlayerLabelCenter = self.whichPlayerLabel.center;

    //now that we have the game state, basically we'd need to check for the state of each label...and compare it to each possible combination for wining.
//    the possible winning combinations are:
//    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] which would go in an array of arrays.

    //self.combinationsforwinning = [@[@0, @1, @2], @[@3, @4, @5], @[@6, @7, @8], @[@0, @3, @6], @[@1, @4, @7], @[@2, @5, @8], @[@0, @4, @8], @[@2, @4, @6]];







}
- (UILabel *) findLabelUsingPoint:(CGPoint)point
{
    UILabel *labelFound;

    //second we need to find the label based on the CGpoint...so if we need to check if the tapped location found is contained within the label frame..if so that means the label has been tapped.


    if (CGRectContainsPoint(self.labelOne.frame, point)) {
        if (self.gameState[0] == 0 ) {
            //change label to players piece
            self.labelOne.text = self.whichPlayerLabel.text;
        }else {
            self.whichPlayerLabel.center = self.originalWhichPlayerLabelCenter;
        }


        NSLog(@"Label one tapped");
    } else if (CGRectContainsPoint(self.labelTwo.frame, point)){
        if ([self.labelTwo.text isEqual:@"O"]){
            self.labelTwo.text = @"X";
        } else{
            self.labelTwo.text = @"O";
        }
        NSLog(@"Label two tapped");
    } else if (CGRectContainsPoint(self.labelThree.frame, point)){
        if ([self.labelThree.text isEqual:@"O"]){
            self.labelThree.text = @"X";
        } else{
            self.labelThree.text = @"O";
        }
        NSLog(@"Label three tapped");
    }else if (CGRectContainsPoint(self.labelFour.frame, point)){
        NSLog(@"Label four tapped");
    } else if (CGRectContainsPoint(self.labelFive.frame, point)){
        NSLog(@"Label five tapped");
    } else if (CGRectContainsPoint(self.labelSix.frame, point)){
        NSLog(@"Label six tapped");
    }else if (CGRectContainsPoint(self.labelSeven.frame, point)){
        NSLog(@"Label seven tapped");
    } else if (CGRectContainsPoint(self.labelEight.frame, point)){
        NSLog(@"Label eight tapped");
    } else if (CGRectContainsPoint(self.labelNine.frame, point)){
        NSLog(@"Label nine tapped");
    } else{
                NSLog(@"The user tapped outside of the labels");
    }









    return labelFound;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {

    //NSLog(@"It was tapped");

    //first we need to find the location of the label tapped via the UITapGestureRecognizer.
    self.locationTapped = [sender locationInView:self.view];
   // NSLog(@"%f", self.locationTapped.x);
    [self findLabelUsingPoint:self.locationTapped];


}

- (IBAction)playAgainButtonTapped:(id)sender {

    self.gameState = @[@0, @0, @0, @0, @0, @0, @0, @0, @0];

    self.labelOne.text = @"";
    self.labelTwo.text = @"";
     self.labelThree.text = @"";
     self.labelFour.text = @"";
     self.labelFive.text = @"";
     self.labelSix.text = @"";
     self.labelSeven.text = @"";
     self.labelEight.text = @"";
     self.labelNine.text = @"";

}

-(IBAction)whilePanning:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [sender locationInView:self.view];
        self.whichPlayerLabel.center = point;
        if (CGRectContainsPoint(self.labelOne.frame, point))
        {
            self.labelOne.text = @"X";
            self.whichPlayerLabel.text = @"O";

        }

        [UIView animateWithDuration:2 animations:
         ^{
             self.whichPlayerLabel.center = self.originalWhichPlayerLabelCenter;
             self.whichPlayerLabel.alpha = 0;
         } completion:^(BOOL finished)
         {
             self.whichPlayerLabel.alpha = 1;
         }];
    }}


@end
