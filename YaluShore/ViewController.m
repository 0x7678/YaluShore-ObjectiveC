//
//  ViewController.m
//  YaluShore
//
//  Created by Michael Vinci on 10/27/15.
//  Copyright © 2015 coned_miro. All rights reserved.
// 

#import "ViewController.h"

@implementation ViewController
@synthesize outputArea, outputArea2;
@synthesize labelText;

int step = 1;

- (void)viewDidLoad {
    step = 1;
    [super viewDidLoad];
    [labelText setStringValue: @"Starting"];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)jailbreakIt:(NSButton *)sender {
    if (step == 1) {
        
        [labelText setStringValue: @"Running in background, sit tight!"];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            NSTask *task;
            task = [[NSTask alloc] init];
            [task setLaunchPath: @"/bin/sh"];
    
            NSArray *arguments;
            NSString* newpath = [[NSBundle mainBundle] pathForResource:@"yalu-master/run" ofType:@"sh"];
            NSLog(@"shell script path: %@",newpath);
            arguments = [NSArray arrayWithObjects:newpath, nil];
            [task setArguments: arguments];
    
            NSPipe *pipe;
            pipe = [NSPipe pipe];
            [task setStandardOutput: pipe];
    
            NSFileHandle *file;
            file = [pipe fileHandleForReading];
        
            [task launch];
    
            NSData *data;
            data = [file readDataToEndOfFile];
    
            NSString *string;
            string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
 
            NSLog(@"string = %@",string);
        
            dispatch_async(dispatch_get_main_queue(), ^(void){
            
                [labelText setStringValue: string];
            } );
        
        } );
        
        [labelText setStringValue: @"When device has restarted, press button!"];
        step = 2;
    }
}


@end
