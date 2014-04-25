//
//  APILayer.m
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import "APILayer.h"
#import "APIObject.h"
#import "DataInfo.h"
@interface APILayer() {
    AFHTTPRequestOperationManager *operationManager;
    APITYPE m_apiType;
}

@end

static APILayer *instance = nil;

@implementation APILayer

+ (APILayer *) sharedInstance
{
    static dispatch_once_t disLock = 0;
    
    if (instance == nil) {
        dispatch_once(&disLock, ^{
            if (instance == nil) {
                NSLog(@"Initializing APILayer");
                instance = [[APILayer alloc] init];
            }
        });
    }
    
    return instance;
}


////////////////////////////////
#pragma mark - Request Data
///////////////////////////////
- (void) getAllData
{
    operationManager = [AFHTTPRequestOperationManager manager];
    
    
    NSString *const BaseURLString =  APIURL;
    
    NSLog(@"BaseURLString %@",BaseURLString);
    
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    [requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Accept"];
    [requestSerializer setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
    
    operationManager.requestSerializer = requestSerializer;
    operationManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [operationManager GET:BaseURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"responseObjectMSG %@",responseObject);
         [self parseUserMsg:responseObject];
     }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [self didFailError:m_apiType withError:[error localizedDescription]];
         
     }];
}
////////////////////////////////
#pragma mark - Parse Msg
///////////////////////////////

- (void) parseUserMsg:(NSDictionary *) dictionary {
    
    //NSLog(@"dictionary %@",dictionary);
    
    APIObject *apiObject = [[APIObject alloc] init];
    if ([dictionary objectForKey:@"rows"])
    {
        NSArray *array = [dictionary objectForKey:@"rows"];
        NSLog(@"Array %@",array);
        NSMutableArray *arrmResults = [[NSMutableArray alloc] init];
        for (NSDictionary *dictResults in array)
        {
            DataInfo *pm = [[DataInfo alloc] init];
            if ([dictResults objectForKey:@"description"] != [NSNull null])
            {
                pm.description = [dictResults objectForKey:@"description"];
            }
            if ([dictResults objectForKey:@"imageHref"] != [NSNull null])
            {
                pm.imageHref = [dictResults objectForKey:@"imageHref"];
            }
            if ([dictResults objectForKey:@"title"] != [NSNull null])
            {
                pm.titleName = [dictResults objectForKey:@"title"];
            }
            
            [arrmResults addObject:pm];
        }
        NSLog(@"arrmResults %@",arrmResults);
        apiObject.m_object = arrmResults;
        apiObject.dTitle=[dictionary objectForKey:@"title"];
        [self.delegate apiRequestDidFinished:m_apiType withInfo:apiObject];
    }else
    {
        [self didFailError:m_apiType withError:nil];
    }

}
- (void) didFailError:(APITYPE) apiType withError:(id) error {
    [self.delegate apiRequestDidFailed:apiType withInfo:error];
}
@end
