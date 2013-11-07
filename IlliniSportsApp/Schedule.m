//
//  Schedule.m
//  Stuff
//
//  Created by Osayd Abdu on 11/2/13.
//  Copyright (c) 2013 Osayd Abdu. All rights reserved.
//

#import "Schedule.h"



@implementation Schedule
{
    NSArray *games;
   
}
@synthesize team=_team;
@synthesize stadium=_stadium;
@synthesize date=_date;
@synthesize result=_result;
@synthesize isHome=_isHome;

-(void) setTeam:(NSString*) aTeam{
    if(aTeam==nil)
        return;
    NSRange range=[aTeam rangeOfString:@"vs. "];
    NSRange range2=[aTeam rangeOfString:@"at "];
    range.length=[aTeam length];
    range2.length=[aTeam length];
    NSRange deletionRange=[aTeam rangeOfString:@"("];
    NSRange deletionRange2=[aTeam rangeOfString:@"*"];
   
    if(deletionRange2.location!=NSNotFound){
        range.length=deletionRange2.location;
        range2.length=deletionRange2.location;
    }
    if(deletionRange.location!=NSNotFound){
        range.length=deletionRange.location;
        range2.length=deletionRange.location;
    }
    if(range.location !=NSNotFound){
        range.location+=4;
        range.length-=4;
        _team=[aTeam substringWithRange:range];
        self.isHome=YES;
        return;
    }
    if(range2.location != NSNotFound){
        range2.location+=3;
        range2.length-=3;
        _team=[aTeam substringWithRange:range2];
        self.isHome=NO;
        return;
        }
     self.isHome=NO;
    _team=aTeam;
}
- (id) init{
    self=[super init];
    if(self){
 
    }
    return self;
}


+ (Schedule *) getInfoOfGame{
    static bool isFinish=false;
    if(isFinish) return nil;
    Schedule *game=[[Schedule alloc] init];
    NSString *urlAsString = @"http://www.fightingillini.com/sports/m-footbl/sched/ill-m-footbl-sched.html";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSString *urlContent= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];

    static NSRange range={0,0};
    NSUInteger urlLength= [urlContent length];

    int count=0;
    while (range.location<urlLength && count<4)
    {
        range.length= urlLength- range.location;
        NSRange preRange= [urlContent rangeOfString:@"\"row-text\"" options:NSCaseInsensitiveSearch range:range];
        if(preRange.location == NSNotFound)
            break;
        NSRange r={preRange.location, preRange.length+100};
        NSRange postRange= [urlContent rangeOfString:@"<" options:NSCaseInsensitiveSearch range:r];
 
        range.location=preRange.location+preRange.length+1;
        range.length=postRange.location-range.location;
 
        NSString *finalResult = [urlContent substringWithRange:range];
    
        switch (count) {
            case 0:
                game.date= finalResult;
                break;
            case 1:
                game.team= finalResult;
                break;
            case 2:
                game.stadium= finalResult;
                break;
            case 3:
                game.result= finalResult;
                break;
            default:
                break;
        }
        count++;
    }
    if(count==0) isFinish=true;
    return game;
}
@end
