//
//  Album.m
//  UnitTester
//
//  Created by Ludovic Perseghini on 10/28/16.
//  Copyright © 2016 LumoBodytech. All rights reserved.
//

#import "Album.h"
#import "ExternalAPI.h"
#import "SomeManager.h"

@interface Album()
@property (nonatomic, strong) SomeManager* someManager;
@end

@implementation Album

-(id)init{
    self = [super init];
    if(self){
        self.someManager = [SomeManager new];
    }
    return self;
    
}

-(BOOL)save{
    NSDictionary *res = [ExternalAPI pushData];
    if([res[@"result"] isEqualToString:@"OK"]){
        return YES;
    }
    else{
        NSInteger code = [res[@"code"] integerValue];
        [self.someManager notify:code];
        return NO;
    }
    
}
@end
