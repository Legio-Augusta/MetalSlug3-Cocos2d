//
//  Enemy.h
//  SpecalTask
//
//  Created by Xing Yan on 12-11-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyBase.h"
/*敌人*/
@interface Enemy : EnemyBase {
    CCRepeatForever *stillPositionAction, *runAction;
}

- (void)runDeadAnimation;

- (void)checkUpdate;
@end
