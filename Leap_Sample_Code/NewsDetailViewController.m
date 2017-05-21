//
//  NewsDetailViewController.m
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController


- (void)setArticleUrl:(NSString*)articleUrl {
    _articleUrl = articleUrl;
}

- (NSString*)articleUrl {
    return _articleUrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlAddress = _articleUrl;
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];

}

- (IBAction)back:(id)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}


@end
