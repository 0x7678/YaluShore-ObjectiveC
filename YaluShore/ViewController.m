//
//  ViewController.m
//  YaluShore
//
//  Created by Michael Vinci on 10/27/15.
//  Copyright © 2015 coned_miro. All rights reserved.
// 

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)jailbreakIt:(NSButton *)sender
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments;
    NSString* newpath = [[NSBundle mainBundle] pathForResource:@"run" ofType:@"sh"];
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
    
    NSLog (@"script returned:\n%@", string);
}


@end
