//
//  SomeManager.m
//  UnitTester
//
//  Created by Ludovic Perseghini on 10/28/16.
//  Copyright © 2016 LumoBodytech. All rights reserved.
//

#import "SomeManager.h"

@implementation SomeManager

-(void) notify:(NSInteger)code{
    NSLog(@"notify %ld",(long)code);
}

@end
