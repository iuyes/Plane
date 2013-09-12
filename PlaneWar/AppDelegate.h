//
//  AppDelegate.h
//  PlaneWar
//
//  Created by Bill on 13-8-16.
//  Copyright GetToSet 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

// Added only for iOS 6 support
//for game pause 全局变量
BOOL _isGamePause;

@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
