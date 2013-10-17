//
//  IlliniSportsAppViewController.m
//  IlliniSportsApp
//
//  Created by Matthew Liu on 10/17/13.
//  Copyright (c) 2013 Matthew Liu. All rights reserved.
//

#import "IlliniSportsAppViewController.h"
#import "IlliniSportsAppCell.h"

@interface IlliniSportsAppViewController ()

@end

//Random comment

@implementation IlliniSportsAppViewController
{
    NSArray *homeTeam;
    NSArray *awayTeam;
    NSArray *awayTeamThumbnails;
    NSArray *homeTeamThumbnails;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    // Initialize homeTeams, need to retrieve data from Online
    homeTeam = [NSArray arrayWithObjects:@"Illini", @"Michigan", @"Illini", @"Illini", @"Rochester", @"NorthWestern", @"Michigan", @"Illini", nil];
    
    // Initialize awayTeam, also need to get data online
    awayTeam = [NSArray arrayWithObjects:@"Rochester", @"Illini", @"Michigan", @"NorthWestern", @"Illini", @"Illini", @"Illini", @"NorthWestern", nil];
    
    // Initialize teamThumbnails, need to retrieve this data from the awayTeam and homeTeam
    awayTeamThumbnails = [NSArray arrayWithObjects:@"rochester.gif", @"Illinois.jpg", @"michigan.jpg", @"wildcats.jpg", @"Illinois.jpg", @"Illinois.jpg", @"Illinois.jpg", @"wildcats.jpg", nil];
    homeTeamThumbnails = [NSArray arrayWithObjects:@"Illinois.jpg", @"michigan.jpg", @"Illinois.jpg", @"Illinois.jpg", @"rochester.gif", @"wildcats.jpg", @"michigan.jpg", @"Illinois.jpg", nil];
     */
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GameInfo" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    homeTeam = [dict objectForKey:@"homeTeam"];
    awayTeam = [dict objectForKey:@"awayTeam"];
    homeTeamThumbnails = [dict objectForKey:@"homeTeamThumbnails"];
    awayTeamThumbnails = [dict objectForKey:@"awayTeamThumbnails"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [homeTeam count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IlliniSportsAppIdentifier = @"IlliniSportsAppCell";
    
    IlliniSportsAppCell *cell = (IlliniSportsAppCell *)[tableView dequeueReusableCellWithIdentifier:IlliniSportsAppIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IlliniSportsAppCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.homeTeamLabel.text = [homeTeam objectAtIndex:indexPath.row];
    cell.awayTeamLabel.text = [awayTeam objectAtIndex:indexPath.row];
    cell.homeTeamThumbnailView.image = [UIImage imageNamed:[homeTeamThumbnails objectAtIndex:indexPath.row]];
    cell.awayTeamThumbnailView.image = [UIImage imageNamed:[awayTeamThumbnails objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Insert Date" message:@"Away vs. Home\n Score: ?\n Quarter: ?" delegate:nil cancelButtonTitle:@"Go Illini!" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [messageAlert show];
    
    /*
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

@end
