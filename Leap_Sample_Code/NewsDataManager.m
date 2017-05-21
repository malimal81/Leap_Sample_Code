//
//  NewsDataManager.m
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/21/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import "NewsDataManager.h"
#import "NewsItem.h"

@implementation NewsDataManager

-(NSMutableArray*)newsItems {
    return _newsItems;
}

-(void)setNewsItems:(NSMutableArray*)newsItems {
    _newsItems = newsItems;
}


-(void)loadData:(NSString *)URL completion:(void (^)(void))completionBlock {
    
    NSMutableArray *news = [[NSMutableArray alloc] init];
    _newsItems = news;
    
    NSURL *url = [NSURL URLWithString:URL];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSError *error = nil;
    
    
    if (!error) {
        
        NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                if (httpResp.statusCode == 200) {
                    
                    NSDictionary *json = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:kNilOptions
                                          error:&error];
                    NSDictionary *jsonDict = [json objectForKey:@"articles"];
                    
                    for (NSDictionary *dataDict in jsonDict) {
                        NSString *desc = [dataDict objectForKey:@"description"];
                        NSString *title = [dataDict objectForKey:@"title"];
                        NSString *url = [dataDict objectForKey:@"url"];
                        NSString *image = [dataDict objectForKey:@"urlToImage"];
                        
                        NewsItem *newsItem = [[NewsItem alloc] init];
                        
                        newsItem.articleTitle = title;
                        newsItem.description = desc;
                        newsItem.articleUrl = url;
                        newsItem.imageUrl = image;

                        [_newsItems addObject:newsItem];
                    }
                    
                    completionBlock();
                }
                
            }
            
            
        }];
        
        
        [downloadTask resume];
        
    }
}

@end
