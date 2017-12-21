//
//  Hero.h
//  SpecalTask
//
//  Created by Xing Yan on 12-10-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Hero : CCSprite  {
    CCSprite *head, *leg, *hand;
    
    CCSpriteFrame *frameShouqiang1, *frameShouqiang2, *frameShouqiang3;
    CCSpriteFrame *frameleed1, *frameleed2, *frameleed3, *frameleed4, *frameleed5,
        *l1,*l2,*l3,*l4,*l5,*l6,*l7,*l8,*l9,*l10,//run
        *j1, *j2, *j3, *j4, *j5,//jump
        *sit1, *sit2, *sit3, *sit4, *sit5, *sit6,// sitdown run
        *f1, *f2, *f3
    ;
    CCAnimation *sqIdelAnimation1, *sqIdelAnimation2, *sqIdelAnimation3, *sqIdelAnimation4, *sqIdelAnimationFireSmall;
    CCRepeatForever *sqIdelAction1, *sqIdelActionRun, *sqIdelAction3, *sqIdelAction4, *sqIdelActionFireSmall;
    NSArray *frameLeed;
    BOOL isRun;
    BOOL isJump;
}

+ (Hero *)getInstance;

- (Hero*) init;

- (void)jumpDownFromTruck;

- (void)selfJumpDone;

- (void)run;
- (void)stop;
- (void)jump:(float*)ground_plane;
- (void)fire;

- (BOOL)isJumping;
@end
