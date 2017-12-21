//
//  TeleScope.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-25.
//
//

#import "TeleScope.h"
#import <OpenGLES/EAGL.h>

@implementation TeleScope

+ (id)node
{
    CCSprite *sel = [super node];
    if (sel) {
        [sel setTextureRect:CGRectMake(0, 0, 60, 60)];
        [sel setColor:ccc3(0, 0, 0)];
    }
    return sel;
}

- (void)draw
{
    CGSize s = [[CCDirector sharedDirector] winSize];
    ccDrawLine( ccp(30, -10), ccp(30, 70) );
    ccDrawLine( ccp(-10, 30), ccp(70, 30) );
    glColor4ub(0, 255, 0, 255);
    ccDrawCircle( ccp(30,  30), 30, 0, 10, NO);
    ccDrawCircle( ccp(30, 30), 20, CC_DEGREES_TO_RADIANS(90), 50, YES);
}

@end
