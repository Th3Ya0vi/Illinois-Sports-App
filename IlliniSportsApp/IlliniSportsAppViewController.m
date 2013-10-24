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
    
    
    /* Manual inserting elements into each array. This is replaced by downloading info into a formatted plist file, which is then used to insert appropriate data into the appropriate array
     
    // Initialize homeTeams, need to retrieve data from Online
    homeTeam = [NSArray arrayWithObjects:@"Illini", @"Michigan", @"Illini", @"Illini", @"Rochester", @"NorthWestern", @"Michigan", @"Illini", nil];

    // Initialize awayTeam, also need to get data online
    awayTeam = [NSArray arrayWithObjects:@"Rochester", @"Illini", @"Michigan", @"NorthWestern", @"Illini", @"Illini", @"Illini", @"NorthWestern", nil];
    
    // Initialize teamThumbnails, need to retrieve this data from the awayTeam and homeTeam
    awayTeamThumbnails = [NSArray arrayWithObjects:@"rochester.gif", @"Illinois.jpg", @"michigan.jpg", @"wildcats.jpg", @"Illinois.jpg", @"Illinois.jpg", @"Illinois.jpg", @"wildcats.jpg", nil];
    homeTeamThumbnails = [NSArray arrayWithObjects:@"Illinois.jpg", @"michigan.jpg", @"Illinois.jpg", @"Illinois.jpg", @"rochester.gif", @"wildcats.jpg", @"michigan.jpg", @"Illinois.jpg", nil];
     */
    
    // Find out the path of GameInfo.plist
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

// Find out how many rows to create in Interface. Based on number of HomeTeams
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [homeTeam count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Follow the formatting of the custom cells in the IlliniSportsAppsCell
    static NSString *IlliniSportsAppIdentifier = @"IlliniSportsAppCell";
    
    IlliniSportsAppCell *cell = (IlliniSportsAppCell *)[tableView dequeueReusableCellWithIdentifier:IlliniSportsAppIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IlliniSportsAppCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Load the appropriate UI Elements with the appropriate name/picture from the arrays
    cell.homeTeamLabel.text = [homeTeam objectAtIndex:indexPath.row];
    cell.awayTeamLabel.text = [awayTeam objectAtIndex:indexPath.row];
    cell.homeTeamThumbnailView.image = [UIImage imageNamed:[homeTeamThumbnails objectAtIndex:indexPath.row]];
    cell.awayTeamThumbnailView.image = [UIImage imageNamed:[awayTeamThumbnails objectAtIndex:indexPath.row]];
    cell.versusThumbnailView.image = [UIImage imageNamed:@"Versus.png"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    
    // String variable to concatenate data and format it for output
    NSString *gameTeams = [NSString stringWithFormat:@"%@%@%@", [awayTeam objectAtIndex:indexPath.row], @" vs ",[homeTeam objectAtIndex:indexPath.row]];
    
    // The format of the alert that will pop up when a cell is tapped
    // All output information is only a temporary stand-in, will be replaced later on. => Will need to establish a different format based on whether a game is finished or not.
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Insert Date" message:gameTeams delegate:nil cancelButtonTitle:@"ILL-I-N-I" otherButtonTitles:nil];
    
    // Display the alert formatted above
    [messageAlert show];
    
    /*
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     */
}

// Establish the height of each cell inside the UI
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

@end
