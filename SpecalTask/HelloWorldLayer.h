//
//  HelloWorldLayer.h
//  SpecalTask
//
//  Created by Xing Yan on 12-10-25.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "TeleScope.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite *background;
    //特种任务开场动画
    CCSprite *te;
    CCSprite *zhong;
    CCSprite *ren;
    CCSprite *wu;
    
    CCSprite *hole1, *hole2, *hole3, *hole4;
    
    CCSequence *seq, *seq2, *seq3;
    int indexText;
    TeleScope *telScope;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(void) textAnimationDone;

-(void) textAnimation3Done;

@end
