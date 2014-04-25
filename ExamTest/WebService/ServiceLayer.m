//
//  ServiceLayer.m
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import "ServiceLayer.h"

static ServiceLayer *instance = nil;

@implementation ServiceLayer


+ (ServiceLayer *) sharedInstance
{
    static dispatch_once_t disLock = 0;
    
    if (instance == nil) {
        dispatch_once(&disLock, ^{
            if (instance == nil) {
                NSLog(@"Initializing ServiceLayer");
                instance = [[ServiceLayer alloc] init];
            }
        });
    }
    
    return instance;
}
////////////////////////////////
#pragma mark - Request Data
///////////////////////////////
- (void) requestAllData
{
    APILayer *apiLayer = [[APILayer alloc] init];
    apiLayer.delegate = self;
    [apiLayer getAllData];

}

////////////////////////////////
#pragma mark - ServiceLayer Delegates
///////////////////////////////
- (void) apiRequestDidFinished:(APITYPE) apiType withInfo:(id) info {
    [self.delegate serviceRequestDidFinished:apiType withInfo:info];
}

- (void) apiRequestDidFailed:(APITYPE) apiType withInfo:(id) info {
    [self.delegate serviceRequestDidFailed:apiType withInfo:info];
}

@end
