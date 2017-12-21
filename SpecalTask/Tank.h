//
//  Tank.h
//  SpecalTask
//
//  Created by Xing Yan on 12-11-4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyBase.h"

@interface Tank : EnemyBase {
    //轮子
    CCSprite *s1, *s2, *s3, *s4, *s5, *s6;
    CCSequence *seqFire;
    CCSpriteFrame *bf1, *bf2;
}
+ (Tank*)node;

- (BOOL)TankFire;
@end