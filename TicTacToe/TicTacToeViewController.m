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

    if (CGRectContainsPoint(self.labelOne.frame, point)) {
        NSLog(@"Label one tapped");
    } else {
        NSLog(@"No label was tapped");
    }

    return labelFound;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {

    //NSLog(@"It was tapped");
    self.locationTapped = [sender locationInView:self.view];
   // NSLog(@"%f", self.locationTapped.x);
    [self findLabelUsingPoint:self.locationTapped];


}



@end
