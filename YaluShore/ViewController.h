//
//  ViewController.h
//  YaluShore
//
//  Created by Michael Vinci on 10/27/15.
//  Copyright © 2015 coned_miro. All rights reserved.
// 

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController



@property (weak, nonatomic) IBOutlet NSButton *jbme;
@property (nonatomic, assign) IBOutlet NSTextView *outputText;

- (IBAction)jailbreakIt:(NSButton *)sender;


@end

