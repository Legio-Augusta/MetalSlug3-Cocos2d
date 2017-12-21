//
//  Enemy.m
//  SpecalTask
//
//  Created by Xing Yan on 12-11-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

@synthesize isActive;
+ (Enemy*)node
{
    Enemy *node = [[[self alloc] initWithFile:@"Image 138 at frame 10.png"] autorelease];
    return node;
}

- (id)initWithFile:(NSString *)filename
{
    self = [super initWithFile:filename];
    if(self)
    {
        [self setScale:IOSSCALE];
        [self setIsActive:NO];
    }
    return self;
}


- (void)active
{
    if (self.isActive) {
        return;
    }
    [self setIsActive:YES];
    if (self.type == 0) {
        CCSpriteFrame *stillf1 = [CCSpriteFrame frameWithTextureFilename:@"Image 138 at frame 10.png" rect:CGRectMake(0, 0, 23.5, 36)];
        CCSpriteFrame *stillf2 = [CCSpriteFrame frameWithTextureFilename:@"Image 139 at frame 10.png" rect:CGRectMake(0, 0, 24, 35.5)];
        id stillAnimation = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:stillf1, stillf2, nil] delay:0.2];
        stillPositionAction = [CCRepeatForever actionWithAction:
                               [CCAnimate actionWithAnimation:stillAnimation restoreOriginalFrame:NO]];
        [self runAction:stillPositionAction];
    }
    [self schedule:@selector(checkUpdate) interval:1./20.];
}

- (BOOL)beenAttack:(int)type
{
    if (!self.isActive)
        return false;
    if(self.type < 4)
        [self runDeadAnimation];
    return false;
}

- (void)runDeadAnimation
{
    CCSpriteFrame *f1 = [CCSpriteFrame frameWithTextureFilename:@"Image 231 at frame 10.png" rect:CGRectMake(0, 0, 35.5, 35)];
    CCSpriteFrame *f2 = [CCSpriteFrame frameWithTextureFilename:@"Image 232 at frame 10.png" rect:CGRectMake(0, 0, 35.5, 35)];
    CCSpriteFrame *f3 = [CCSpriteFrame frameWithTextureFilename:@"Image 233 at frame 10.png" rect:CGRectMake(0, 0, 35.5, 35)];
    CCSpriteFrame *f4 = [CCSpriteFrame frameWithTextureFilename:@"Image 234 at frame 10.png" rect:CGRectMake(0, 0, 35.5, 35)];
    CCSpriteFrame *f5 = [CCSpriteFrame frameWithTextureFilename:@"Image 235 at frame 10.png" rect:CGRectMake(0, 0, 35.5, 35)];
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:f1, f2, f3, f4, f5, nil] delay:0.2];
    CCAnimate *animate = [CCAnimate actionWithAnimation:animation];
    [self runAction:animate];
}

- (void)checkUpdate
{
    
    if (! self.isFiring) {
        
    }
}

- (void)fire
{
    self.isFiring = YES;
}

@end
