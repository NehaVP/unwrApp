//
//  AppDelegate.h
//  unwrApp01
//
//  Created by Neha Parmar on 9/16/17.
//  Copyright © 2017 njrn.co. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) FIRDatabaseReference *ref;
//@property (strong, nonatomic) FIRDatabaseReference *commentsRef;


@end

