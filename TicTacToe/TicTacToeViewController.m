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

@property (nonatomic) bool labelchanged;

@property (nonatomic) int winner;

@property (nonatomic) NSString *playerOneName;

@property (nonatomic) NSString *playerTwoName;
@end

@implementation TicTacToeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //label changed should be false
    self.labelchanged = false;

    //set the winner to 0
    self.winner = 0;

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
//---- call the timer----//

    [self setTimer];



    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Player 2:" message:@"Please enter your name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];

    alert2.alertViewStyle = UIAlertViewStylePlainTextInput;

    alert2.tag = 2;

    [alert2 addButtonWithTitle:@"GO"];

    [alert2 show];



    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Player 1:" message:@"Please enter your name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

    alert.tag = 1;

    [alert addButtonWithTitle:@"GO"];

    [alert show];




}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        if (buttonIndex == 1) {
            UITextField *textfield = [alertView textFieldAtIndex:0];

            self.playerOneName = textfield.text;

            //NSLog(@"username: %@", textfield.text);
        }
    } else if (alertView.tag == 2) {
        if (buttonIndex == 1) {
            UITextField *textfield = [alertView textFieldAtIndex:0];

            self.playerTwoName = textfield.text;

//NSLog(@"username: %@", textfield.text);
        }
    }
}
-(void)runTimer
{
    //NSLog(@"hello");
    self.labelInt -=1;




    self.timerLabel.text = [NSString stringWithFormat:@"%i", self.labelInt];

    if (self.labelInt == 0){
        [self.timer invalidate];
        self.timer = nil;

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TIME ENDED!"
                                                        message:@"YOU LOSE! - PLAY AGAIN"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}
-(void)checkForWinner{

    for (int i = 0; i<self.combinationsforwinning.count; i++) {

        NSArray *innerArray = self.combinationsforwinning[i];

        for (int j = 0; j<innerArray.count; j++) {

            // NSArray *k = innerArray[j]; //[innerArray[j] intValue];

            NSNumber *someNumber = innerArray[j];

            //convert the number to an in

            [someNumber intValue];

            if (self.gameState[[innerArray[0] intValue]] == self.gameState[[innerArray[1] intValue]] && self.gameState[[innerArray[0] intValue]] == self.gameState[[innerArray[2] intValue]]  && self.gameState[[innerArray[0] intValue]] != 0){


                self.winner = [self.gameState[[innerArray[0] intValue]] intValue];
                

            }

        }


        if (self.winner != 0){

            if (self.winner == 1) {

                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WINNER!!"
                                                                message: [NSString stringWithFormat:@"%@ Wins", self.playerOneName]
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show]; //we want to show the alert to the user.

                //we also need to reset the game so the player can play again.

                [self resetGame];

            }else if(self.winner == 2){

                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WINNER!!"
                                                                message:[NSString stringWithFormat:@"%@ Wins", self.playerTwoName]
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];

                [self resetGame];
            }
            NSLog(@"We have a winner");

        }
    }


}
-(void)setTimer{

    self.labelInt = 20; //sets the time to play



    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];

    self.timerLabel.text = [NSString stringWithFormat:@"%i", self.labelInt];
    //NSLog(@"%@", self.timer);



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

        if ([self.labelFour.text isEqual:@"O"]){
            self.labelFour.text = @"X";
        } else{
            self.labelFour.text = @"O";
        }

        NSLog(@"Label four tapped");
    } else if (CGRectContainsPoint(self.labelFive.frame, point)){
        if ([self.labelFive.text isEqual:@"O"]){
            self.labelFive.text = @"X";
        } else{
            self.labelFive.text = @"O";
        }
        NSLog(@"Label five tapped");
    } else if (CGRectContainsPoint(self.labelSix.frame, point)){
        if ([self.labelSix.text isEqual:@"O"]){
            self.labelSix.text = @"X";
        } else{
            self.labelSix.text = @"O";
        }

        NSLog(@"Label six tapped");
    }else if (CGRectContainsPoint(self.labelSeven.frame, point)){
        if ([self.labelSeven.text isEqual:@"O"]){
            self.labelSeven.text = @"X";
        } else{
            self.labelSeven.text = @"O";
        }
        NSLog(@"Label seven tapped");
    } else if (CGRectContainsPoint(self.labelEight.frame, point)){
        if ([self.labelEight.text isEqual:@"O"]){
            self.labelEight.text = @"X";
        } else{
            self.labelEight.text = @"O";
        }
        NSLog(@"Label eight tapped");
    } else if (CGRectContainsPoint(self.labelNine.frame, point)){
        if ([self.labelNine.text isEqual:@"O"]){
            self.labelNine.text = @"X";
        } else{
            self.labelNine.text = @"O";
        }
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

    //[self checkForWinner];
}

- (IBAction)playAgainButtonTapped:(id)sender {

    [self resetGame];



}
-(void)resetGame{

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
                 self.labelchanged = true;
            self.whichPlayerLabel.text = @"O";


                //to add to this array need to convert int to an NSNumber Object.
                self.gameState[i] = @(1);

                if (self.labelchanged == true) {
                      [self checkForWinner];
                }


            } else if ([self.whichPlayerLabel.text isEqualToString:@"O"] && [self.gameState[i] intValue] == 0){
                someLabel.text = @"O";
                self.labelchanged = true;
                self.whichPlayerLabel.text = @"X";

                if (self.labelchanged == true) {
                    [self checkForWinner];
                }

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


        }



@end
