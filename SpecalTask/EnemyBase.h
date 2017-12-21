//
//  EnemyBase.h
//  SpecalTask
//
//  Created by Xing Yan on 12-11-4.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EnemyBase : CCSprite {
    
}

@property (nonatomic, assign)BOOL isActive;
@property (nonatomic, assign)BOOL isFiring;

@property (nonatomic, assign)NSInteger type;
- (void)active;

- (BOOL)beenAttack:(int)type;

- (void)fire;

@end
