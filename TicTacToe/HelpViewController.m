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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
  [self performLoadRequestWithString:@"http://www.en.wikipedia.org/wiki/Tic-tac-toe"];
     self.activityIndicator.hidesWhenStopped = true;
    
}
-(void) performLoadRequestWithString:(NSString *) string{
    NSURL *url = [NSURL URLWithString:string];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];

}

#pragma mark -UIWebViewDelegate Protocols
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
[self.activityIndicator stopAnimating];
    
}

@end
