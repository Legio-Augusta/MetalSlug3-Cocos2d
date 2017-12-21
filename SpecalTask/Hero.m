//
//  Hero.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Hero.h"


@implementation Hero

static Hero* instance;
+ (Hero *)getInstance
{
    if (instance == nil)
    {
        instance = [[self alloc]init];
    }
    return instance;
}

- (Hero *)init
{
    self = [super init];
    if (self) {
        //[self setTextureRect:CGRectMake(0, 0, 308, 185)];
        head = [CCSprite spriteWithFile:@"Image 577 at frame 10.png"];
        [head setPosition:CGPointMake(0, 7)];
        leg = [CCSprite spriteWithFile:@"Image 523 at frame 10.png"];
        [leg setPosition:CGPointMake(3, -7)];
        [self addChild:leg];
        [self addChild:head];
        frameShouqiang1 = [CCSpriteFrame frameWithTextureFilename:@"Image 544 at frame 10.png" rect:CGRectMake(0, 0, 30.5, 30)];
        frameShouqiang2 = [CCSpriteFrame frameWithTextureFilename:@"Image 545 at frame 10.png" rect:CGRectMake(0, 0, 31, 29)];
        frameShouqiang3 = [CCSpriteFrame frameWithTextureFilename:@"Image 546 at frame 10.png" rect:CGRectMake(0, 0, 31, 28)];
        sqIdelAnimation1 = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:frameShouqiang1, frameShouqiang2, frameShouqiang3, nil] delay:0.2];
        sqIdelAction1 = [CCRepeatForever actionWithAction:
                             [CCAnimate actionWithAnimation:sqIdelAnimation1 restoreOriginalFrame:NO]];
        [head runAction:sqIdelAction1];
        
        
        l1 = [CCSpriteFrame frameWithTextureFilename:@"Image 523 at frame 10.png" rect:CGRectMake(0, 0, 16.5, 16)];
        l2 = [CCSpriteFrame frameWithTextureFilename:@"Image 524 at frame 10.png" rect:CGRectMake(0, 0, 12.5, 16.5)];
        l3 = [CCSpriteFrame frameWithTextureFilename:@"Image 525 at frame 10.png" rect:CGRectMake(0, 0, 26.5, 20)];
        l4 = [CCSpriteFrame frameWithTextureFilename:@"Image 526 at frame 10.png" rect:CGRectMake(0, 0, 30.5, 16.5)];
        l5 = [CCSpriteFrame frameWithTextureFilename:@"Image 527 at frame 10.png" rect:CGRectMake(0, 0, 21, 18)];
        l6 = [CCSpriteFrame frameWithTextureFilename:@"Image 528 at frame 10.png" rect:CGRectMake(0, 0, 15.5, 17)];
        l7 = [CCSpriteFrame frameWithTextureFilename:@"Image 529 at frame 10.png" rect:CGRectMake(0, 0, 12.5, 16.5)];
        l8 = [CCSpriteFrame frameWithTextureFilename:@"Image 530 at frame 10.png" rect:CGRectMake(0, 0, 25.5, 18)];
        l9 = [CCSpriteFrame frameWithTextureFilename:@"Image 531 at frame 10.png" rect:CGRectMake(0, 0, 32.5, 16.5)];
        l10 = [CCSpriteFrame frameWithTextureFilename:@"Image 532 at frame 10.png" rect:CGRectMake(0, 0, 21.5, 18.5)];
        
        sqIdelAnimation2 = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:l1, l2, l3, l4, l1,/*l5, l6, l7, l8, l9, l10,*/ nil] delay:0.05];
        sqIdelActionRun = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:sqIdelAnimation2 restoreOriginalFrame:NO]];
        [leg runAction:sqIdelActionRun];
        [sqIdelActionRun stop];
        
        
        
        j1 = [CCSpriteFrame frameWithTextureFilename:@"Image 539 at frame 10.png" rect:CGRectMake(0, 0, 19, 22.5)];
        j2 = [CCSpriteFrame frameWithTextureFilename:@"Image 540 at frame 10.png" rect:CGRectMake(0, 0, 19.3, 22)];
        j3 = [CCSpriteFrame frameWithTextureFilename:@"Image 541 at frame 10.png" rect:CGRectMake(0, 0, 20.5, 22)];
        j4 = [CCSpriteFrame frameWithTextureFilename:@"Image 542 at frame 10.png" rect:CGRectMake(0, 0, 22, 19.5)];
        j5 = [CCSpriteFrame frameWithTextureFilename:@"Image 543 at frame 10.png" rect:CGRectMake(0, 0, 21.5, 20)];
        
        sit1 = [CCSpriteFrame frameWithTextureFilename:@"Image 533 at frame 10.png" rect:CGRectMake(0, 0, 17, 16.5)];
        sit2 = [CCSpriteFrame frameWithTextureFilename:@"Image 534 at frame 10.png" rect:CGRectMake(0, 0, 17.5, 16.5)];
        sit3 = [CCSpriteFrame frameWithTextureFilename:@"Image 535 at frame 10.png" rect:CGRectMake(0, 0, 17, 16.5)];
        sit4 = [CCSpriteFrame frameWithTextureFilename:@"Image 536 at frame 10.png" rect:CGRectMake(0, 0, 17.5, 17)];
        sit5 = [CCSpriteFrame frameWithTextureFilename:@"Image 537 at frame 10.png" rect:CGRectMake(0, 0, 17, 16.5)];
        sit6 = [CCSpriteFrame frameWithTextureFilename:@"Image 538 at frame 10.png" rect:CGRectMake(0, 0, 19, 16.5)];
        
        f1 = [CCSpriteFrame frameWithTextureFilename:@"Image 635 at frame 10.png" rect:CGRectMake(0, 0, 43, 26)];
        f2 = [CCSpriteFrame frameWithTextureFilename:@"Image 637 at frame 10.png" rect:CGRectMake(0, 0, 43, 25)];
        f2 = [CCSpriteFrame frameWithTextureFilename:@"Image 638 at frame 10.png" rect:CGRectMake(0, 0, 40.5, 27)];
        
        sqIdelAnimation3 = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:j1, j2, j3, j4, j5, l1,/*l6, l7, l8, l9, l10,*/ nil] delay:0.1];
        sqIdelAction3 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:sqIdelAnimation3 restoreOriginalFrame:NO]];
        
        sqIdelAnimation4 = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:sit1, sit2, sit3, sit4, sit5, sit6, l1,/*l6, l7, l8, l9, l10,*/ nil] delay:0.05];
        sqIdelAction4 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:sqIdelAnimation3 restoreOriginalFrame:NO]];
        [leg runAction:sqIdelAction3];
        [sqIdelAction3 stop];
        
        
        sqIdelAnimationFireSmall = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:f1, f2, f3, frameShouqiang1, nil] delay:0.1];
        sqIdelActionFireSmall = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:sqIdelAnimationFireSmall restoreOriginalFrame:NO]];
        //[sqIdelAction1 stop];
        [head runAction:sqIdelActionFireSmall];
        [sqIdelActionFireSmall stop];
    }
    return self;
}


- (void)jumpDownFromTruck;
{
    [self stopAllActions];
    [self setScaleX:-IOSSCALE];
}

- (void) setOpacity:(GLubyte)opacity
{
    [head setOpacity:opacity];
    [leg setOpacity:opacity];
    [super setOpacity:opacity];
}

- (void)run
{
    if (!isJump && !isRun) {
        isRun = YES;
        @synchronized(leg)
        {
            [sqIdelActionRun startWithTarget:leg];
        }
    }
}

- (void)stop
{
    if (!isJump && isRun) {
        isRun = NO;
        @synchronized(leg)
        {
            [sqIdelActionRun stop];
        }
    }
}


- (void)jump:(float*)ground_plane
{
    if (!isJump)
    {
        @synchronized(leg)
        {
            if (isRun) {
                isRun = NO;
                [sqIdelActionRun stop];
            }
            [sqIdelAction3 startWithTarget:leg];
            [sqIdelAction3 stop];
            isJump = YES;
            CGPoint sp = self.parent.position;
            CGPoint p = self.position;
            float offx = self.scaleX/1.5*-85;
            if (p.x+sp.x+offx<15) {
                offx = 15-(p.x+sp.x);
            }
            CCJumpY *jump = [CCJumpY actionWithDuration:0.7 position:ccp(0, 0) height:80 jumps:1 ground_plane:ground_plane];
            CCCallFunc *func = [CCCallFunc actionWithTarget:self selector:@selector(selfJumpDone)];
            [self runAction:[CCSequence actions:jump, func, nil]];
        }
    }
}
- (void)selfJumpDone
{
    isJump = NO;
}


- (void)fire
{
    @synchronized(head)
    {
        //[head stopAllActions];
        [sqIdelActionFireSmall startWithTarget:head];
        [sqIdelActionFireSmall stop];
    }
}

- (BOOL)isJumping
{
    return isJump;
}
@end
