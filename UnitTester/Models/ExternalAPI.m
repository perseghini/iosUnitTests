//
//  ExternalAPI.m
//  UnitTester
//
//  Created by Ludovic Perseghini on 10/28/16.
//  Copyright © 2016 LumoBodytech. All rights reserved.
//

#import "ExternalAPI.h"

@implementation ExternalAPI
+ (NSDictionary<NSString*, NSString*>*) pushData{
    // Doing some POST...
    return @{
             @"result":@"OK",
             @"data":@"abcd"
            };
}
@end
