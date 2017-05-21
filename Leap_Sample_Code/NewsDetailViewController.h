//
//  NewsDetailViewController.h
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController {
    NSString *_articleUrl;
}

- (void)setArticleUrl:(NSString*)articleUrl;

- (NSString*)articleUrl;

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end
