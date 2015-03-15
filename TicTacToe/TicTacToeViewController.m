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


//-----NSTimer Stuff-----//
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic) int labelInt;
@property (nonatomic) NSTimer *timer;



//create an array a labels array to store all of the labels.

@property NSArray *labelsArray;



//player 1 or Player 2.
@property (nonatomic) int player;

//game state - this will keep track
//0 is empty, 1 is circles, 2 is cross

@property (nonatomic) NSMutableArray* gameState;

@property (nonatomic)  NSArray *combinationsforwinning;

@property CGPoint locationTapped;


//we will let the X go first.

@property (nonatomic) int whichTurn;

@end

@implementation TicTacToeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //x = 1, 0 =2, x = 3, 0 = 4 .....and so on
    self.whichTurn = 1;

    //need the mutablecopy property to properly declare.

    self.gameState = @[@0, @0, @0, @0, @0, @0, @0, @0, @0].mutableCopy;

    self.originalWhichPlayerLabelCenter = self.whichPlayerLabel.center;

    //now that we have the game state, basically we'd need to check for the state of each label...and compare it to each possible combination for wining.
//    the possible winning combinations are:
//    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] which would go in an array of arrays.

    self.combinationsforwinning = @[@[@0, @1, @2], @[@3, @4, @5], @[@6, @7, @8], @[@0, @3, @6], @[@1, @4, @7], @[@2, @5, @8], @[@0, @4, @8], @[@2, @4, @6]];


    //load add the labels to the array.

    self.labelsArray = @[self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine];

//---------------------//
//----NSTimer Stuff----//
    self.labelInt = 20;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", self.labelInt];
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countDownMethod) userInfo:nil repeats:YES];
}

-(void)countDownMethod
{
    NSLog(@"hello");
    self.labelInt -=1;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", self.labelInt];

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


        if (self.gameState[1] == 0 ) {
            //change label to players piece
            self.labelTwo.text = self.whichPlayerLabel.text;
        }else {
            self.whichPlayerLabel.center = self.originalWhichPlayerLabelCenter;
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

    self.gameState = @[@0, @0, @0, @0, @0, @0, @0, @0, @0].mutableCopy;

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


        for (int i = 0; i<self.labelsArray.count; i++){

            UILabel *someLabel = self.labelsArray[i];


        if (CGRectContainsPoint(someLabel.frame, point))
        {
            if ([self.whichPlayerLabel.text isEqualToString:@"X"] && [self.gameState[i] intValue] == 0){

            someLabel.text = @"X";
            self.whichPlayerLabel.text = @"O";


                //to add to this array need to convert int to an NSNumber Object.
                self.gameState[i] = @(1);

            } else if ([self.whichPlayerLabel.text isEqualToString:@"O"] && [self.gameState[i] intValue] == 0){
                someLabel.text = @"O";
                self.whichPlayerLabel.text = @"X";
            }
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


    for (int i = 0; i<self.combinationsforwinning.count; i++) {

        NSArray *innerArray = self.combinationsforwinning[i];

        for (int j = 0; j<innerArray.count; j++) {

            NSArray *k = innerArray[j]; //[innerArray[j] intValue];

            //   if (self.gameState[k[0]] == self.gameState[[1]] && self.gameState[k[0]] == self.gameState[k[2]]){



        }
    }

    //
    //        int i = 0;
    //        int j = 0;
    //        for (NSArray *combination in self.combinationsforwinning){
    //
    //            for (NSArray *element in combination) {
    //
    //
    //
    //
    //                if (self.gameState[element[0]] == self.gameState[element[1]] && self.gameState[element[0]] == self.gameState[element[2]]){
    //                    //
    //                    }
    //
    //
    //            }
    //
    //        }

    //        for (int i = 0; i <self.combinationsforwinning.count i++){
    //            NSArray *someArray = self.combinationsforwinning[i];
    //            for (int j = 0; j < 3; i++) {
    //                (self.gameState[someArray[0]] == self.gameState[someArray[1]] && self.gameState[someArray[0]] == self.gameState[someArray[2]]){
    //
    //            }
    //
    //
    //        }
    //
    //
    //        for (NSArray *someCombination in self.combinationsforwinning) {
    //
    //
    //
    //            for (NSArray *i in someCombination){
    //
    //                if (self.gameState[someCombination[@0]] == self.gameState[combination[@1]] && self.gameState[someCombination[@0]] == self.gameState[someCombination[@2]]){
    //
    //                }
    //
    //            }
    //
    //        }
    //            for
    //
    //            if (self.gameState[someCombination[@0]] == self.gameState[combination[@1]] && self.gameState[someCombination[@0]] == self.gameState[someCombination[@2]]){
    //
    //            }
    //
    //
    //
    //        }
}

@end
