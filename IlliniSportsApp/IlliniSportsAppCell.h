//
//  IlliniSportsAppCell.h
//  IlliniSportsApp
//
//  Created by Matthew Liu on 10/17/13.
//  Copyright (c) 2013 Matthew Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IlliniSportsAppCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *homeTeamLabel;
@property (nonatomic, weak) IBOutlet UILabel *awayTeamLabel;
@property (nonatomic, weak) IBOutlet UIImageView *homeTeamThumbnailView;
@property (nonatomic, weak) IBOutlet UIImageView *awayTeamThumbnailView;

@end
