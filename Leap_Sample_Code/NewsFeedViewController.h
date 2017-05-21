//
//  NewsFeedViewController.h
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/20/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end
