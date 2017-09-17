//
//  DietaryRestrictionViewController.h
//  unwrApp01
//
//  Created by Neha Parmar on 9/16/17.
//  Copyright © 2017 njrn.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DietaryRestrictionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scanLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITextField *RestrictionsText;
@property (weak, nonatomic) IBOutlet UILabel *noRestrictionLabel;

@end
