//
//  Truck.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Truck.h"


@implementation Truck

- (Truck*) init
{
    self = [super init];
    if (self) {
        //[self setTextureRect:CGRectMake(0, 0, 308, 185)];
        caster1 = [CCSprite spriteWithFile:@"Image 906 at frame 10.png"];
        [caster1 setPosition:CGPointMake(50, -38)];
        caster2 = [CCSprite spriteWithFile:@"Image 906 at frame 10.png"];
        [caster2 setPosition:CGPointMake(-63, -38)];
        //窗帘
        CCSpriteFrame *fc1 = [CCSpriteFrame frameWithTextureFilename:@"Image 911 at frame 10.png" rect:CGRectMake(0, 0, 27, 35)];
        CCSpriteFrame *fc2 = [CCSpriteFrame frameWithTextureFilename:@"Image 912 at frame 10.png" rect:CGRectMake(0, 0, 27, 35)];
        CCSpriteFrame *fc3 = [CCSpriteFrame frameWithTextureFilename:@"Image 913 at frame 10.png" rect:CGRectMake(0, 0, 27, 35)];
        id curtainanimation = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:fc1, fc2, fc3, nil] delay:0.2];
        id curtainaction1 = [CCRepeatForever actionWithAction:
                             [CCAnimate actionWithAnimation:curtainanimation restoreOriginalFrame:NO]];
        id curtainaction2 = [CCRepeatForever actionWithAction:
                             [CCAnimate actionWithAnimation:curtainanimation restoreOriginalFrame:NO]];
        id curtainaction3 = [CCRepeatForever actionWithAction:
                             [CCAnimate actionWithAnimation:curtainanimation restoreOriginalFrame:NO]];
        curtain1 = [CCSprite spriteWithSpriteFrame:fc1];
        curtain2 = [CCSprite spriteWithSpriteFrame:fc1];
        curtain3 = [CCSprite spriteWithSpriteFrame:fc1];
        [curtain1 setPosition:CGPointMake(-10, -5)];
        [curtain2 setPosition:CGPointMake(-40, -5)];
        [curtain3 setPosition:CGPointMake(-70, -5)];
        head = [CCSprite spriteWithFile:@"Image 907 at frame 10.png"];
        body = [CCSprite spriteWithFile:@"Image 915 at frame 10.png"];
        [body setPosition:CGPointMake(-8, 5)];
        door = [CCSprite spriteWithFile:@"Image 908 at frame 10.png"];
        [door setPosition:CGPointMake(25, -5)];
        light = [CCSprite spriteWithFile:@"Image 909 at frame 10.png"];
        [light setPosition:CGPointMake(75, -30)];
        //CCSprite *door, *body, *head, *light;
        
        
        [self addChild:caster1];
        [self addChild:caster2];
        [self addChild:head];
        [self addChild:curtain1];
        [curtain1 runAction:curtainaction1];
        [self addChild:curtain2];
        [curtain2 runAction:curtainaction2];
        [self addChild:curtain3];
        [curtain3 runAction:curtainaction3];
        [self addChild:body];
        [self addChild:door];
        [self addChild:light];
    }
    return self;
}

- (void)stopAllActions
{
    [super stopAllActions];
    [curtain1 stopAllActions];
    [curtain2 stopAllActions];
    [curtain3 stopAllActions];
}

- (void)dealloc
{
    [caster1 removeFromParentAndCleanup:YES];
    [caster2 removeFromParentAndCleanup:YES];
    [curtain1 removeFromParentAndCleanup:YES];
    [curtain2 removeFromParentAndCleanup:YES];
    [curtain3 removeFromParentAndCleanup:YES];
    [door removeFromParentAndCleanup:YES];
    [body removeFromParentAndCleanup:YES];
    [head removeFromParentAndCleanup:YES];
    [light removeFromParentAndCleanup:YES];
    [super dealloc];
}
@end
