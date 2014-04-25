//
//  APILayer.h
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum WEBSERVICETYPE {
    EXERCISE = 1,
    
} APITYPE;

@protocol APILayerDelegate <NSObject>

- (void) apiRequestDidFinished:(APITYPE) apiType withInfo:(id) info;
- (void) apiRequestDidFailed:(APITYPE) apiType withInfo:(id) info;

@end


@interface APILayer : NSObject


@property (nonatomic, strong) id <APILayerDelegate> delegate;

+ (APILayer *) sharedInstance;
- (void) getAllData;

@end
