//
//  Truck.h
//  SpecalTask
//
//  Created by Xing Yan on 12-10-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
//运兵卡车
@interface Truck : CCSprite {
    //轮子
    CCSprite *caster1, *caster2;
    //窗帘
    CCSprite *curtain1, *curtain2, *curtain3;
    CCSprite *door, *body, *head, *light;
}
- (Truck*) init;

@end
