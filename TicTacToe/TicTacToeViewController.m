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


//player 1 or Player 2.
@property (nonatomic) int player;

//game state - this will keep track of

@property (nonatomic) NSArray *gameState;

@property CGPoint locationTapped;

@end

@implementation TicTacToeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   



}
- (UILabel *) findLabelUsingPoint:(CGPoint)point
{
    UILabel *labelFound;

    //second we need to find the label based on the CGpoint...so if we need to check if the tapped location found is contained within the label frame..if so that means the label has been tapped.


    if (CGRectContainsPoint(self.labelOne.frame, point)) {

        if ([self.labelOne.text isEqual:@"O"]){
            self.labelOne.text = @"X";
        } else{
            self.labelOne.text = @"O";
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



@end
