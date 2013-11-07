//
//  Schedule.h
//  Stuff
//
//  Created by Osayd Abdu on 11/2/13.
//  Copyright (c) 2013 Osayd Abdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

@property (nonatomic, strong) NSString *stadium;
@property (nonatomic, strong) NSString *team;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *result;

@property (nonatomic) BOOL isHome;
-(Schedule*) init;
+(Schedule *) getInfoOfGame;
@end
