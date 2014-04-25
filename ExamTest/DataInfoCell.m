//
//  DataInfoCell.m
//  ExamTest
//
//  Created by Louise Namoc on 25/4/14.
//  Copyright (c) 2014 Louise Namoc. All rights reserved.
//

#import "DataInfoCell.h"
#import "DataInfo.h"
#import "UIImageView+AFNetworking.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@implementation DataInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bind:(NSMutableArray *) arr Idx:(NSInteger) idx
{
    
    DataInfo *dataset =(DataInfo *)[arr objectAtIndex:idx];
    [self.descriptionLbl setText:dataset.titleName];
    [self.titleLbl setText:dataset.description];
     NSURL *url = [NSURL URLWithString:dataset.imageHref];
    //[self.imgPic setim]
    //[self.imgPic setImageWithURL:url placeholderImage:[UIImage imageNamed:@"empty.jpg"]];
    [self.imgPic setImageWithURL:url placeholderImage:[UIImage imageNamed:@"empty.jpg"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //[self.imgPic setImageWithURL:url placeholderImage:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //NSURL *url = [NSURL URLWithString:activity.posterPhotoSmall];
    //[self.posterImg setImageWithURL:url placeholderImage:nil];
    
//    NSURL *url = [NSURL URLWithString:activity.posterPhotoSmall];
//    
//    NSString *stringUrl = [url absoluteString];
//    [[AppDelegate instance] cacheImage:(NZCircularImageView*)self.posterImg withURL:stringUrl];
//    
//    NSURL *url2 = [NSURL URLWithString:activity.notificationPhoto];
//    [[AppDelegate instance] setRadius:self.itemPost];
//    [self.itemPost setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"Profile-img_default.png"]];
//    [self.postTime setText:[[AppDelegate instance] convertSecToDate:(NSInteger)activity.notificationDate]];
}


@end
