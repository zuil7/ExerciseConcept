//
//  ServiceLayer.h
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APILayer.h"

@protocol ServiceLayerDelegate <NSObject>

- (void) serviceRequestDidFinished:(APITYPE) apiType withInfo:(id) info;
- (void) serviceRequestDidFailed:(APITYPE) apiType withInfo:(id) info;

@end

@interface ServiceLayer : NSObject <APILayerDelegate>

@property (nonatomic, strong) id <ServiceLayerDelegate> delegate;

+ (ServiceLayer *) sharedInstance;
- (void) requestAllData;


@end
