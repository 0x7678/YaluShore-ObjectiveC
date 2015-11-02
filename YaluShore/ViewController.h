//
//  ViewController.h
//  YaluShore
//
//  Created by Michael Vinci on 10/27/15.
//  Copyright © 2015 coned_miro. All rights reserved.
// 

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {
    NSTextView *outputArea;
}
    
@property (weak, nonatomic) IBOutlet NSButton *jbme;
    
@property (nonatomic, retain) IBOutlet NSTextView *outputArea;
@property (weak) IBOutlet NSScrollView *outputArea2;
@property (weak) IBOutlet NSTextField *labelText;

- (IBAction)jailbreakIt:(NSButton *)sender;


@end

