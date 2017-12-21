//
//  HelloWorldLayer.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-25.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "Game.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		background = [CCSprite spriteWithFile:@"Image 816 at frame 10.jpg"];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        [background setScale:IOSSCALE];
		// position the label on the center of the screen
		background.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: background];
		
		
		// Achievement Menu Item using blocks
		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"成就" block:^(id sender) {
			
			
			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
			achivementViewController.achievementDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:achivementViewController animated:YES];
			
			[achivementViewController release];
		}
									   ];
        
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"排行榜" block:^(id sender) {
			
			
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
			[leaderboardViewController release];
		}
									   ];
        
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemGetProps = [CCMenuItemFont itemWithString:@"道具" block:^(id sender) {
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
			[leaderboardViewController release];
		}
                                    ];
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemPlay = [CCMenuItemImage itemWithNormalImage:@"Image 822 at frame 10.jpg" selectedImage:@"Image 823 alpha channel at frame 10.png" block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Game scene] withColor:ccBLACK]];
        } ];
		
		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, itemGetProps, itemPlay, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

	}
    
    //创建动画
    telScope = [TeleScope node];
    [telScope setPosition:CGPointMake(80, 60)];
    telScope.opacity = 0;
    [background addChild:telScope];
    
    te = [CCSprite spriteWithFile:@"Image 817 at frame 10.jpg"];
    zhong = [CCSprite spriteWithFile:@"Image 818 at frame 10.jpg"];
    ren = [CCSprite spriteWithFile:@"Image 819 at frame 10.jpg"];
    wu = [CCSprite spriteWithFile:@"Image 820 at frame 10.jpg"];
    [te setPosition:CGPointMake(156/2, 264/2)];
    [zhong setPosition:CGPointMake(156/2+40, 264/2)];
    [ren setPosition:CGPointMake(156/2+80, 264/2)];
    [wu setPosition:CGPointMake(156/2+120, 264/2)];
    [te setOpacity:NO];
    [zhong setOpacity:NO];
    [ren setOpacity:NO];
    [wu setOpacity:NO];
    [background addChild:te];
    [background addChild:zhong];
    [background addChild:ren];
    [background addChild:wu];
    
    hole1 = [CCSprite spriteWithFile:@"Image 824 at frame 10.jpg"];
    hole2 = [CCSprite spriteWithFile:@"Image 824 at frame 10.jpg"];
    hole3 = [CCSprite spriteWithFile:@"Image 824 at frame 10.jpg"];
    hole4 = [CCSprite spriteWithFile:@"Image 824 at frame 10.jpg"];
    [hole1 setOpacity:0];
    [hole2 setOpacity:0];
    [hole3 setOpacity:0];
    [hole4 setOpacity:0];
    [hole1 setPosition:CGPointMake(58, 142)];
    [hole2 setPosition:CGPointMake(58+30, 112)];
    [hole3 setPosition:CGPointMake(226, 105)];
    [hole4 setPosition:CGPointMake(178, 132)];
    [background addChild:hole1];
    [background addChild:hole2];
    [background addChild:hole3];
    [background addChild:hole4];
    
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 1 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 5 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 3 at frame 10.mp3"];
	return self;
}

- (void)onEnterTransitionDidFinish
{
    id actionte = [CCScaleTo actionWithDuration:0.01 scale:0.5];
    id actiontef = [CCFadeIn actionWithDuration:0.1];
    
    id acf = [CCCallFunc actionWithTarget:self selector:@selector(textAnimationDone)];
    id acf3 = [CCCallFunc actionWithTarget:self selector:@selector(textAnimation3Done)];
    seq = [CCSequence actions:actiontef, actionte,acf,  nil];
    [te runAction:seq];
    
    id actiontef2 = [CCFadeIn actionWithDuration:1.1];
    seq2 = [CCSequence actions:actiontef2, acf,  nil];
    
    id deley = [CCDelayTime actionWithDuration:5];
    id move1 = [CCMoveTo actionWithDuration:0.5 position:CGPointMake(220, 70)];
    id move2 = [CCMoveTo actionWithDuration:0.5 position:CGPointMake(88, 150)];
    id move3 = [CCMoveTo actionWithDuration:0.5 position:CGPointMake(80, 60)];
    id rotate1 = [CCRotateTo actionWithDuration:0.7 angle:0.];
    id rotate2 = [CCRotateTo actionWithDuration:0.8 angle:180.];
    id rotate3 = [CCRotateTo actionWithDuration:0.9 angle:360.];
    seq3 = [CCSequence actions:deley, move1, rotate2, rotate3,deley,  move2,deley,  rotate2, move3, rotate1,deley, deley,  acf3, nil];
    [telScope runAction:seq3];
    printf("enter finish");
}

-(void) textAnimation3Done
{
    [telScope stopAllActions];
    [telScope runAction:seq3];
}

-(void) textAnimationDone
{
    if (indexText ==0 ) {
        [background setVisible:YES];
        [te stopAllActions];
        [zhong runAction:seq];
    }else if (indexText ==1 ) {
        [background setVisible:YES];
        [zhong stopAllActions];
        [ren runAction:seq];
    }else if (indexText ==2 ) {
        [background setVisible:YES];
        [ren stopAllActions];
        [wu runAction:seq];
    }else if (indexText == 3)
    {
        [wu stopAllActions];
        [hole1 runAction:seq];
    }else if (indexText == 4)
    {
        [hole1 stopAllActions];
        [hole2 runAction:seq];
    }else if (indexText == 5)
    {
        [hole2 stopAllActions];
        [hole3 runAction:seq];
    }else if (indexText == 6)
    {
        [hole3 stopAllActions];
        [hole4 runAction:seq];
    }
    if(indexText<4)
    {
        [[SimpleAudioEngine sharedEngine] playEffect: @"Sound 5 at frame 10.mp3" ];
        [[SimpleAudioEngine sharedEngine] playEffect: @"Sound 3 at frame 10.mp3" ];
    }else if(indexText<8)
    {
        [[SimpleAudioEngine sharedEngine] playEffect: @"Sound 1 at frame 10.mp3" ];
    }
    indexText ++;
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
