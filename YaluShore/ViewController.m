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

- (void)viewDidLoad {
    [super viewDidLoad];
    [labelText setStringValue: @"Starting"];
    
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)jailbreakIt:(NSButton *)sender {
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
    NSPipe *input = [NSPipe pipe];
    [task setStandardOutput: pipe];
    [task setStandardInput: input];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        
        NSString *string2 = string;
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            
            [labelText setStringValue: string2];
        }

    );
        
        //NSLog (@"script returned:\n%@", string);
    }
);}


@end
