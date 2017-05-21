//
//  NewsItem.h
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface NewsItem : NSObject {
    NSString *_articleTitle;
    NSString *_description;
    NSString *_articleUrl;
    NSString *_imageUrl;
    UIImage *_image;
}

- (void)setArticleTitle:(NSString*)articleTitle;
- (void)setDescription:(NSString*)description;
- (void)setArticleUrl:(NSString*)articleUrl;
- (void)setImageUrl:(NSString*)imageUrl;
- (void)setImage:(UIImage*)image;

- (NSString*)articleTitle;
- (NSString*)description;
- (NSString*)articleUrl;
- (NSString*)imageUrl;
- (UIImage*)image;

@end
