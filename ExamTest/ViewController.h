//
//  ViewController.h
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ViewController : UIViewController<ServiceLayerDelegate,MBProgressHUDDelegate>

@property (weak, nonatomic) IBOutlet UITableView *dataTbl;
@property (strong,nonatomic) MBProgressHUD *HUD;
@end
