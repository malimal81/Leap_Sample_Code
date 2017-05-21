//
//  NewsFeedCell.h
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/20/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
