//
//  NewsItem.m
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

- (void)setArticleTitle:(NSString*)articleTitle {
    _articleTitle = articleTitle;
}
- (void)setDescription:(NSString*)description {
    _description = description;
}
- (void)setArticleUrl:(NSString*)articleUrl {
    _articleUrl = articleUrl;
}
- (void)setImageUrl:(NSString*)imageUrl {
    _imageUrl = imageUrl;
}
- (void)setImage:(UIImage*)image {
    _image = image;
}

- (NSString*)articleTitle {
    return _articleTitle;
}
- (NSString*)description {
    return _description;
}
- (NSString*)articleUrl {
    return _articleUrl;
}
- (NSString*)imageUrl {
    return _imageUrl;
}
- (UIImage*)image {
    return _image;
}


@end
