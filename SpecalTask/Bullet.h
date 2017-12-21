//
//  Bullet.h
//  SpecalTask
//
//  Created by Xing Yan on 12-10-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bullet : CCSprite {
    
}
+ (CCSprite*) spriteWithSpriteFrame:(CCSpriteFrame*)frame forward:(BOOL)forward;
@end
