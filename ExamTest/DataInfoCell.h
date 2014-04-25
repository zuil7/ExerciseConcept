//
//  DataInfoCell.h
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imgPic;

-(void) bind:(NSMutableArray *) arr Idx:(NSInteger) idx;
@end
