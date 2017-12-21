//
//  Game.m
//  SpecalTask
//
//  Created by Xing Yan on 12-10-25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

#import "SimpleAudioEngine.h"


@implementation Game

#define GAMESCALE 1.5

@synthesize gameBG = _gameBG;

static float mapShape[4200];

static float enemysPos[20] =
{
    500, 510, 525, 660, 920, 1030, 1090, 1180, 1315, 1380,
    1570, 1590, 1900, 2150, 2285, 2420, 2610, 2770, 2870, 2970
};

//3600, 4020;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
    if (mapShape[0] == 0)
    {
        for (int i=0; i<4200; i++) {
            if (i>50 && i<120)
                mapShape[i] = 90.+abs(70-i)/2.5;
            else if (i>550 && i< 660)
                mapShape[i] = (90+ (34));
            else if (i>1225 && i< 1296)
                mapShape[i] = (90+ 64);
            else if (i>1295 && i< 1350)
                mapShape[i] = (90+ 130 + i-1320);
            else if (i>1350 && i< 1701)
                mapShape[i] = (90+ 160);
            else if (i>1700 && i< 1761)
                mapShape[i] = (90+ 200);
            else if (i>1760 && i< 1851)
                mapShape[i] = (90+ 240);
            else if (i>1850 && i< 1951)
                mapShape[i] = (90.+ 300. + (i - 1910)/2.);
            else if (i>1950 && i< 2191)
                mapShape[i] = (460+(i-2075)/15.);
            else if (i>2190 && i< 2271)
                mapShape[i] = (470+50.);
            else if (i>2270 && i< 2501)
                mapShape[i] = (450+(2345-i)/4.);
            else if (i>2500 && i< 3221)
                mapShape[i] = (414+(2500-i)/2.222222);
            else
                mapShape[i] = 90;
        }
    }
	CCScene *scene = [CCScene node];
	Game *layer = [Game node];
    [layer setTag:2];
    [layer.gameBG setTag:3];
	[scene addChild: layer z:1];
    [scene addChild:layer.gameBG z:0];
	return scene;
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
    CGSize size = [[CCDirector sharedDirector] winSize];
    int index = 0;
    float xoffset = 0.;
	if( (self=[super init]) ) {
        
        _gameBG = [CCLayer node];
        for (int i=347; i<358; i++)
        {
            if (i == 349 || i == 371)
                i++;
            else if(i == 361)
                i += 2;
            CCSprite * mapcell = [CCSprite spriteWithFile:[NSString stringWithFormat:@"Image %d at frame 10.jpg", i]];
            [mapcell setScale:GAMESCALE];
            [mapcell setTag:11169];
            CGSize sizecell = mapcell.textureRect.size;
            xoffset += sizecell.width/2*GAMESCALE;
            float y = size.height/2;
            if(sizecell.height != 214.5)
            {
                y = size.height/2 + (sizecell.height - 214.5)/2*GAMESCALE;
                if (index == 4) {
                    y += 50 *GAMESCALE;
                }
            }
           
            [mapcell setPosition:CGPointMake(xoffset, y)];
            [mapcell setTag:index];
            index++;
            [_gameBG addChild:mapcell z:0];
            xoffset += sizecell.width/2 *GAMESCALE;
        }
        enemys = [[NSMutableArray alloc]init];
        for (int i= 0; i<20; i++) {
            Enemy *enemy = [Enemy node];
            [enemys addObject:enemy];
            [enemy setPosition:ccp(enemysPos[i], mapShape[(int)enemysPos[i]])];
            enemy.tag = i+10;
            [_gameBG addChild:enemy];
        }
        Tank * tank1 = [Tank node];
        [tank1 setPosition:ccp(3600, mapShape[3600])];
        [_gameBG addChild:tank1];
        [enemys addObject:tank1];
        Tank * tank2 = [Tank node];
        [tank2 setPosition:ccp(4020, mapShape[4020])];
        [_gameBG addChild:tank2];
        [enemys addObject:tank2];
        //3600, 4020;
   }
    
    hero = [Hero getInstance];
    [hero setPosition:CGPointMake(80, 120)];;
    [hero setOpacity:0];
    [hero setScale:GAMESCALE];
    [_gameBG addChild:hero z:1];
    
    truck = [[Truck alloc]init];
    [truck setScale:GAMESCALE];
    [truck setPosition:CGPointMake(-150, 170)];
    [_gameBG addChild:truck z:2];
    
    
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 1 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"Sound 13 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 20 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 21 at frame 10.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 32 at frame 10.mp3"];
    GameTouches = [[NSMutableSet alloc]init];
    bulletFrame = [CCSpriteFrame frameWithTextureFilename:@"Image 779 at frame 10.png" rect:CGRectMake(0, 0, 11.5, 4.5)];
    
    
	return self;
}

- (void)onEnterTransitionDidFinish
{
    
    printf("enter finish");
    id actiontef = [CCDelayTime actionWithDuration:0.6];
    id acf = [CCCallFunc actionWithTarget:self selector:@selector(truckAnimationDone)];
    id acf2 = [CCCallFunc actionWithTarget:self selector:@selector(jumpOutAnimationDone)];
    id action = [CCMoveTo actionWithDuration:1 position:CGPointMake(190,160)];
    id ease = [CCEaseIn actionWithAction:action rate:1];
    id action2 = [CCMoveTo actionWithDuration:1 position:CGPointMake(700,160)];
    id ease2 = [CCEaseOut actionWithAction:action2 rate:1];
    CCSequence *seq = [CCSequence actions:ease, actiontef, actiontef, actiontef, ease2, acf, nil];
    [truck runAction:seq];
    CCSequence *seq1 = [CCSequence actions:acf, actiontef, acf, actiontef, acf2, actiontef, actiontef, actiontef, acf, nil];
    [self runAction:seq1];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Sound 21 at frame 10.mp3"];
    [self scheduleUpdate];
}

-(void) truckAnimationDone
{
    if (indextruck == 0) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"Sound 32 at frame 10.mp3"];
    }else if(indextruck == 1)
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"Sound 21 at frame 10.mp3"];
    }else if (indextruck == 2) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"Sound 32 at frame 10.mp3"];
        [self stopAllActions];
    }
    else if (indextruck == 3) {
        [truck stopAllActions];
        [truck removeFromParentAndCleanup:YES];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Sound 13 at frame 10.mp3"];
        [self setIsAccelerometerEnabled:YES];
        [self setIsTouchEnabled:YES];
        
    }
    indextruck++;
}

-(void) jumpOutAnimationDone
{
    [hero setOpacity:255];
    id action = [CCMoveTo actionWithDuration:0.2 position:CGPointMake(55,140)];
    id ease = [CCEaseIn actionWithAction:action rate:0.2];
    id action2 = [CCMoveTo actionWithDuration:0.2 position:CGPointMake(35,90)];
    id ease2 = [CCEaseOut actionWithAction:action2 rate:0.2];
    id fc = [CCCallFunc actionWithTarget:hero selector:@selector(jumpDownFromTruck)];
    CCSequence *seq = [CCSequence actions:ease, ease2, fc, nil];
    [hero runAction:seq];
}

- (void)update:(float)dt
{
    CGPoint p = hero.position;
    CCLOG(@"攻击:%f, %f", p.x, p.y);
    [self ajustmap:&p];
    if(accellY>0.03)
    {
        [hero setScaleX:-GAMESCALE];
        if (accellY>0.08)
        {
            if (p.x<mapOffset +465 && /*无障碍物*/mapShape[(int)p.x+5]-p.y<20) {
                [hero setPosition:CGPointMake(p.x+3, p.y)];
            }
            [hero run];
        }
    }else if(accellY < -0.03)
    {
        [hero setScaleX:GAMESCALE];
        if (accellY<-0.08)
        {
            if (p.x>mapOffset + 15 && /*无障碍物*/mapShape[(int)p.x-5]-p.y<20) {
                [hero setPosition:CGPointMake(p.x-3, p.y)];
            }
            [hero run];
        }
    }
    if (accellY>-0.08 && accellY <0.08) {
        [hero stop];
    }
    
    //调整地图
    float offsetx = 0;
    p = hero.position;
    if (p.x-mapOffset>120 && p.x<3830) {
        offsetx = p.x- mapOffset - 120;
        [_gameBG setPosition:CGPointMake(_gameBG.position.x-offsetx, _gameBG.position.y)];
        mapOffset += offsetx;
    }
    
    //删除子弹
    p = _gameBG.position;
    for (CCSprite *sprite in [self children]) {
        if (sprite.tag == 851137) {
            CGPoint ps = sprite.position;
            if (ps.y+15 < mapShape[(int)(ps.x-p.x)]+p.y) {// 被障碍物阻挡
                [sprite stopAllActions];
                [sprite removeFromParentAndCleanup:YES];
            } else if (sprite.position.x < 0 || sprite.position.x > 480)// 打到边界以外
            {
                [sprite stopAllActions];
                [sprite removeFromParentAndCleanup:YES];
            } else //打到敌人
            {
                //for ()
            }
        }
    }
    
    for(EnemyBase *enemy in enemys)
    {
        float absluteX = [enemy position].x + p.x;
        if (absluteX< -20) {//删除走过而被遗忘的敌军
            [enemy setTag:-1];
            [enemy removeFromParentAndCleanup:YES];
        }
        if (absluteX >0 && absluteX<500) {
            [enemy active];
        }
    }
}

- (void)ajustmap:(CGPoint *)p
{
    
    if (!hero.isJumping) {
        p->y = mapShape[(int)p->x];
    }
    if (p->y > 180) {
        [_gameBG setPosition:CGPointMake(_gameBG.position.x, 90-p->y+90)];
    }else if(p->y > 90)
    {
        float y=0;
        if(p->y+_gameBG.position.y < 90)
        {
            [_gameBG setPosition:CGPointMake(_gameBG.position.x, 0)];
        }
    }
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    accellY = acceleration.y;
    if (acceleration.x < 0 ) {
        accellY = -accellY;
    }
}
//GameTouches = [[NSMutableSet alloc]init];
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count ==1) {
        [GameTouches addObject:[touches anyObject]];
        if(GameTouches.allObjects.count == 2)
        {
            [self jump];//双指tap
            [GameTouches removeAllObjects];
        }
    }else
    {
        [self jump];//多指tap
    }
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (GameTouches.allObjects.count==1) {
        UITouch *touch = touches.anyObject;
        [self fire:[touch locationInView:touch.view]];//单指tap
    }
    [GameTouches removeAllObjects];
}
- (void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self ccTouchesEnded:touches withEvent:event];
}


- (void)jump
{
    [hero jump:mapShape];
}

- (void)fire:(CGPoint)p
{
    [hero fire];
    CCSprite *spriteBullet = [CCSprite spriteWithFile:@"Image 779 at frame 10.png"];
    CGPoint hp = hero.position;
    [spriteBullet setPosition:CGPointMake(hp.x- mapOffset -30*hero.scaleX, hp.y + _gameBG.position.y+15)];
    //[spriteBullet setScaleY:IOSSCALE];
    [spriteBullet setScale:-hero.scaleX];
    [self addChild:spriteBullet z:2];
    [spriteBullet setTag:851137];
    [spriteBullet runAction:[CCMoveBy actionWithDuration:0.8 position:CGPointMake(hero.scaleX>0?-600:600, 0)]];
    [[SimpleAudioEngine sharedEngine] playEffect:@"Sound 1 at frame 10.mp3"];
}




// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[super dealloc];
}

@end
