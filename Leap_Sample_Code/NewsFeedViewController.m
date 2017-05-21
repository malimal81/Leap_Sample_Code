//
//  NewsFeedViewController.m
//  Leap_Sample_Code
//
//  Created by Jamal Jones on 5/20/17.
//  Copyright © 2017 Jamal Jones. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "NewsFeedCell.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController

{
    NSMutableArray *tableData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    tableData = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Fried Rice", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
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
    
    cell.titleLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = @"Description of Article";
    
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
        [tableData removeObjectAtIndex:indexPath.row];
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
    NSString *objectToMove = tableData[sourceIndexPath.row];
    [tableData removeObjectAtIndex:sourceIndexPath.row];
    [tableData insertObject:objectToMove atIndex:destinationIndexPath.row];
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
