//
//  IlliniSportsAppCell.m
//  IlliniSportsApp
//
//  Created by Matthew Liu on 10/17/13.
//  Copyright (c) 2013 Matthew Liu. All rights reserved.
//

#import "IlliniSportsAppCell.h"

@implementation IlliniSportsAppCell

@synthesize homeTeamLabel = _homeTeamLabel;
@synthesize awayTeamLabel = _awayTeamLabel;
@synthesize homeTeamThumbnailView = _homeTeamThumbnailView;
@synthesize awayTeamThumbnailView = _awayTeamThumbnailView;
@synthesize versusThumbnailView = _versusThumbnailView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
