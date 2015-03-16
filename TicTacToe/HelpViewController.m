//
//  HelpViewController.m
//  TicTacToe
//
//  Created by Jazz Santiago on 3/16/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self performLoadRequestWithString:@"http://www.en.wikipedia.org/wiki/Tic-tac-toe"];
    
}

-(void)performLoadRequestWithString(NSString *)string
{
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{

}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{

}


@end
