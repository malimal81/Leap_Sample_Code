//
//  NewsDataManager.h
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDataManager : NSObject {
    NSMutableArray *_newsItems;
}

-(NSMutableArray*)newsItems;

-(void)loadData:(NSString *)URL completion:(void (^)(void))completionBlock;

-(void)setNewsItems:(NSMutableArray*)newsItems;


@end
