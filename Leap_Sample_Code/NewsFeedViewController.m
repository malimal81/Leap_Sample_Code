//
//  NewsFeedViewController.m
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/20/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "NewsFeedCell.h"
#import "NewsItem.h"
#import "NewsDataManager.h"
#import "NewsDetailViewController.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NewsDataManager *ndm = [[NewsDataManager alloc] init];
    _newsDataManager = ndm;
    
    [_newsDataManager loadData:@"https://newsapi.org/v1/articles?source=techcrunch&apiKey=75072ae76c2941e4ad6d01a32ff210b5" completion:^{
        //
        [self.tableView reloadData];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _newsDataManager.newsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"NewsFeedCell";
    
    NewsFeedCell *cell = (NewsFeedCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewsFeedCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    [cell.descriptionLabel sizeToFit];
    
    NewsItem *item = [_newsDataManager.newsItems objectAtIndex:indexPath.row];
    
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: item.imageUrl]];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cell.thumbnailImageView.image = [UIImage imageWithData:data];
        });
    });
    
    cell.titleLabel.text = item.articleTitle;
    cell.descriptionLabel.text = item.description;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Do whatever data deletion you need to do...
        [_newsDataManager.newsItems removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
    [tableView endUpdates];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *objectToMove = _newsDataManager.newsItems[sourceIndexPath.row];
    [_newsDataManager.newsItems removeObjectAtIndex:sourceIndexPath.row];
    [_newsDataManager.newsItems insertObject:objectToMove atIndex:destinationIndexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsItem *item = [_newsDataManager.newsItems objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"detail" sender:item.articleUrl];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    NewsDetailViewController *detailView = (NewsDetailViewController*)segue.destinationViewController;
    
    NSString *url = (NSString*)sender;
    NSLog(@"URL: %@", url);
    detailView.articleUrl = url;
    
}


- (IBAction)beginEditing:(id)sender {
    
    if (self.tableView.editing) {
        self.editButton.title = @"Edit";
        self.tableView.editing = NO;
    } else {
        self.editButton.title = @"Cancel";
        self.tableView.editing = YES;
    }
    
}


@end
