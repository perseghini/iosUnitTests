//
//  AlbumTests.m
//  UnitTester
//
//  Created by Ludovic Perseghini on 10/28/16.
//  Copyright © 2016 LumoBodytech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Album.h"
#import "ExternalAPI.h"
#import "SomeManager.h"

@interface Album ()
@property(retain)SomeManager *someManager;
@end

@interface AlbumTests : XCTestCase

@end

@implementation AlbumTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSaveReturnsTrueIfApiCallIsSuccessful {
    // Arrange
    Album *album = [[Album alloc] init];

    id externalApiMock = OCMClassMock([ExternalAPI class]);
    NSDictionary<NSString*, NSString*>* returnValue = @{@"result":@"OK"};
    OCMStub(ClassMethod([externalApiMock pushData])).andReturn(returnValue);
    
    // Act
    BOOL res = [album save];
    
    // Assert
    XCTAssertTrue(res);

}

- (void)testSaveReturnsFalseIfApiCallIsInError {
    // Arrange
    Album *album = [[Album alloc] init];
    
    id externalApiMock = OCMClassMock([ExternalAPI class]);
    NSDictionary<NSString*, NSString*>* returnValue = @{@"result":@"KO"};
    OCMStub(ClassMethod([externalApiMock pushData])).andReturn(returnValue);
    
    // Act
    BOOL res = [album save];
    
    // Assert
    XCTAssertFalse(res);
    
}

- (void)testSaveDoesntCallsSomeManagerIfApiCallsIsOk {
    // Arrange
    Album *album = [[Album alloc] init];

    id externalApiMock = OCMClassMock([ExternalAPI class]);
    NSDictionary<NSString*, NSString*>* returnValue = @{@"result":@"OK", @"code":@"12"};
    OCMStub(ClassMethod([externalApiMock pushData])).andReturn(returnValue);
    
    id someManagerMock = OCMClassMock([SomeManager class]);
    OCMReject([someManagerMock notify:12]);
    //OCMReject([[someManagerMock ignoringNonObjectArgs] notify:12]);
    album.someManager = someManagerMock;
    
    // Act
    [album save];
    
    // Assert
    // NO Assert, OCMReject will make the test fail
}

- (void)testSaveCallsSomeManagerIfApiCallsIsInErrorWithCorrectCode {
    // Arrange
    Album *album = [[Album alloc] init];
    NSString *errorCode = @"12";
    NSInteger expectedCode = 12;
    
    id externalApiMock = OCMClassMock([ExternalAPI class]);
    NSDictionary<NSString*, NSString*>* returnValue = @{@"result":@"KO", @"code":errorCode};
    OCMStub(ClassMethod([externalApiMock pushData])).andReturn(returnValue);
    
    id someManagerMock = OCMClassMock([SomeManager class]);
    album.someManager = someManagerMock;

    // Act
    [album save];
    
    // Assert
    OCMVerify([someManagerMock notify:expectedCode]);
}


@end
