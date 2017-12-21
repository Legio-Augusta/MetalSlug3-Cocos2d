//
//  Tank.m
//  SpecalTask
//
//  Created by Xing Yan on 12-11-4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Tank.h"


@implementation Tank

+ (Tank*)node
{
    Tank *node = [[[self alloc]init]autorelease];
    return node;
}

- (id)init
{
    self = [super init];
    s1 = [CCSprite spriteWithFile:@"Image 320 at frame 10.png"];
    s2 = [CCSprite spriteWithFile:@"Image 321 at frame 10.png"];
    s4 = [CCSprite spriteWithFile:@"Image 323 at frame 10.png"];
    [s1 setPosition:ccp(0, -10)];
    [s2 setPosition:ccp(0, 0)];
    [s4 setPosition:ccp(-15, 18)];
    [s5 setPosition:ccp(3, 32)];
    [self addChild:s1];
    [self addChild:s2];
    [self addChild:s4];
    [self setScale:IOSSCALE];
    return self;
}

- (void)active
{
    if (self.isActive) {
        return;
    }
    [self setIsActive:YES];
    if (self.type == 0) {
        bf1 = [CCSpriteFrame frameWithTextureFilename:@"Image 904 at frame 10.png" rect:CGRectMake(0, 0, 46, 21)];
        bf2 = [CCSpriteFrame frameWithTextureFilename:@"Image 905 at frame 10.png" rect:CGRectMake(0, 0, 46, 22)];
        [self schedule:@selector(TankFire) interval:2];
    }
}

- (BOOL)beenAttack:(int)type
{
    return YES;
}

- (BOOL)TankFire
{
    CCLOG(@"开炮");
    CCSprite *bullet = [CCSprite spriteWithFile:@"Image 904 at frame 10.png"];
    CCLayer *layer = [self.parent.parent getChildByTag:2];
    CGPoint hp = self.position;
    CGPoint sp = self.parent.position;
    CGPoint position = CGPointMake(hp.x + sp.x - 80, hp.y + sp.y+25);
    [bullet setPosition:position];
    [layer addChild:bullet z:2];
    [bullet setTag:851137];
    [bullet runAction:[CCMoveBy actionWithDuration:1.5 position:CGPointMake(-400, 0)]];
}

@end
