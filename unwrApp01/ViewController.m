//
//  ViewController.m
//  unwrApp01
//
//  Created by Neha Parmar on 9/16/17.
//  Copyright © 2017 njrn.co. All rights reserved.
//
@class ViewController;
#import "ViewController.h"
@import Firebase;
@import FirebaseDatabase;
@interface ViewController ()

@end

@implementation ViewController

@synthesize ref;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
     */
    
    // Do any additional setup after loading the view, typically from a nib.
    /*Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
    [tesseract recognize];
    NSLog(@"%@", [tesseract recognizedText]);
     */
    G8Tesseract *tesseract = [[G8Tesseract alloc] initWithLanguage:@"eng+ita"];
    tesseract.delegate = self;
    tesseract.image = [[UIImage imageNamed:@"nut11.jpg"] g8_blackAndWhite];
    [tesseract recognize];
    NSLog(@"%@", [tesseract recognizedText]);
    NSString *nutKey= [tesseract recognizedText];
    //NSLog(@"%@", nutKey);
    NSArray *characterBoxes = [tesseract recognizedBlocksByIteratorLevel:G8PageIteratorLevelSymbol];
    NSArray *paragraphs = [tesseract recognizedBlocksByIteratorLevel:G8PageIteratorLevelParagraph];
    NSArray *characterChoices = tesseract.characterChoices;
    UIImage *imageWithBlocks = [tesseract imageWithBlocks:characterBoxes drawText:YES thresholded:NO];
    /*NSCharacterSet* characterSet = [[NSCharacterSet
                                     characterSetWithCharactersInString:nutKey] invertedSet];
    NSString* newString = [[nutKey componentsSeparatedByCharactersInSet:characterSet]
                           componentsJoinedByString:@""];
    NSArray* arrayOfStrings = [newString componentsSeparatedByString:@","];
    NSMutableArray* arrayOfNumbers = [NSMutableArray arrayWithCapacity:arrayOfStrings.count];
    for (NSString* string in arrayOfStrings) {
        [arrayOfNumbers addObject:[NSDecimalNumber decimalNumberWithString:string]];
    }*/
    NSArray *arrayOfNumbers = [nutKey componentsSeparatedByString:@", "];

    
    
    FIRDatabaseReference *_ref = [[FIRDatabase database] reference];
    
    [_ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *postDict = snapshot.value;
        NSUInteger length = [arrayOfNumbers count];
        NSLog(@"%d",length);
        for(int i=0; i<length; i++){
            //NSLog(@"INTO FOOOOOOR LOOOOOOOOOPPPPPPPP");
            //
            NSLog(@"%@",[arrayOfNumbers objectAtIndex:i]);
            for(NSString *key in [postDict allKeys]) {
                //NSLog(@"%@",[postDict objectForKey:key]);
                    if([[arrayOfNumbers objectAtIndex:1] isEqualToString:key]){
                        NSLog(@"true");
                    //For each array of strings that you receive from the firebase database
                    //Check if it includes the word you're looking for
                    }
                }
        }
    }];
    

    //FIRDatabaseQuery *myTestQuery= [ref queryOrderedByChild:@"ARTIFICIAL_SUGAR"];
   // NSLog(@"%@",FIRDatabaseQuery);
    
}
//    - (nonnull FIRDatabaseQuery *)queryEqualToValue:("ARTIFICIAL_SUGAR")value;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)progressImageRecognitionForTesseract:(G8Tesseract*)tesseract{
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
}
- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
 */
@end
