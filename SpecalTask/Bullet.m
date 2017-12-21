//
//  Bullet.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

+ (CCSprite*) spriteWithSpriteFrame:(CCSpriteFrame*)frame forward:(BOOL)forward;
{
    CCSprite *sel = [CCSprite spriteWithSpriteFrame:frame];
    if(sel)
    {
        [sel runAction:[CCMoveBy actionWithDuration:0.8 position:CGPointMake(forward?600:-600, 0)]];
    }
    return sel;
}
@end
