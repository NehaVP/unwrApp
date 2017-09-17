//
//  ViewController.h
//  unwrApp01
//
//  Created by Neha Parmar on 9/16/17.
//  Copyright © 2017 njrn.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>
@import Firebase;


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scanLabel;
@property (weak, nonatomic) IBOutlet UIButton *tempButton;
@property (weak, nonatomic) FIRDatabaseReference* ref;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

//@interface APPViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


