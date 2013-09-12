//
//  PauseLayer.m
//  PlaneWar
//
//  Created by Cool on 13-8-21.
//  Copyright (c) 2013年 GetToSet. All rights reserved.
//

#import "PauseLayer.h"


@interface  PauseLayer()
-(void) doRestart;
-(void) doResume;
@end


@implementation PauseLayer
@synthesize delegate;


-(id) init{
    if ((self = [super initWithColor:ccc4(128, 128, 128, 128) width:320 height:480])) {
        CCMenuItem *restartItem = [CCMenuItemFont itemWithString:@"重新开始"
                                                          target:self
                                                        selector:@selector(doRestart)];
        restartItem.position = ccp(160,200);
        
        
        CCMenuItem *resumeItem = [CCMenuItemFont itemWithString:@"继续游戏"
                                                         target:self
                                                       selector:@selector(doResume)];
        resumeItem.position = ccp(160,300);
        
        CustomMenu *menu = [CustomMenu menuWithItems:restartItem,resumeItem, nil];
        menu.position = CGPointZero;
        [self addChild:menu];
        
        self.isTouchEnabled = YES;
    }
    return self;
    
}

-(void) onEnter{
    [super onEnter];
    
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                              priority:kCCMenuHandlerPriority - 1
                                                       swallowsTouches:YES];
}

-(void) onExit{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    
    [super onExit];
}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return YES;
}

#pragma mark - menu callback
-(void) doRestart{
    if ([delegate respondsToSelector:@selector(didRecieveRestartEvent:)]) {
        [self.delegate didRecieveRestartEvent:self];
    }
}

-(void) doResume{
    if ([delegate respondsToSelector:@selector(didRecieveResumeEvent:)]) {
        [self.delegate didRecieveResumeEvent:self];
    }
}

@end


@implementation CustomMenu

-(void) registerWithTouchDispatcher{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                              priority:kCCMenuHandlerPriority - 2
                                                       swallowsTouches:YES];
}

@end
