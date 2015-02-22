//
//  ViewController.m
//  archiveDemo
//
//  Created by bbu on 2/22/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
        归档对象
     */
//    NSArray *data = @[@"I",@"am",@"a",@"student"];
//    NSString *home = NSHomeDirectory();
//    NSString *path = [home stringByAppendingPathComponent:@"test.arc"];
//    BOOL result = [NSKeyedArchiver archiveRootObject:data toFile:path];
//    if (result) {
//        NSLog(@"%@",home);
//
//    }
//
    /**
     *  解归档
     *
     *  @return <#return value description#>
     */
//    NSString *home = NSHomeDirectory();
//    NSString *path = [home stringByAppendingPathComponent:@"test.arc"];
//    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    NSLog(@"%@",data);
    
    
    /**
     *  归档
     *
     *  @return <#return value description#>
     */
    NSString *home = NSHomeDirectory();
    NSLog(@"%@",home);
    NSString *path = [home stringByAppendingPathComponent:@"custome.arc"];
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]
                                initForWritingWithMutableData:data];
    
    [archive encodeFloat:50.0 forKey:@"weight"];
    [archive encodeObject:@"jack" forKey:@"name"];
    [archive finishEncoding];
    BOOL success = [data writeToFile:path atomically:YES];
    if (success) {
        //success
    }
    
    NSData *content = [NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc]
                                    initForReadingWithData:content];
    
    float weight = [unarchive decodeFloatForKey:@"weight"];
    NSString *name = [unarchive decodeObjectForKey:@"name"];
                      
                      
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
