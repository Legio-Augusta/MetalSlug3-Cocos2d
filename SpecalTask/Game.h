//
//  Game.h
//  SpecalTask
//
//  Created by Xing Yan on 12-10-25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"
#import "Truck.h"
#import "Bullet.h"
#import "Enemy.h"
#import "EnemyBase.h"
#import "Tank.h"

@interface Game : CCLayer
{
    CCLayer *_gameBG;
    Hero *hero;
    Truck *truck;
    int indextruck;
    float accellY;
    NSMutableSet *GameTouches;
    
    CCSpriteFrame *bulletFrame;
    
    float mapOffset;
    NSMutableArray *enemys;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
@property (nonatomic, retain)CCLayer *gameBG;
+(CCScene *) scene;


-(void) truckAnimationDone;
-(void) jumpOutAnimationDone;

- (void)update:(float)dt;
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

- (void)ajustmap:(CGPoint *)p;

- (void)jump;
- (void)fire:(CGPoint)p;


@end
